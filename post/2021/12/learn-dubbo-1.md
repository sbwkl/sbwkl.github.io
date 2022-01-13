# Dubbo 源码学习

前段时间和同事聊天，聊起 dubbo 的泛化调用是怎么实现的，想着用了这么久的 dubbo 框架似乎没有好好看过它的源码，有点说不过去。

Dubbo 是一款高性能，基于 java 开源的 RPC 框架。RPC 是进程间通讯（IPC）的一种，目的是为了把复杂的业务功能拆分到不同的进程，每个进程负责维护各自的功能。

我选了 Dubbo-2.7.15 版本的源码学习，主要学习了两块内容。

+ 扩展点加载机制
+ RPC 过程
  + 生产者 export 服务
  + 消费者 refer 服务
  + 消费者 invoke

## 扩展点加载机制

在 2.x 和 3.0 的文档里都有介绍，dubbo 运行的基础。

+ 2.x https://dubbo.apache.org/zh/docsv2.7/dev/spi
+ 3.0 https://dubbo.apache.org/zh/docs/concepts/extensibility

为什么会有这个机制，在文档里有介绍。

> 一般来说，系统会采用 Factory、IoC、OSGI 等方式管理扩展(插件)生命周期。考虑到 Dubbo 的适用面，不想强依赖 Spring 等 IoC 容器。 而自己造一个小的 IoC 容器，也觉得有点过度设计，所以选择最简单的 Factory 方式管理扩展(插件)。在 Dubbo 中，所有内部实现和第三方实现都是平等的。

为什么没用 JDK 标准的 SPI 文档里也有介绍。

> Dubbo 的扩展点加载从 JDK 标准的 SPI (Service Provider Interface) 扩展点发现机制加强而来。
> + JDK 标准的 SPI 会一次性实例化扩展点所有实现，如果有扩展实现初始化很耗时，但如果没用上也加载，会很浪费资源。
> + 如果扩展点加载失败，连扩展点的名称都拿不到了。
> + 增加了对扩展点 IoC 和 AOP 的支持，一个扩展点可以直接 setter 注入其它扩展点。

相当于是青春版 spring 容器，最核心的类是 ExtensionLoader。这类框架的功能是获取装配好的 bean 对象，基本用法是

```
Protocol PROTOCOL = ExtensionLoader
    .getExtensionLoader(Protocol.class)
    .getAdaptiveExtension();
```

这段代码的意思是获取 Protocol 扩展点的适配类对象。Dubbo 设置的扩展点，有一堆实现类，有一个特殊实现类被标记上 @Adaptive 注解，表示它是适配类，上面的代码会获取这个的对象。如果所有实现都没有标记上 @Adaptive 注解，那么系统会动态生成一个。

Protocol 有 SPI 注解（SPI 可以指定默认值），是其中一个扩展点，有很多不同协议的实现，比如 DubboProtocol, RestProtocol 等，它的适配类就是动态生成的，大概长这个样子

```
...
public class Protocol$Adaptive implements Protocol {
    ...
    public Exporter export(Invoker arg0) throws RpcException {
        ...
        String extName = (url.getProtocol() == null 
            ? "dubbo" : url.getProtocol());
        ...
        Protocol extension = ExtensionLoader
            .getExtensionLoader(Protocol.class)
            .getExtension(extName);
        return extension.export(arg0);
    }

    public Invoker refer(Class arg0, URL arg1)
            throws RpcException {
        ...
        String extName = (url.getProtocol() == null 
            ? "dubbo" : url.getProtocol());
        ...
        Protocol extension = 
            .getExtensionLoader(Protocol.class)
            .getExtension(extName);
        return extension.refer(arg0, arg1);
    }
}
```

也就是说最后拿到的 protocol 对象是这个类 Protocol$Adaptive 的对象，这就是为什么 debug 代码的时候有时会进到虚空里面，因为这个类都是代码跑起来后生成的，肯定没源码。

这个方法前半截很简单，根据 type 也就是扩展点类型，从 Map 中取对应的 loader 如果没有就 new 一个。构造方法里有个递归调用，因为要赋值 objectFactory 属性，这个属性又是通过 ExtensionLoader 获取的。

```
private ExtensionLoader(Class<?> type) {
    this.type = type;
    objectFactory =
            (type == ExtensionFactory.class 
            ? null : ExtensionLoader
                .getExtensionLoader(ExtensionFactory.class)
                .getAdaptiveExtension());
}
```

这里拿到的 objectFactory 是 AdaptiveExtensionFactory 对象，因为这个类有 @Adaptive 注解。

getAdaptiveExtension 方法创建适配类单例对象，这个模式在后面的很多方法中都有使用。它从 Holder 中取 Adaptive 如果不存在就通过 createAdaptiveExtension 创建

```
public T getAdaptiveExtension() {
    Object instance = cachedAdaptiveInstance.get();
    if (instance == null) {
        ...
        instance = createAdaptiveExtension();
        cachedAdaptiveInstance.set(instance);
        ...
    }
    return (T) instance;
}

```

方法 getAdaptiveExtension 的流程是：读取配置文件 ==> 缓存扩展实现类 ==> 缓存/生成适配类 ==> newInstance 实例化适配类 ==> IOC 注入依赖属性

+ loadExtensionClasses 完成读取配置、缓存扩展实现类
+ createAdaptiveExtensionClass 动态生成适配类
+ injectExtension 注入依赖属性。

loadExtensionClasses 通过 loadResource 读取配置文件的内容，逐行解析。dubbo 对原生的 SPI 做了增强，配置文件支持 KV 形式定义，源码体现为 int i = line.indexOf('=') 然后把配置分成 name 和 clazz 两部分。

loadClass 把加载到 class 分类

+ 带有 Adaptive 注解的是 AdaptiveClass 赋值给 cachedAdaptiveClass
+ 包装类添加到 cachedWrapperClasses 集合
+ 其他的类都放到 extensionClasses 里，最后被缓存到 cachedClasses。

```
private void loadClass(Map<String, Class<?>> extensionClasses, java.net.URL resourceURL, Class<?> clazz, String name,
                        boolean overridden) throws NoSuchMethodException {
    ...
    if (clazz.isAnnotationPresent(Adaptive.class)) {
        cacheAdaptiveClass(clazz, overridden);
    } else if (isWrapperClass(clazz)) {
        cacheWrapperClass(clazz);
    } else {
        ...
        for (String n : names) {
            cacheName(clazz, n);
            saveInExtensionClass(extensionClasses, clazz, n, overridden);
        }
    }
}
```

createAdaptiveExtensionClass 在没有加载到适配类的时候执行，用 String 编译一个 Class 出来，这里打个断点可以查看 code 看看生成的代码长啥样。
```
private Class<?> createAdaptiveExtensionClass() {
    String code = new AdaptiveClassCodeGenerator(type, cachedDefaultName).generate();
    ClassLoader classLoader = findClassLoader();
    org.apache.dubbo.common.compiler.Compiler compiler =
            ExtensionLoader.getExtensionLoader(org.apache.dubbo.common.compiler.Compiler.class).getAdaptiveExtension();
    return compiler.compile(code, classLoader);
}
```

适配类初始化后通过 injectExtension 注入依赖属性。

```
private T injectExtension(T instance) {
    ...
    for (Method method : instance.getClass().getMethods()) {
        if (!isSetter(method)) {
            continue;
        }
        if (method.getAnnotation(DisableInject.class) != null) {
            continue;
        }
        Class<?> pt = method.getParameterTypes()[0];
        if (ReflectUtils.isPrimitives(pt)) {
            continue;
        }
        ...
        String property = getSetterProperty(method);
        Object object = objectFactory.getExtension(pt, property);
        if (object != null) {
            method.invoke(instance, object);
        }
        ...

    }
    ...
    return instance;
}

```


逻辑是遍历所有方法，过滤出 set 开头，没有 DisableInject 注解，且参数不是基本类型（String、Boolean 这些也不算）的方法，然后取出属性名。根据属性名从 objectFactory 获取对象，注入到对应的属性，这里获取的对象也是适配类对象，到此适配类对象的装配过程结束。


适配类可以看成是一个分发器，通过参数把请求分发到具体的实现类，比如 Protocol 适配类根据参数 url.getProtocol() 分发请求。

```
String extName = (url.getProtocol() == null 
    ? "dubbo" : url.getProtocol());
Protocol extension = ExtensionLoader
    .getExtensionLoader(Protocol.class)
    .getExtension(extName);
```

方法 getExtension 的流程是：读取配置文件 ==> 缓存扩展实现的类 ==> 实例化对应的扩展类 ==> IOC 依赖属性注入 ==> AOP 生成包装类。和 getAdaptiveExtension 很类似，多了 AOP 包装，包装类实例化后也要注入依赖属性。

```
private T createExtension(String name, boolean wrap) {
    Class<?> clazz = getExtensionClasses().get(name);
    ...
    T instance = (T) EXTENSION_INSTANCES.get(clazz);
    ...
    injectExtension(instance);

    if (wrap) {
        ...
        for (Class<?> wrapperClass : wrapperClassesList) {
            ...
            instance = injectExtension((T) wrapperClass.getConstructor(type).newInstance(instance));
        }
    }
    ...
}

```

这里体现 dubbo SPI 机制增强：按需加载，IOC，AOP。

包装类用的装饰器模式，有点像俄罗斯套娃。

ExtensionLoader 的逻辑大概就这些，看过源码后发现还挺好理解的。这个扩展点加载机制单独拿出来也能用，当做是 JDK SPI 的增强功能使用，不过日常工作中有 spring 这个大杀器在，用的场景也不多。

## RPC 过程

参数 URL 基本贯穿整个 RPC 过程，这里可以把 URL 理解成 Map，以 KV 的形式保存各种各样的配置，然后代码不断的读取和修改配置，也正因为 URL 贯穿整个过程，而扩展点又是根据 URL 的值来确定的，从而把各个扩展点串了起来。

### 生产者 export 服务

项目 dubbo-demo > dubbo-demo-api > dubbo-demo-api-provider 下的 Application 类，是官方的 demo 类，很适合 debug 代码。


官方有 export 的时序图，可以帮助理解源码。

![](dubbo-export.jpg)


ServiceConfig#export 是入口方法，前半段做参数校验、一些不知道干啥的操作到 doExportUrlsFor1Protocol 方法

```
private void doExportUrlsFor1Protocol(ProtocolConfig protocolConfig, List<URL> registryURLs, int protocolConfigNum) {
    String name = protocolConfig.getName();
    ...

    for (URL registryURL : registryURLs) {
        ...
        Invoker<?> invoker = PROXY_FACTORY.getInvoker(ref, (Class) interfaceClass,
                registryURL.addParameterAndEncoded(EXPORT_KEY, url.toFullString()));
        DelegateProviderMetaDataInvoker wrapperInvoker = new DelegateProviderMetaDataInvoker(invoker, this);
        Exporter<?> exporter = PROTOCOL.export(wrapperInvoker);
        exporters.add(exporter);
    }
    ...
}
```

遍历注册中心地址，逐个暴露服务，主要逻辑有两个

+ PROXY_FACTORY 生成 invoker
+ PROTOCOL 暴露服务

第一步 PROXY_FACTORY 根据扩展点加载机制拿到适配类（动态生成的），适配类根据 proxy 选取合适扩展点实现，这里是 null 选取的是默认扩展实现，也就是 JavassistProxyFactory（org.apache.dubbo.rpc.ProxyFactory 里配置）。它生成一个 Wrapper 类，然后把 doInvoker 方法委托给 Wapper#invokeMethod 方法。

```
public <T> Invoker<T> getInvoker(T proxy, Class<T> type, URL url) {
    // TODO Wrapper cannot handle this scenario correctly: the classname contains '$'
    final Wrapper wrapper = Wrapper.getWrapper(proxy.getClass().getName().indexOf('$') < 0 ? proxy.getClass() : type);
    return new AbstractProxyInvoker<T>(proxy, type, url) {
        @Override
        protected Object doInvoke(T proxy, String methodName,
                                    Class<?>[] parameterTypes,
                                    Object[] arguments) throws Throwable {
            return wrapper.invokeMethod(proxy, methodName, parameterTypes, arguments);
        }
    };
}
```

生成的 Wrapper 类反编译过来大概长这样。这段代码可以通过这种方式拿到：在 ClassGenerator#toClass(ClassLoader, ProtectionDomain) 这个方法返回前打断点。然后在 watches 里执行 mCtc.writeFile() 可以把将要生成的 class 保存在本地，然后用 IDE 或者反编译软件打开。

```
...
public class Wrapper1 extends Wrapper implements DC {
    ...
    public Object invokeMethod(Object var1, String var2, Class[] var3, Object[] var4) throws InvocationTargetException {
        DemoServiceImpl var5;
    
        var5 = (DemoServiceImpl)var1;
        ...
        if ("sayHelloAsync".equals(var2) && var3.length == 1) {
            return var5.sayHelloAsync((String)var4[0]);
        }

        if ("sayHello".equals(var2) && var3.length == 1) {
            return var5.sayHello((String)var4[0]);
        }
        ...
    }
}
```

其他的都不重要，只要看 invokeMethod 方法。从反编译代码可以看到，这里本质就是调用的本地的 DemoServiceImpl 的对应的 sayHello 和 sayHelloAsync 方法。换句话说当执行 Inovker#invoke(invocation) 其实就是调用了 proxy 中的某个方法，至于是哪个方法，由 invocation#getMethodName() 决定。而这个 proxy 就是 ServiceConfig 的 ref 属性，DemoServiceImpl 的对象。

第二步 PROTOCOL 把 invoker 暴露成 exporter。

同理 PROTOCOL 拿到的是适配类（动态生成），这里需要注意一点，此时 invoker 保存的 URL 是 registry://...&export=dubbo%3A%2F%2F...&pid=55468... 这样的格式，所以协议是 registry 而不是 dubbo（dubbo 协议在后面的 export 参数里），根据配置是 InterfaceCompatibleRegistryProtocol，会被 ProtocolFilterWrapper 和 ProtocolListenerWrapper 装饰，所以这两个类的 export 和 refer 方法里有个 UrlUtils.isRegistry(url) 判断当前是什么协议。

InterfaceCompatibleRegistryProtocol 没有重写 export 方法，用的是 RegistryProtocol 的实现

```
public <T> Exporter<T> export(final Invoker<T> originInvoker) throws RpcException {
    URL registryUrl = getRegistryUrl(originInvoker);
    URL providerUrl = getProviderUrl(originInvoker);
    ...
    final ExporterChangeableWrapper<T> exporter = doLocalExport(originInvoker, providerUrl);
    ...
    return new DestroyableExporter<>(exporter);
}

private <T> ExporterChangeableWrapper<T> doLocalExport(final Invoker<T> originInvoker, URL providerUrl) {
    String key = getCacheKey(originInvoker);
    return (ExporterChangeableWrapper<T>) bounds.computeIfAbsent(key, s -> {
        Invoker<?> invokerDelegate = new InvokerDelegate<>(originInvoker, providerUrl);
        return new ExporterChangeableWrapper<>((Exporter<T>) protocol.export(invokerDelegate), originInvoker);
    });
}
```
computeIfAbsent 根据 javadoc 描述，如果 key 对应的 value 存在则返回， 否则根据 Function 创建对象。这里的 url 替换为了 providerUrl 也就是 dubbo://... 格式的，这里的 protocol 根据扩展点加载机制可知是 Protocol$Adaptive 也就是适配类。这次会调用到 DubboProtocol 了。新生成的 invoker 和原始的 originInvoker 会都保存在 ExporterChangeableWrapper 返回给 ServiceConfig 最后缓存在 exporters 对象里。

DubboProtocol 也会被 ProtocolFilterWrapper 和 ProtocolListenerWrapper 装饰，ProtocolFilterWrapper 这次总算干点事了，会按照标准的责任链模式把 filter 构建成新的 invoker，ProtocolListenerWrapper 好像依然打酱油，啥事没干。

```
private static <T> Invoker<T> buildInvokerChain(final Invoker<T> invoker, String key, String group) {
    Invoker<T> last = invoker;
    List<Filter> filters = ExtensionLoader.getExtensionLoader(Filter.class).getActivateExtension(invoker.getUrl(), key, group);

    if (!filters.isEmpty()) {
        for (int i = filters.size() - 1; i >= 0; i--) {
            final Filter filter = filters.get(i);
            last = new FilterNode<T>(invoker, last, filter);
        }
    }

    return last;
}
```

通过 ExtensionLoader 得到所有激活的 filters。然后把 filter 倒序遍历，用 FilterNode 包装 filter 最后得到类似这样的结构

![](dubbo-filter-construct.jpg)

每个 FilterNode 持有下一个 FilterNode 的引用，上图中的 next。这样就把何时中断调用的控制权交给了 filter，只要 filter 不调用 next.invoke(invocation) 那么调用就终止了。

最后是 DubboProtocol 的 export 方法

```
public <T> Exporter<T> export(Invoker<T> invoker) throws RpcException {
    URL url = invoker.getUrl();

    String key = serviceKey(url);
    DubboExporter<T> exporter = new DubboExporter<T>(invoker, key, exporterMap);
    exporterMap.addExportMap(key, exporter);
    ...
    openServer(url);
    ...
}
```

export 方法创建 exporter 对象，缓存到 exporterMap。key 由 4 部分组成 port, path(interface), version, group 也就是这 4 个要素唯一确定一个服务，port 是固定的，所以 interface, version, group 唯一确定。

openServer 调用 createServer 打开监听端口，等待消费者消息。

```
private ProtocolServer createServer(URL url) {
    ...
    ExchangeServer server;
    try {
        server = Exchangers.bind(url, requestHandler);
    } catch (RemotingException e) {
        throw new RpcException("Fail to start server(url: " + url + ") " + e.getMessage(), e);
    }
    ...
    return new DubboProtocolServer(server);
}
```
生产者收到消费者的消息由 requestHandler 来处理。reply 方法根据 invocation 提供的参数从 exporterMap 找对应的 exporter 再找到对应的 invoker 然后执行。

### 消费者 refer 服务

官方也有时序图
![](dubbo-refer.jpg)

ReferenceConfig.get 是入口方法，检查一系列配置，然后调用 createProxy 创建代理类。

```
public synchronized T get() {
    ...
    if (ref == null) {
        init();
    }
    return ref;
}

public synchronized void init() {
    ...
    ref = createProxy(map);
    ...
}

private T createProxy(Map<String, String> map) {
    ...
    invoker = REF_PROTOCOL.refer(interfaceClass, urls.get(0));
    return (T) PROXY_FACTORY.getProxy(invoker, ProtocolUtils.isGeneric(generic));
}

```

createProxy 主要有 2 个步骤

+ 创建 invoker 对象
+ 创建 ref 代理类

第一步根据扩展点加载机制 REF_PROTOCOL 拿到的是 Protocol 适配类，此时 url 是 registry 协议，调用 InterfaceCompatibleRegistryProtocol#refer 方法（实际会调用到 RegistryProtocol）。

```
public <T> Invoker<T> refer(Class<T> type, URL url) throws RpcException {
    url = getRegistryUrl(url);
    Registry registry = getRegistry(url);
    ...
    Cluster cluster = Cluster.getCluster(qs.get(CLUSTER_KEY));
    return doRefer(cluster, registry, type, url, qs);
}

protected <T> Invoker<T> doRefer(Cluster cluster, Registry registry, Class<T> type, URL url, Map<String, String> parameters) {
    URL consumerUrl = new URL(CONSUMER_PROTOCOL, parameters.remove(REGISTER_IP_KEY), 0, type.getName(), parameters);
    ClusterInvoker<T> migrationInvoker = getMigrationInvoker(this, cluster, registry, type, url, consumerUrl);
    return interceptInvoker(migrationInvoker, url, consumerUrl);
}
```

getRegistryUrl 把 url 从 registry:// 转成对应的注册中心地址，这里是 zookeeper://... 然后 getRegistry 获得 ZookeeperRegistry。

在通过 getCluster 获得 cluster 默认是 FailoverCluster，doRefer 返回 ServiceDiscoveryMigrationInvoker。这几个套娃的 Invoker 也不知道干啥用的，看名字难道是搞什么迁移用的？兜兜转转调用到 InterfaceCompatibleRegistryProtocol.getInvoker 方法

```
public <T> ClusterInvoker<T> getInvoker(Cluster cluster, Registry registry, Class<T> type, URL url) {
    DynamicDirectory<T> directory = new RegistryDirectory<>(type, url);
    return doCreateInvoker(directory, cluster, registry, type);
}
```
然后会调用 registry.subscribe 我用的是 zookeeper 当做注册中心会进入 ZookeeperRegistry

```
public void doSubscribe(final URL url, final NotifyListener listener) {
    ...
    for (String path : toCategoriesPath(url)) {
        ...
        zkClient.create(path, false);
        List<String> children = zkClient.addChildListener(path, zkListener);
        ...
    }
    notify(url, listener, urls);
    ...
}
```

根据 url 和 listener 确定 zkListener，然后给 zk 添加监听器，url 变化或者订阅都会调用 notify 方法，初次订阅也会 notify 一次。

notify 方法有一大堆逻辑，最后调用 AbstractProtocol#refer 方法，DubboProtocol 没重写 refer 方法。

```
public <T> Invoker<T> refer(Class<T> type, URL url) throws RpcException {
    return new AsyncToSyncInvoker<>(protocolBindingRefer(type, url));
}
...
private ExchangeClient initClient(URL url) {
    ...
    client = Exchangers.connect(url, requestHandler);
}
```

DubboProtocol 根据 url 的信息创建 client 用来和生产者交换消息，到这里 invoker 创建完成。


第二步 invoker 创建成功后 PROXY_FACTORY 调用 StubProxyFactoryWrapper#getProxy 方法创建代理类，又是动态创建。

```
public <T> T getProxy(Invoker<T> invoker, boolean generic) throws RpcException {
    Set<Class<?>> interfaces = new HashSet<>();
    ...
    interfaces.add(invoker.getInterface());
    interfaces.addAll(Arrays.asList(INTERNAL_INTERFACES));

    return getProxy(invoker, interfaces.toArray(new Class<?>[0]));
}

public <T> T getProxy(Invoker<T> invoker, Class<?>[] interfaces) {
    return (T) Proxy.getProxy(interfaces).newInstance(new InvokerInvocationHandler(invoker));
}
```

默认情况下生成的代理会实现 invoker.getInterface(), EchoService, Destroyable 这 3 个接口，泛化调用额外多实现 GenericService 接口，URL 里的 interfaces 属性可以也可以手动指定需要实现的接口，所有的接口会放在 interfaces 集合里，然后通过方法 Proxy.getProxy(interfaces) 生成一个 Proxy 子类，反编译过来大概长这样

```
...
public class Proxy0 extends Proxy implements DC {
    public Object newInstance(InvocationHandler var1) {
        return new proxy0(var1);
    }

    public Proxy0() {
    }
}

public class proxy0 implements DC, EchoService, Destroyable, DemoService {
    public static Method[] methods;
    private InvocationHandler handler;

    public void $destroy() {
        Object[] var1 = new Object[0];
        this.handler.invoke(this, methods[0], var1);
    }

    public String sayHello(String var1) {
        Object[] var2 = new Object[]{var1};
        Object var3 = this.handler.invoke(this, methods[1], var2);
        return (String)var3;
    }

    public CompletableFuture sayHelloAsync(String var1) {
        Object[] var2 = new Object[]{var1};
        Object var3 = this.handler.invoke(this, methods[2], var2);
        return (CompletableFuture)var3;
    }

    public Object $echo(Object var1) {
        Object[] var2 = new Object[]{var1};
        Object var3 = this.handler.invoke(this, methods[3], var2);
        return (Object)var3;
    }

    public proxy0() {
    }

    public proxy0(InvocationHandler var1) {
        this.handler = var1;
    }
}
```

这里很坑爹，这两个类命名超级像，唯一的差别是一个 P 大写，一个 p 小写。用 mCtc.writeFlie() 保存文件的时候 window 又不区分大小写，直接覆盖了，搞得我还以为是一个类，就纳了闷了这个类里面啥都没有，那实例化起来有个屁用。

proxy0 实现所有传入的接口，每个方法的实现都是委托给 InvocationHandler 对象，就是构造函数里传入的 InvokerInvocationHandler，这样在调用 DemoService#sayHello 的时候实际上会调用 InvokerInvocationHandler#invoke 方法。

最终把这个对象赋值给 ref，消费端的 refer 过程就结束。

### 消费者 invoke

当消费者调用 sayHello 方法时实际是调用 invoke 方法，把所有参数拼装到 invocation 发送给生产者。

```
public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
    ...
    RpcInvocation rpcInvocation = new RpcInvocation(method, invoker.getInterface().getName(), protocolServiceKey, args);
    String serviceKey = invoker.getUrl().getServiceKey();
    rpcInvocation.setTargetServiceUniqueName(serviceKey);
    ...
    return invoker.invoke(rpcInvocation).recreate();
}
```
初始化 RpcInvocation 然后一层一层向里面调用，到 MockClusterInvoker 的时候可以看到 mock 功能的实现，到 AbstractClusterInvoker 的时候可以看到 loadbalance 的实现，到 FailoverClusterInvoker 的时候可以看到故障转移的实现，到 InvokerWrapper 会挨个调用 filter 最后到 DubboInvoker。

```
protected Result doInvoke(final Invocation invocation) throws Throwable {
    ...
    ExecutorService executor = getCallbackExecutor(getUrl(), inv);
    CompletableFuture<AppResponse> appResponseFuture =
            currentClient.request(inv, timeout, executor).thenApply(obj -> (AppResponse) obj);
    FutureContext.getContext().setCompatibleFuture(appResponseFuture);
    AsyncRpcResult result = new AsyncRpcResult(appResponseFuture, inv);
    result.setExecutor(executor);
    return result;
    ...
}

```
dubbo 通过 ExchangeClient（默认是 netty4）交换消息，用 DefaultFuture 管理所有的请求/响应，每个请求有一个 id 对应一个 DefaultFuture 保存在静态变量 DefaultFuture.FUTURES。

doInvoke 返回 AsyncRpcResult，调用 recreate 会阻塞，等待结果返回。

request 创建 DefaultFuture 对象，保存到 DefaultFuture.FUTURES，同时把 request 写入 channel 生产者监听到 request 处理并返回。

生产者返回消息，调用 NettyClientHandler#channelRead 方法（refer 时设置），然后再调用 AllChannelHandler#received。

```
public void received(Channel channel, Object message) throws RemotingException {
    ExecutorService executor = getPreferredExecutorService(message);
    try {
        executor.execute(new ChannelEventRunnable(channel, handler, ChannelState.RECEIVED, message));
    } catch (Throwable t) {
        ...
    }
}
```
HeaderExchangeHandler#received 方法
```

public void received(Channel channel, Object message) throws RemotingException {
    if (message instanceof Request) {
        ...
    } else if (message instanceof Response) {
        handleResponse(channel, (Response) message);
    }
    ...
}
```
调用 DefaultFuture#received 把返回值设置给对应的 DefaultFuture。
```
public static void received(Channel channel, Response response, boolean timeout) {
    ...
    DefaultFuture future = FUTURES.remove(response.getId());
    ...
    future.doReceived(response);
    ...
}
```

这样 AsyncRpcResult 里就有生产者返回的结果了，dubbo 调用流程结束。

回顾最开头的问题，dubbo 的泛化调用是怎么实现的，2.7.15 版本是通过 GenericFilter 实现的，泛化调用第一个入参肯定是方法名，这个 filter 修改 invocation 参数，设置正确的方法名就够了。之前的版本我印象中代码写在消费者，逻辑差不多。

通过这次源码学习 get 到了几个不错的点

1. Dubbo 用的策略模式和适配类这个想法，在日常工作中应该用得上，保证代码看起来语义统一
2. Filter 责任链那一块不错的代码样板，要用的时候去那边拷贝
3. 动态生成类对重复搬砖类的工作提供了一个不错的思路，既有挑战又能更好维护