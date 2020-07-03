# Concurrent Programming

今天学习《Computer Systems》第十二章 Concurrent Programming。

并发编程有很多好处
+ Accessing slow I/O devices. 应用程序等待数据到达时如果让 CPU 去执行别的进程，可以提高利用率，对 CPU 来说寄存器以外的设备都挺慢的。
+ Interacting with humans. 人机交互有多任务的需求，不需要在一个任务上苦等。
+ Reducing latency by deferring work. 推迟某些操作以减少延迟。有些工作打包起来一起做更效率
+ Servicing multiple network clients. 同时给多个客户端提供服务可以减少高延迟客户端垄断服务端的问题。
+ Computing in parallel on multi-core machines. 现代处理器通常是多核，并发编程能更好的利用。

使用应用级并发的程序叫做 *concurrent programs* 有 3 种方式实现

+ Processes. 这种方式，每个 logical control flow 是一个进程，由内核调度，拥有独立的虚拟地址空间，需要通过 *IPC (Interprocess communication)* 通信
+ I/O multiplexing. logical control flow 表示成很多状态，当数据到达描述符时，应用程序会从一个状态转化为另一个状态。
+ Threads. 这种方式，每个 logical control flow 是一个线程，运行在一个进程中，由内核调度，像 processes 和 I/O multiplexing 的混合体

## Concurrent Programming with Processes

利用 processes 构建并发程序最简单的方式是通过函数 fork, execve, waitpid 构建。父进程负责接受请求，分配给子进程处理，父进程继续等待请求。