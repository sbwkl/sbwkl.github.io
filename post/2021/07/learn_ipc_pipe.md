# 一起学 IPC: PIPE

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

标准 I/O 的 buffer 有时候会导致我们写出 bug 代码，比如下面这段代码，在我的电脑上当 size < 1025 时不会有任何输出，原因是数据都在 buffer 里没有 write 就直接退出了，如果想要符合预期需要在 _exit 之前加一句 fflush(stdout)。

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

除了可以从子进程得到返回内容 pipe 还可以把多个进程串成糖葫芦，这样上一个进程的处理结果就是下一个进程的待处理内容，像图里一样。

[]()

```
// tinypipeshell.c
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv, char **envp) {

  char cmdstring[1024];
  int len = read(STDIN_FILENO, cmdstring, sizeof(cmdstring));
  cmdstring[len - 1] = '\0';

  char *cl[16];
  int n = 0;
  char *subcmd = strtok(cmdstring, "|");
  while (subcmd != NULL) {
    cl[n] = (char *) malloc(strlen(subcmd) * sizeof(char));
    strcpy(cl[n], subcmd);
    n++;
    subcmd = strtok(NULL, "|");
  }

  int *pl[16];
  for (int i = 0; i < n; i++) {
    pl[i] = (int *) malloc(2 * sizeof(int));
    pipe(pl[i]);
  }

  for (int i = 0; i < n; i++) {
    if (fork() == 0) {
      dup2(pl[i][0], STDIN_FILENO);
      if (i + 1 < n) {
        dup2(pl[i + 1][1], STDOUT_FILENO);
      }

      for (int i = 0; i < n; i++) {
        close(pl[i][0]);
        close(pl[i][1]);
      }

      execve(cl[i], argv, envp);
    }
  }
  for (int i = 0; i < n; i++) {
    close(pl[i][0]);
    close(pl[i][1]);
  }

  for (int i = 0; i < n; i++) {
    wait(NULL);
  }
}
```

74 ~ 86 解析输入的字符串，按照 | 分割，每个字符串代表一个命令

88 ~ 92 初始化 pipe 因为有好几个，用二维数组表示

94 ~ 108 创建子进程，并且重定向子进程的 stdin 和 stdout 重定向之后关闭所有 pipe 读写端口

109 ~ 112 关闭父进程所有 pipe 读写端口

114 ~ 116 等待子进程执行完毕并回收

程序会按照顺序执行输入的命令，并且将前一个命令的输出作为下一个命令的输入，直到最后一个命令执行完成并输出结果。我们可以写几个简单测试代码

```
// dynawing.c
#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
  char msg[1024];
  int n;
  while((n = read(STDIN_FILENO, msg, sizeof(msg))) > 0) {
      if (msg[n - 1] == '\n') {
        msg[n - 1] = '\0';
      }
      printf("%s\n", msg);
  }
  printf("dynawing\n");
}
```

这段代码很简单，现将输入内容原封不动的输出，然后再输出「dynawing」。143 行去掉处理换行符，原因是不去掉的话会显示一些奇怪的字符，原因未知。

```
./tinypipeshell
dynawing|dynasolider

dynawing
dynasolider

```

pipe 在父子进程中很有用，但是有个缺点。如果 2 个进程没有关系，这时候就很难拿到文件描述符，也就没法读写。解决这个问题需要用到 FIFO 或者叫 named pipe。