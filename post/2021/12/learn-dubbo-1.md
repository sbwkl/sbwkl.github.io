# 一起看 dubbo 源码

前段时间和同事聊天，聊起 dubbo 的泛化调用是怎么实现的，想着用了这么久的 dubbo 框架似乎没有好好看过它的源码，有点说不过去。

Dubbo 是一款高性能，基于 java 开源的 RPC 框架。RPC 是进程间通讯（IPC）的一种，目的是为了把复杂的业务功能拆分到不同的进程，每个进程负责维护各自的功能。

Dubbo 有一个很重要的扩展点加载机制，在 2.x 和 3.0 的文档里都有介绍，我认为是 dubbo 里非常重要的一个特性。

2.x https://dubbo.apache.org/zh/docsv2.7/dev/spi
3.0 https://dubbo.apache.org/zh/docs/concepts/extensibility

> 一般来说，系统会采用 Factory、IoC、OSGI 等方式管理扩展(插件)生命周期。考虑到 Dubbo 的适用面，不想强依赖 Spring 等 IoC 容器。 而自己造一个小的 IoC 容器，也觉得有点过度设计，所以选择最简单的 Factory 方式管理扩展(插件)。在 Dubbo 中，所有内部实现和第三方实现都是平等的。

根据 dubbo 的官方文档的解释，扩展点加载机制是一个类似 spring 的东西，最核心的类是 ExtensionLoader。





Dubbo 的必须的外部依赖不多，主要有 javassist、netty 等。

Javassist(Java Programming Assistant) 是一个工具库维护字节码更加方便，它可以做到在 java 运行时创建类或者修改类。Dubbo 用它创建好多适配类，估计是不高兴写这部分格式差不多的代码。

Dubbo 使用 javasist 开发一个工具类 JavassistCompiler 用来在运行时将字符串编译成 Class 类，然后再使用，所以在 debug 代码时有时候会进入虚空。

它的使用方法可以看单元测试 JavassistCompilerTest getSampleCode() 返回的字符串就是日常写的 java 代码，经过 JavassistCompiler 编译成 Class 在通过反射调用 sayHello 方法。

```
@Test
public void testCompileJavaClass() throws Exception {
    JavassistCompiler compiler = new JavassistCompiler();
    Class<?> clazz = compiler.compile(getSimpleCode(), JavassistCompiler.class.getClassLoader());

    // Because javassist compiles using the caller class loader, we should't use HelloService directly
    Object instance = clazz.newInstance();
    Method sayHello = instance.getClass().getMethod("sayHello");
    Assertions.assertEquals("Hello world!", sayHello.invoke(instance));
}

String getSimpleCode() {
    StringBuilder code = new StringBuilder();
    code.append("package org.apache.dubbo.common.compiler.support;");

    code.append("public class HelloServiceImpl" + SUFFIX.getAndIncrement() + " implements HelloService {");
    code.append("   public String sayHello() { ");
    code.append("       return \"Hello world!\"; ");
    code.append("   }");
    code.append("}");
    return code.toString();
}
```

除了

Netty 是一个通信框架，写 Socket 更加方便，而且它是 NIO 的，性能会更好。

