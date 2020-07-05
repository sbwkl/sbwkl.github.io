# Concurrent Programming

今天学习《Computer Systems》第十二章 Concurrent Programming。

并发编程有很多好处
+ Accessing slow I/O devices. 应用程序等待数据到达时如果让 CPU 去执行别的进程，可以提高利用率，对 CPU 来说寄存器以外的设备都挺慢的。
+ Interacting with humans. 人机交互有多任务的需求，不需要在一个任务上苦等。
+ Reducing latency by deferring work. 推迟某些操作以减少延迟。有些工作打包起来一起做更效率。
+ Servicing multiple network clients. 同时给多个客户端提供服务可以减少高延迟客户端垄断服务端的问题。
+ Computing in parallel on multi-core machines. 现代处理器通常是多核，并发编程能更好的利用。

使用应用级并发的程序叫做 *concurrent programs* 有 3 种方式实现

+ Processes. 这种方式，每个 logical control flow 是一个进程，由内核调度，拥有独立的虚拟地址空间，需要通过 *IPC (Interprocess communication)* 通信。
+ I/O multiplexing. logical control flow 表示成很多状态，当数据到达描述符时，应用程序会从一个状态转化为另一个状态。
+ Threads. 这种方式，每个 logical control flow 是一个线程，运行在一个进程中，由内核调度，像 processes 和 I/O multiplexing 的混合体，调度方式像 processes 数据共享像 I/O Multiplexing。

## Concurrent Programming with Processes

利用 processes 构建并发程序最简单的方式是通过函数 fork, execve, waitpid 构建。父进程负责接受请求，分配给子进程处理，父进程继续等待请求。

### A Concurrent Server Based on Processes

使用 processes 实现 echo server [源码 echoserverp.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/concurrent/echoserverp.c) 有 3 点需要注意
+ Server 需要长时间运行，所以要回收子进程，SIGCHLD 信号不是排队等待的，所以一次性要回收所有子进程
+ 子进程拥有父进程的所有描述符，实际上有些描述符用不上，为了防止内存泄漏，父进程关闭 connfd 子进程关闭 lestenfd
+ 父子进程的 connfd 都关闭了，对应 file table 的引用数才会归 0 才会关闭连接

### Pros and Cons of Processes

父子进程共享 file table 不共享地址空间。不共享地址空间既是优点也是缺点，优点是不用担心意外覆盖其他进程的状态，避免一些莫名其妙的问题，缺点是进程间通信不方便，需要通过 IPC 通信。另外使用进程构建并发应用相对较慢，因为管理进程和 IPC 的开销比较大。

## Concurrent Programming with I/O Multiplexing

加入上述例子中的 echo server 既要响应 client 又要响应 stdin 的输入，这时候 server 要响应 2 种独立的 I/O 事件
+ network client 的连接请求
+ 用户的键盘输入

server 先处理哪个 I/O 都不合适，因为不知道谁的数据会先到达，其中一种解决方式是引入叫做 *I/O Multiplexing* 的技术。它主要的思想是使用 select 函数让内核挂起进程，当有 I/O 事件发生时交还控制权。

Select 是一个复杂的函数，有很多使用场景，书中介绍了其中一种：等待一组描述符，直到有描述符准备好读取。

```
#include <sys/select.h>

/* 成功返回准备好读取的描述符数量，失败返回 -1 */
int select(int n, fd_set *fdset, NULL, NULL, NULL);

/* 操作 fd_set 的辅助宏 */
/* 清除 fdset */
FD_ZERO(fd_set *fdset);
/* fdset 清除 fd */
FD_CLR(int fd, fd_set *fdset);
/* fdset 设置 fd */
FD_SET(int fd, fd_set *fdset);
/* 判断 fd 是否被设置 */
FD_ISSET(int fd, fd_set *fdset);
```

函数 select 维护一组描述符叫做 *descriptor sets*，类型为 fd_set 它是一个大小为 n 的 bit vector

b<sub>n-1</sub>,...,b<sub>1</sub>, b<sub>0</sub>

每个 b<sub>k</sub> 代表描述符 k 当 b<sub>k</sub> = 1 时，k 是集合的成员。

[源码 select.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/concurrent/select.c) 把 2 个描述符 STDIN_FILENO 和 listenfd 放进 read_set 中，通过 select 函数挂起进程等待数据到达，当 listenfd 数据到达时执行 echo 方法， 当 STDIN_FILENO 数据到达时执行 command 方法，需要注意其中一个数据后要处理完成后才能处理另一个。

### A Concurrent Event-Driven Server Based on I/O Multiplexing

I/O Multiplexing 是 event-driven 程序的基础，通过事件驱动流程进展，基础的思想是把 logical flow 变成 state machines。

State machine 是 *states*, *input events*, *transitions* 的集合，通常用有向图表示，节点代表 state，有向边代表 transition，有向边的标签代表 input event。

*self-loop* 是相同输入和输出状态的转化。

使用 I/O Multiplexing 实现 echo server [源码 echoservers.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/concurrent/echoservers.c)

+ state. 等待描述符 d<sub>k</sub> 可以被读取，只有一个状态 transition 执行完成后又回到这个状态
+ input event. 描述符 d<sub>k</sub> 准备完成
+ transition. 添加 connfd 到数组 and 读取描述符 d<sub>k</sub> 内容，写回读取的内容

程序由 4 个函数组成，一个 main 函数和 3 个功能函数还有一个数据结构 pool 保存所有 client 连接信息。

```
 typedef struct {
   int       maxfd;                 /* select 入参 n，最大 fd*/
   fd_set    read_set;              /* select 每次执行会改变 fdset 这里用于保存*/
   fd_set    ready_set;             /* select 返回准备好的 fdset */
   int       nready;                /* 准备好的 fd 数量 */
   int       maxi;                  /* 当前最大有多少个 client 链接，和下面 2 个参数一起用 */
   int       clientfd[FD_SETSIZE];  /* connfd 数组，保存连接信息 */
   rio_t     clientrio[FD_SETSIZE]; /* rio 数组，保存连接信息 */
 } pool;

void init_pool(int listenfd, pool *p);
void add_client(int connfd, pool *p);
void check_clients(pool *p);
```

函数 main 从命令行解析端口号，打开 listenfd 初始化 pool 使用死循环重复处理请求。函数 select 会挂起进程直到有描述符就绪，如果 listenfd 就绪额外调用 add_client 函数把 connfd 添加到 pool 中，其他情况调用 check_clients 检查有没有 connfd 就绪

函数 init_pool 初始化 pool 设置所有的 clientfd 为 -1 把 listenfd 加入 read_set，因为就 1 个 fd 所以设置 maxfd = listenfd 因为还没有 clientfd 设置 maxi = -1

函数 add_client 把 connfd 添加到 pool.clientfd，把 对应的 rio 添加到 pool.clientrio 然后更新 maxfd, read_set, maxi 如果超过最大可添加个数会报错。

函数 check_clients 遍历所有的 connfd 发现就绪状态读取内容并且写回，如果发现 EOF 则关闭 connfd 从 clientfd 中移除

### Pros and Cons of I/O Multiplexing

优点：
+ 能够更好的控制程序的行为，比如可以设置 connfd 的优先级，这个在 processes 实现的 echo server 上是很难实现的。
+ 程序运行在一个进程里，共享地址空间，共享数据变得方便，同时 debug 程序也变得方便。
+ 通常更加高效，因为不需要进程上下文切换。

缺点：
+ 最大的缺点是代码复杂，这个 echo server 的例子代码量是 processes 的 3倍多。
+ *granularity （粒度）* 的控制，在这个例子中 granularity 是从 connfd 读取一行数据，如果遇到恶心的 client 只给一部分数据，这时候程序就会出 bug 不能提供服务，如果更小粒度处理部分数据，是一项很难的工作。
+ 不能充分利用多核处理器，因为就 1 个进程。

## Concurrent Programming with Threads

*Thread* 是运行在 process 上下文中的 logical flow。一个进程允许运行多个 thread 由内核来负责调度，每个 thread 拥有独立的 *thread context* 包含唯一的 *thread ID (tid)*, stack, stack pointer, program counter, general-purpose registers 和 condition codes。所有的 thread 共享虚拟地址空间

### Thread Execution Model

线程的执行模式和进程类似，第一个创建的进程叫做 *main thread*，它创建的进程叫做 *peer thread* 不存在父子关系，从创建 peer thread 开启，2 个线程并发运行，控制权交换通过 context switch 完成，基本与进程无异，因为线程的 context 相对较小，所以开销比进程小。

### Posix Threads

Posix Thread (Pthreads) 是 C 程序处理多线程的标准接口，定义约 60 个函数用于创建、杀死、回收线程，安全的共享数据，通知线程系统状态变化

```
#include <pthreads.h>
typedef void *(func)(void *);

/* 成功返回 0 失败返回非 0 */
int pthread_create(pthread_t *tid, pthread_attr_t *attr, func *f, void *arg);
pthread_t pthread_self(void);
void pthread_exit(void *thread_return);
/* 成功返回 0 失败返回非 0 */
int pthread_cancel(pthread_t tid);
/* 成功返回 0 失败返回非 0*/
int pthread_join(pthread_t tid, void **thread_return);
int pthread_detach(pthread_t tid);

pthread_once_t once_control = PTHREAD_ONCE_INIT;
int pthread_once(pthread_once_t *once_control, void (*init_routine)(void));
```
函数 pthread_create 创建进程运行 *thread routine* f 入参是 arg，参数 attr 用于改变线程的默认属性。

函数 pthread_self 用于获取当前线程的 tid

线程终止有 4 各种方式
+ 顶层线程例程返回
+ 线程显式调用 pthread_exit 终止，如果 main thread 调用 pthread_exit 需要等待所有的 peer thread 终止，然后再停止 main thread。
+ 线程调用 exit 函数，终止进程和所有关联的线程
+ 线程调用 pthread_cancel 函数终止某个线程

线程通过 pthread_join 等待其他 tid 进程终止，它会阻塞直到 tid 终止，返回值复制给 thread_return，回收内存资源。与 wait 函数不同，它只能等待指定 tid。

在任何时间，线程是 *joinable* 或者 *detached*。Joinable thread 可以被其他线程回收和杀死，他们的资源只有被回收之后才会释放，detached thread 不能被回收和杀死，他的内存资源在被系统终止时自动释放。

线程创建时是 joinable 调用函数 pthread_detach 把线程转化成 detached。为了防止内存泄漏，多用 detached thread

函数 pthread_once 初始化与线程相关的系统状态，参数 once_control 全局变量或者静态变量，通常初始化为 PTHREAD_ONCE_INIT 第一次调用 pthread_once 时会执行 init_routine 无入参，无出参，之后再调用就不做任何操作

### A Concurrent Server Based on Threads

使用 threads 实现 echo server [源码 echoservert.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/concurrent/echoservert.c)

代码的实现和进程类似，有几点需要注意
+ 传参 connfd. 使用 malloc 分配内存，保证 connfd 之间互补印象。如果直接使用 connfdp 会出现线程取 connfd 和 accetp 之间的 *race*。如果先取到 connfd 再 accept 那么程序是正确的，但是如果先 accept 再取值 connfd 此时取到的是下一个 connfd 此时程序就不正确了。
+ 使用 detached thread. 因为没有显示的回收线程，调整成 detached 防止内存泄漏

## Shared Variables in Threaded Programs

理解 C 程序一个变量是否共享，需要知道 3 个基本问题
1. 线程的基础内存模型是什么
1. 这个模型下，变量实例是怎么隐射到内存的
1. 多少线程引用这些变量

当且仅当有多个线程引用一个变量，这个变量才是 *shared* 

### Threads Memory Model

线程运行在进程的上下文中，有独立的 *thread context* 除此之外其他部分都共享，比如代码段，heap，共享库，打开的文件。

线程不能读写其他线程的寄存器值，可以访问共享地址空间中的任何位置，如果一个线程改变了某个内存位置的值，那么其他线程都可以看到这个变更。

线程的 stack 一般是独立访问的，但是它不受保护，如果有线程通过某些手段拿到了指向另一个线程 stack 的指针，那么是可以读写指针的内容的。

### Mapping Variables to Memory

C 程序根据存储类型映射到内存
+ Global variables. 定义在函数外的变量，只保留一个实例，在虚拟内存的 read/write 区域，任何线程都可以引用
+ Local automatic varibales. 定义在函数内，不用 static 修饰，每个线程各自有实例，保存在线程的 stack 
+ Local static varibales. 定义在函数内，用 static 修饰，同 global variables

### Shared Variables

当且仅当 *v* 的一个实例被 1 个以上线程引用，我们称作变量 *v* 是 *shared*。

## Synchronizing Threads with Semaphores

共享变量很容易，但是很容易导致 *synchronization error* [例子 badcnt.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/concurrent/badcnt.c)

这个例子中有 bug 的代码片段是 
```
for (i = 0; i < niters; i++) {
    cnt++;
}
```
对应的汇编代码是 
![](assembly-code-for-badcnt.jpg)

分为 5 个部分
+ H<sub>i</sub>: 循环头部的指令块（不重要）
+ L<sub>i</sub>: 加载共享变量 cnt 到寄存器 %rdx<sub>i</sub> i 表示线程 i
+ U<sub>i</sub>: 更新 %rdx<sub>i</sub> 自增 1
+ S<sub>i</sub>: 保存更新过的 %rdx<sub>i</sub> 写回共享变量 cnt
+ T<sub>i</sub>: 循环尾部的指令块（不重要）