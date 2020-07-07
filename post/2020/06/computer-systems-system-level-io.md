# System-Level I/O 学习笔记
{:.no_toc}

今天学习《Computer Systems》第十章 System-Level I/O。

* TOC
{:toc}

*Input/Output (I/O)* 是数据在主存和其他设备之间拷贝来拷贝去的过程，外部设备包括磁盘、终端、网络。input 从 I/O 设备拷贝主存，output 从主存拷贝到 I/O 设备。通常编程语言都提供 high-level 的 IO 操作，它们都基于内核提供的 system-level Unix I/O ，学习 Unix I/O 有诸多好处

+ Understanding Unix I/O will help you understand other systems concepts. I/O 是组成系统的一部分，了解它与了解系统的其他部分可以相辅相成
+ Sometimes you have no choice but to use Unix I/O. 有些时候无法使用 high-level I/O 操作或者不合适，比如 standard I/O 不擅长处理网络编程。

## Unix I/O

Linux file 本质是 m byte 的序列，所有的 I/O 设备模型上都是 file 这个抽象非常优雅，让内核可以暴露很简单的接口，也就是 Unix I/O。它使用同一的方式执行 input 和 output 操作

+ Opening files. 应用程序要访问 I/O 设备时请求内核打开对应的文件，内核返回一个正整数叫做 *descriptor* 代表这个文件。Linux shell 创建的进程都有 3 个打开的文件 *standard input (0)*, *standard output (1)* 和 *standard error (2)* 在 unistd.h 中的定义是 STDIN_FILENO, STDOUT_FILENO, STDERR_FILENO。
+ Changing the current file position. 内核维护文件当前位置 *k*，表示距离文件开始位置的偏移量，初始化时为 0。用 *seek* 设置 *k*。
+ Reading and writing files. Read 从文件位置 k 处开始拷贝 n byte 到主存，然后 k = k + n 假设文件大小 m 当 k >= m 时会触发 *end-of-file (EOF)* 应用程序可以侦测到。Write 操作反过来，拷贝主存到文件
+ Closing files. 应用程序结束访问 I/O 设备通知内核关闭文件，内核释放相关的资源，如果进程意外终止，内核会关闭所有打开的文件

## Files

Linux file 有多种类型，在系统中起到不同的作用

+ Regular file. 包含任何数据，应用程序通常会区分 *text file* 和 *binary file* 前者只包含 ASCII 或者 Unicode 字符，后者是前者的补集。Linux 文件包含多个 *text line* 每行末尾有换行符 ```\n (LF)``` 值为 0xa，windows 的换行符是 ```\r\n (CR)``` 值为 0xd 0xa
+ directory. 包含 *links* 的数组，每个 link 映射到一个任何类型的文件。默认包含 2 个 link：. (dot) 映射到自己 .. (dot-dot) 映射到 *parent directory* 
+ Socket. 用于跨网络与另一个进程通讯的文件
+ Named pipes. 类似 pipe 可以被多个进程访问读写，通过 FIFO 交换数据，实际不会写入到文件系统
+ Symbolic links. 包含字符串，字符串内容会被自动解释为另一个文件或者文件夹的路径
+ Character. 类似 pipe 设备自己处理数据，写数据可能会展示在屏幕或者转化为声音，读数据等待设备输入
+ Block devices. 类似 regular file 读写数据可以被缓存

Linux 内核通过 *directory hierarchy* 组织所有文件，最顶上是 *root directory* 名字是 ```/``` 每个进程有 *current working directory* 表明当前所处位置，保存在上下文。

## Opening and Closing Files

进程可以通过 open 方法打开已存在的文件或者创建新文件

```
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

/* 成功返回文件描述符，失败返回 -1 */
int open(char *filename, int flags, mode_t mode);

/* 成功返回 0 失败返回 -1 */
int close(int fd);
```

open 方法参数
+ filename. 要打开的文件名
+ flags. 进程访问的目的，用 | 连接
  + O_RDONLY. 只读
  + O_WRONLY. 只写
  + O_RDWR. 读写
  + O_CREATE. 文件不存在，创建空文件
  + O_TRUNC. 文件已存在，变成空文件
  + O_APPEND. position 设置到文件末尾，用于追加内容
+ mode. 指定访问权限，可以通过 *umask* 预先设置一部分权限，最终的权限是 mode & ~umask
  + S_IRUSR. owner 可读
  + S_IWUSR. owner 可写
  + S_IXUSR. owner 可执行
  + S_IRGRP. owner 所在 group 可读
  + S_IWGRP. owner 所在 group 可写
  + S_IXGRP. owner 所在 group 可执行
  + S_IROTH. 任何人可读
  + S_IWOTH. 任何人可写
  + S_IXOTH. 任何人可执行

close 方法关闭文件，入参是文件描述符

## Reading and Writing files

```
#include <unistd.h>

/* 成功返回读取的字节数，EOF 返回 0 失败返回 -1 */
ssize_t read(int fd, void *buf, size_t n);

/* 成功返回写入的字节数，失败返回 -1 */
ssize_t write(int fd, const void *buf, size_t n);
```

某些情况下 read 和 write 返回的字节大小比要求的要小，这种现象叫做 *short counts* 可能有多种原因

+ Encountering EOF on reads. 读取数据是遇到 EOF 说明已经没有数据了，返回的就少了
+ Reading text lines from terminal. 关联到终端的文件只读取一行
+ Reading and writing network sockets. 网络延迟或者内部缓冲区限制导致
+ Reading and writing linux pipe. 同上

通常在读写本地文件时不会遇到 short counts 除非遇到 EOF 

## Robust Reading and Writing with the RIO Package.

RIO 提供便利，健壮和效率的 IO 操作，自动处理 short counts 提供 2 种不同的函数

+ Unbuffered input and output functions. 不使用缓冲区传输数据，适合读写二进制文件和网络
+ Buffered input functions. 使用缓冲区，适合读取文件行和二进制文件，线程安全

### RIO Unbuffered Input and Output Functions

读写的语义基本同 Unix I/O 接口，不同点在于只有当遇到 EOF 时才会发生 short counts 其他情况都不会，发生中断时会重试

```
#include "csapp.h"

ssize_t rio_readn(int fd, void *usrbuf, size_t n) {
    ssize_t nleft = n;
    ssize_t nread;
    char *bufp = usrbuf;

    while(nleft > 0) {
        if((nread = read(fd, bufp, n)) < 0) {
            if (errno == EINTR) {
                nread = 0;
            } else {
                return -1;
            }
        } else if (nread == 0) {
            break;
        }
        nleft -= nread;
        bufp += nread;
    }
    return (n - nleft);
}

ssize_t rio_writen(int fd, void *usrbuf, size_t n) {
    ssize_t nleft = n;
    ssize_t nwritten;
    char *bufp = usrbuf;

    while (nleft > 0) {
        if ((nwritten = write(fd, bufp, n)) < 0) {
            if (errno == EINTR) {
                nwritten = 0;
            } else {
                return -1;
            }
        }
        nleft -= nwritten;
        bufp += nwritten;
    }
}
```

### RIO buffered Input Functions

函数 rio_read 和 read 有相同的语义，却别在于 rio_read 使用内部缓冲区提高从文件读取到内存的效率，因为读取数据很大部分耗时都在寻找起始地址，读取内容反而耗时不高。另一个读取一行时需要一个字符一个字符读取，然后判断是否是换行符，如果不用缓冲区就是灾难。

函数 rio_readlineb 每次读取一行，函数 rio_readnb 读取 n 字节数据，这两个行数可以穿插使用，但是不要和 rio_readn 穿插使用

```
#define RIO_BUFSIZE 8192
typedef struct {
    int rio_fd;
    int rio_cnt;
    char *rio_bufptr;
    char rio_buf[RIO_BUFSIZE];
} rio_t;

void rio_readinitb(rio_t *rp, int fd) {
    rp->rio_cnt = 0;
    rp->rio_fd = fd;
    rp->rio_bufptr = rp-> rio_buf;
}

ssize_t rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen) {
    int n, rc;
    char c, *bufp = usrbuf;

    for (n = 1; n < maxlen; n++) {
        if ((rc = rio_read(rp, &c, 1)) == 1) {
            *bufp++ = c;
            if (c == '\n') {
                n++;
                break;
            }
        } else if (rc == 0) {
            if (n == 1) {
                return 0;
            } else {
                break;
            }
        } else {
            return -1;
        }
    }
    *bufp = 0;
    return n - 1;
}

ssize_t rio_readnb(rio_t *rp, void *usrbuf, size_t n) {
    size_t nleft = n;
    ssize_t nread;
    char *bufp = usrbuf;
    
    while (nleft > 0) {
        if ((nread = rio_read(rp, bufp, n)) < 0)) {
            return -1;
        } else if (nread == 0) {
            break;
        }
        nleft -= nread;
        bufp += nread;
    }
    return (n - nleft);
}

static ssize_t rio_read(rio_t *rp, void *usrbuf, size_t n) {
    int cnt;

    while (rp->rio_cnt <= 0) {
        rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, sizeof(rp->rio_buf));
        if (rp->rio_cnt < 0) {
            if (errno != EINTR) {
                return -1;
            }
        } else if (rp->rio_cnt == 0) {
            return 0;
        } else {
            rp->rio_bufptr = rp->rio_buf;
        }
    }
    cnt = n;
    if (rp->rio_cnt < n) {
        cnt = rp->rio_cnt;
    }
    memcpy(usrbuf, rp->rio_bufptr, cnt);
    rp->rio_bufptr =+ cnt;
    rp->rio_cnt -= cnt;
    return cnt;
}
```

## Reading File Metadata

应用程序通过函数 *stat* 和 *fstat* 获得文件的信息，有时也叫 *metadata*

```
#include <unistd.h>
#include <sys/stat.h>

int stat(const char *filename, struct stat *buf);
int fstat(int fd, struct stat *buf);
```
获得的 metadata 在结构体 stat 中，可以通过 ```man stat``` 查看具体的信息。Linux 定义了一些宏来检查文件信息 S_ISREG, S_ISDIR, S_ISSOCK 分别判断文件是否是普通文件，是否是文件夹，是否是 socket。

## Reading Directory Contents

应用程序可以通过函数访问文件夹内容

```
#include <sys/types.h>
#include <dirent.h>

struct dirent {
    ino_t d_ino; /* inode number */
    char d_name[256];
}

DIR *opendir(const char *name);
struct dirent *readdir(DIR *dirp);
int closedir(DIR *dirp);
```

函数 opendir 返回 *directory stream* 的指针，stream 是有序列表的抽象，这里是文件夹条目。函数 readdir 返回下一个文件夹条目的指针，没有下一条就返回 NULL 函数 closedir 关闭 stream 并释放资源。

## Sharing Files

内核使用 3 个相关的数据结构表示打开的文件

+ Descriptor table. 每个进程一份，由打开的文件组成，每条记录指向 file table
+ File table. 全进程共享一份，每条记录包括当前文件位置，被引用的数量 *reference count* 和一个指向 v-node table 的指针。只要 reference count 不为 0 内核就不会删除这条记录
+ v-node table. 全进程共享一份，每条记录包含文件信息，类似 stat 的结构

![](typical-kernal-data-structures-for-open-files.jpg)

不同的 descriptor table 记录可以指向同一条 file table 记录，不同的 file table 记录又可以指向同一条 v-node table 记录

## I/O Redirection

应用程序可以通过 dup2 来重定向 I/O

```
#include <unistd.h>

int dup2(int oldfd, int newfd);
```

函数 dup2 把 oldfd 的 descriptor table 记录拷贝到 newfd 覆盖掉原来的记录，如果 newfd 已经打开，那么会先关闭它。相当于 oldfd 和 newfd 都指向 oldfd 的 file table 记录，也就是 newfd 重定向到了 oldfd。

Linus shell 用 ```>``` 操作来完成重定向动作。比如 ls > foo.txt 就是把标准输出重定向到 foo.txt 这个文件。

## Standard I/O

C 语言提供一组 high-level 的 I/O 操作，叫做 *standard I/O library*。它把打开的文件建模成 *stream* 一个指向类型为 FILE 的指针，每个程序都有 3 个打开的 stream

```
#include <stdio.h>
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;
```

FILE 是文件描述符和 *stream buffer* 的抽象，stream buffer 的目的和 RIO 的 buffer 是一样的，都是为了减少 syscall 提高效率。

## Putting It Together: Which I/O Functions Should I Use?

![](relationship-io.jpg)

Unix I/O 是内核实现的，RIO 和 Standard I/O 在 Unix I/O 的基础上实现。选择指导

+ Use the standard I/O functions whanever possible. 
+ Don't use scanf or rio_readlineb to read binary files. 二进制文件含有很多意义不明的换行符，其实它也根本不是换行符的意思
+ Use the RIO functions for I/O on network sockets. Standard I/O 在处理 socket 读写时容易出现问题，不建议使用

Standard I/O stream 既可以执行 input 操作，也可以执行 output 操作，这个叫做 *full duplex* 但是在与 socket 交互时有一些限制 

+ Restriction 1: Input functions following output functions. input 要在 output 执行了 fflush, fseek, fsetpos, rewind 之后才能执行。fflush 清空缓冲区，后 3 个方法充值 position。
+ Restriction 2: Output functions following input functions. output 要在 input 执行了 fseek, fsetpos, rewind 之后才能执行，或者 input 方法遇到 EOF。

第一个限制比较好解决，只要规定 output 执行完执行一次 fflush 就好了，第二个限制不太好解决，因为 fseek 不支持 socket 文件，比较好的规避方法是打开 2 个文件描述符，一个负责读，一个负责写。关闭的时候也要关闭 2 个，但是第二个关闭必定失败，因此不太推荐用 standard I/O 处理网络读写。


<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">06/25/2020</p>



