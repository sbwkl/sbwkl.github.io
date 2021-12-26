# 一起看 dubbo 源码

前段时间和同事聊天，聊起 dubbo 的泛化调用是怎么实现的，想着用了这么久的 dubbo 框架似乎没有好好看过它的源码，有点说不过去。

Dubbo 是一款高性能，基于 java 开源的 RPC 框架。RPC 是进程间通讯（IPC）的一种，目的是为了把复杂的业务功能拆分到不同的进程，每个进程负责维护各自的功能。

在看 dubbo 源码之前先看一下它的外部依赖。

Dubbo 的必须的外部依赖不多，主要有 javasist、netty 等。

Javasist(Java Programming Assistant) 是一个工具库维护字节码更加方便，它可以做到在 java 运行时创建类或者修改类。Dubbo 用它创建好多适配类，估计是不高兴写这部分格式差不多的代码。

Netty 是一个通信框架，写 Socket 更加方便，而且它是 NIO 的，性能会更好。

