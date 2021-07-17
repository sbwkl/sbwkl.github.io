# 一起学 IPC

IPC(Interprocess Communication)从字面上理解就是进程和进程之间通信的手段。当构建大型系统时，普遍被人接受的观点是把大型系统拆分成不同的进程，然后进程与进程之间采用某种机制互相通信，pipe 就是其中的一种机制。

pipe 是一个单向的数据通道，一头写数据，一头读数据。写入的数据由内核缓存。在任何一台 Linux 机器上运行 man pipe 可以看到 pipe 的介绍。man 是 Linux 命令，manual 的前三个字母，用来查看文档，挺好用的。

```
#include <unistd.h>

int pipe(int pipefd[2]);
```

数组 pipefd 用来接收 2 个文件描述符，其中 pipefd[0] 用于读，pipefd[1] 用来写。返回值 0 表示调用成功，-1 表示发生错误。pipe 可以用来让子进程把结果返回给父进程，父进程如果想传参数给子进程很方便，只要在 fork 之前把数据初始化即可，子进程复制了父进程的地址空间。

```
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
  int pipefd[2];
  pipe(pipefd);
  if (fork() == 0) {
    close(pipefd[0]);
    write(pipefd[1], "Hello world!", 12);
    _exit(0);
  }
  close(pipefd[1]);
  char msg[1024];
  int n;
  while((n = read(pipefd[0], msg, sizeof(msg))) > 0) {
    printf("receive %d bytes msg: %s\n", n, msg);
  }
  wait(NULL);
}
```

需要注意的是从 pipe 读取到 EOF(end of file) 的条件是所有的写描述符关闭。如果删掉代码 13 行，那么程序将一直阻塞在 31 行。虽然子进程的 pipefd[1] 关闭了（进程退出会关闭掉所有文件描述符），但是父进程的没有关闭。所以会一直尝试从 pipe 读取数据。另外 c 语言的标准 I/O 库有一个 buffer 会缓存数据，直到满足条件才会写到标准输出，这么设计的原因是 write 是非常昂贵的操作，为了性能尽量减少 write 的次数。这就好比从杭州拉货到宁波，肯定希望每次都拉满满的一车过去，必要的时候还可以对货物进行压缩以腾出更多的地方。

标准 I/O 的 buffer 有时候会导致我们写出 bug 代码，比如下面这段代码，在我的电脑上当 size < 1025 时不会有任何输出，如果想要符合预期需要在 _exit 之前加一句 fflush(stdout) 这样 buffer 的数据才会被 write。

```
// bug 代码
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv) {
  int size = atoi(argv[1]);
  for (int i = 0; i < size; i++) {
    printf("%c", 'a');
  }
  _exit(0);
}
```

除了可以从子进程得到返回内容 pipe 还可以把多个进程串成糖葫芦，这样上一个进程的处理结果就是下一个进程的待处理内容。


代码

代码解释

