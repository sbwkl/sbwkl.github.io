# Network Programming 学习笔记
{:.no_toc}

今天学习《Computer Systems 》第十一章 network programming。

* TOC
{:toc}

## The Client-Server Programming Model

所有的网络应用都基于 *client-server* 模型，它包含一个 *server* 进程和多个 *client* 进程。Server 管理 *resource* 或者提供 *service*。

Client-server 模型最基本的操作是 *transaction* 它有 4 个步骤

+ When a client needs services, it initiates a transaction by sending a *request* to the server.
+ The server receives the request, interprets it, and manipulates its resources in appropriate way.
+ The server send a *response* to the client and then waits for the next request.
+ The client receives the response and manipulates it.

## Networks

Clients 和 servers 通常运行在不同的主机上，通过 *computer network* 通讯。对主机来说 network 是一个 I/O 设备提供数据的收发，插在扩展槽上提供网络的物理接口。从网络来的数据通过 I/O bus 和 memory bus 拷贝到主存，反之亦然。

网络通过层级结构组织，最底层是 LAN (local area network) 最流行的 LAN 技术是 *Ethernet*。*Ethernet segment* 由电线（通常是双绞线）和 hub 组成，线的一段连接到主机的适配器 (adapter)，另一端连接到 hub 的端口 (port) hub 会把收到的数据复制给所有端口，就是说每台主机都会收到一份数据。

每个适配器保存全局唯一的 48bit 地址，主机可以发送 *frame (a chunk of bits)* 给在 ethernet segment 中的其他主机。frame 包含几部分
+ header. 固定大小，包含源和目标地址，frame 的长度
+ payload. 传输的数据

所有的主机都能收到 frame 但只有目标会处理它

Mutliple Ethernet segment 组成大的 LAN 叫做 *bridged Ethernets* 使用一组线和 *bridges* 相连

![](bridged-ethernet-segments.jpg)

多个 LAN 通过 *router* 连在一起，形成 *internet*。

![](a-small-internet.jpg)

为了从 *source houst* 发送数据到 *destination host* 每个主机和路由运行一层 *protocal software* 消除不同网络间的差异，协议提供 2 个基本能力

+ Naming scheme. 协议给每个主机分配至少一个唯一标识它的 *internet address*
+ Delivery mechanism. 统一传输数据的打包方式，叫做 *packets* 包括 *header* 和 *payload* 

## The Global IP Internet

每个主机实现 *TCP/IP protocol (Transmission Control Protocol/Internet Protocol)* 主机之间通过 *sockets interface* 和 Unix I/O 通信。IP 提供 naming scheme 和 delivery mechanism 可以从一台主机发送 datagrams 到另一台主机，但是不可靠可能会丢失或者重复发，*UDP (Unreliable Datagrams Protocol)* 继承 IP 实现进程对进程的通信，依然不可靠。TCP 是建立在 IP 之上的复杂协议，提供进程间可靠的 full duplex (bidirectional) connections。

从程序员视角，Internet 可以看成主机的集合，主机具有属性

+ The set of hosts is mapped to a set of 32-bit *IP addresses*.
+ The set of IP addresses is mapped to a set of identifiers called *Internet domain names*.
+ A process on one Internet host can communicate with a process on any other Internet host over a *connection*.

### IP Addresses

IP address 是 32 位无符号整数，因为不同的主机有不同的字节顺序 （big-endian 或者 little-endian）TCP/IP 定义了统一的 *network byte order (big-endian byte order)*  

```
#include <arpa/inet.h>

/* host byte order --> network byte order */
uint32_t htonl(uint32_t hostlong);
uint16_t htons(uint16_t hostshort);

/* network byte order --> host byte order */
uint32_t ntohl(uint32_t netlong);
uint16_t ntohs(uint32_t netshort);
```
n 代表 *network* h 代表 host，htonl 可以这么理解 host to network long type

IP 地址通常用另一种方式表示，叫做 *dotted-decimal notation* 如 107.212.122.205 通过函数可以互相转化

```
#include <arpa/inet.h>

/* 成功返回 1 src 不合法返回 0 错误返回 -1 */
int inet_pton(AF_INET, const char *src, void *dst);

/* 成功返回指针，失败返回 NULL */
const char *inet_ntop(AF_INET, const void *src, char *dst, socklen_t size);
```

n 代表 *network* p 代表 *pre-sentation* 此时是 network byte order 如果要转成 host byte order 还要调用 ntohl 方法转化，如果是 IPv6 第一个入参用 AF_INET6

### Internet Domain Names

因为 IP 地址不好记，所以设计了另一个好记的集合叫做 *domain names* 与 IP 地址互相映射。Domain names 是一个层级结构

![](domain-name-hierarchy.jpg)

IP 地址和 domain names 的映射关系维护在 *DNS (Domain Names System)* 可以用 *nslookup* 命令查看域名对应的 IP 地址。

### Internet Connections

Connection 是一对进程 *point-to-point* 的链接，socket 是链接的端点，每个 socket 有 *socket address* 由地址和 16bit 的端口组成，表示成 address:port。

Client 的 port 是内核自动分配的，叫做 *ephemeral port*，server 的 port 是人为指定的，叫做 *well-known port* 对应的服务叫做 *well-known service name* 保存在 /etc/services 文件中

Connection 由 2 个端点唯一确定，叫做 *socket pair* 表示为 (cliaddr:cliport, servaddr:servport)

## The Sockets Interface

*sockets interface* 是一组用于构建网络应用的函数。

### Socket Address Structures

Internet socket addresses 类型是 sockaddr_in 大小 16byte 后缀 _in 是 internet 的意思

```
struct sockaddr_in {
    uint16_t        sin_family;
    uint16_t        sin_port;
    struct in_addr  sin_addr;
    unsigned char   sin_zero[8];
}
```

*sin_family* 通常是 AF_INET，*sin_port* 是 16-bit 端口 *sin_addr* 是 32-bit IP 地址，通常用 network byte order。

```
#include <sys/types.h>
#include <sys/socket.h>

/* 成功返回 socket 描述符，失败返回 -1 */
int socket(int domain, int type, int protocol);
/* 成功返回 0 失败返回 -1 */
int connect(int clientfd, const struct sockaddr *addr, socklen_t addrlen);
/* 成功返回 0 失败返回 -1 */
int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
/* 成功返回 0 失败返回 -1 */
int listen(int sockfd, int backlog);
/* 成功返回 socket 描述符，失败返回 -1 */
int accept(int listenfd, const struct sockaddr *addr, int *addrlen);
```

Client 和 server 通过 socket 函数创建 *socket descriptor* 比如 ```clientfd = Socket(AF_INET, SOCK_STREAM, 0)``` 参数 AF_INET 表示是用 32-bit IP 地址，SOCK_STREAM 表示 socket 是链接的一个端点，参数 0 表示当 type 的值只支持一种协议时使用，详细的描述见 ```man socket```。

Client 通过 connect 函数和 server 建立连接，连接成功建立后 socket 才可以正常读写。

Server 通过 bind 函数要求内核分配 socket 地址和描述符

Server 通过 listen 函数把 sockfd 从 active socket 转化为 listening socket。Client 是主动发起请求，server 是被动接收请求，socket 被创建时内核模式是 active socket 所以需要转化，backlog 是最大等待的请求数

Server 通过 accept 函数等待 client 请求，当请求到达后返回 *connected descriptor* 用于通信。listenfd 和返回的 connfd 是不同的描述符，listenfd 负责接收请求，创建后贯穿整个生命周期，connfd 用于 client 和 server 通信，通信结束后就可以关闭了。

### Host and Service Conversion

Linux 提供函数 *getaddrinfo* 和 *getnameinfo* 用来互相转化 sockaddr 和字符串表示的 socket 信息（主机名，地址，服务名，端口）

#### The getaddrinfo Function

函数 getaddrinfo 将字符串信息转化为 sockaddr

```
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

struct addrinfo {
    int ai_flags;
    int ai_family;
    int ai_socktype;
    int ai_protocol;
    char *ai_canonname;
    size_t ai_addrlen;
    struct sockaddr *ai_addr;
    struct addrinfo *ai_next;
}

/* 成功返回 0 失败返回非 0 */
int getaddrinfo(const char *host, const char *service, const struct addrinfo *hints, struct addrinfo **result);

void freeaddrinfo(struct addrinfo *result);
const char *gai_strerror(int errcode);
```

提供 host 和 service 函数 getaddrinfo 返回链表 result 链表的元素是 addrinfo 信息。Client 遍历链表元素，调用 socket 和 connect 直到建立连接。Server 遍历链表元素，调 socket 和 bind 直到绑定到一个合法的地址。为了防止内存溢出，使用完后要调用函数 freeaddrinfo 释放内存，发生错误是调用 gai_strerror 报告错误信息。

参数 host 可以是域名或者 IP 地址，service 可以是服务名或者端口，这 2 个参数至少填一个。可选参数 hints 指定需要哪些字段，不指定的字段就是 0 或者 NULL，通常使用  memset 把整个结构置为 0 然后选择需要的字段
+ 默认情况下 getaddrinfo 返回所有 IPv4 和 IPv6 的地址，指定 ai_family = AF_INET 只返回 IPv4 地址， 指定 ai_family = AF_INET6 只返回 IPv6 地址。
+ 默认情况下，唯一的地址关联 3 个 addrinfo，分别是 connections, datagrams, row sockets 设置 ai_socktype = SOCK_STREAM 只返回 connection 的 addrinfo 地址。
+ 字段 ai_flags 覆盖默认行为，用 or 连接
  + AI_ADDRCONFIG. 如果 local host 配置 IPv4 那么返回 IPv4 地址，IPv6 同理
  + AI_CANONNAME. 链表第一个元素的 ai_canonname 指向 host 的官方名字
  + AI_NUMERICSERV. 强制 service 是端口
  + AI_PASSIVE. 返回的 addrinfo 可以作为 server 的 listening sockets 其中的地址字段是 *wildcard address* 表示接受任何 IP 的请求。

更多内容使用 ```man getaddrinfo``` 查看

#### The getnameinfo Function

函数 getnameinfo 是 getaddrinfo 反过来，把 sockaddr 转化转化成 host 和 service。

```
#include <sys/socket.h>
#include <netdb.h>

/* 成功返回 0 失败返回非 0 */
int getnameinfo(const struct sockaddr *sa, socklen_t salen, char *host, size_t hostlen, char *service, site_t servlen, int flags);
```

参数 flags 覆盖默认行为，用 or 连接
+ NI_NUMERICHOST. 返回数字地址字符串
+ NI_NUMERICSERV. 返回端口

### Helper Functions for the Sockets Interface

函数 getaddrinfo 功能强大，但是使用起来不是很方便，所以封装 higher-level 的辅助函数会更方便。

```
#include "caspp.h"

/* 成功返回描述符，失败返回 -1 */
int open_clientfd(char *hostname, char *port);

/* 成功返回描述符，失败返回 -1 */
int open_listenfd(char *port);
```

函数 open_clientfd 会使用 hostname 和 port 调用 getaddrinfo 然后遍历 addrinfo 调用 socket 和 connect 直到建立链接。函数 open_listenfd 则是监听 port 端口。

### Example Echo Client and Server

建议 client 和 server 通信的例子，准备 3 个文件 [echoservi.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/network/echoserveri.c), [echo.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/network/echo.c), [echoclient.c](https://github.com/sbwkl/practice-example/blob/master/computer-systems/network/echoclient.c)

编译文件
```
gcc -o target/echoserveri echoserveri.c echo.c -I../libs ../libs/libcsapp.so -pthread

gcc -o target/echoclient echoclient.c -I../libs ../libs/libcsapp.so -pthread
```

运行程序
```
# 启动 server 监听 2333 端口
target/echoserveri 2333

# 链接本地 2333 端口，此时 server 会打印链接成功日志
target/echoclient localhost 2333

# 在 client 端输入内容，回车会打印 1 条一模一样的字符串，是 server 写回来的数据，同时 server 打印收到内容的大小
```

## Web Server

### Web Basics

Web client 和 server 通过 *HTTP (hypertext transfer protocol)* 协议通信，web client 通常是浏览器从 server 请求内容并展示在屏幕上。Web content 使用 *HTML (hypertext markup language)* 来描述。Web content 关联 *MIME (multipurpose internet mail extensions)* 

Web server 通过 2 种方式提供 client 内容
+ Fetch a disk file and return its contents to the client. 这种方式通常叫 *serving static content*
+ Run an executable file and return its output to the client. 这种方式通常叫 *serving dynamic content*

每个 HTML 文件都有唯一 *URL (universal resource locator)* 如 http://www.google.com:80/index.html

### HTTP Transactions

程序 telnet 可以模拟 http 请求

```
telnet www.baidu.com 80
Trying 180.101.49.12...
Connected to www.baidu.com.
Escape character is '^]'.
GET / HTTP/1.1
Host: www.baidu.com

HTTP/1.1 200 OK
... 
X-Ua-Compatible: IE=Edge,chrome=1

<!DOCTYPE html><!--STATUS OK-->
<html>
...
</html>
```

使用 telnet 连上后先输入 ```GET / HTTP/1.1``` 回车，指定要发起的是一个 GET 请求，再输入 ```Host: www.baidu.com``` 回车，指定 header 信息，不需要 header 就直接回车，再输入回车发起请求，server 就会返回响应内容，以单独一行换行符为界，上面的是 header 下面的内容

### Serving Dynamic Content

Client 通过 URI 传递参数给 server 使用 ? 区分文件名和参数，参数之间用字符 & 分隔，特殊字符需要转义，比如空格转义成 %20

Server 通过环境变量把参数传给 fork 的子进程，这样的程序叫做 *CGI (common gateway interface) programs* 遵循 CGI standard，CGI 定义了很多环境变量

|Environment variable|Description|
|--|--|
|QUERY_STRING|Program arguments|
|SERVER_PORT|Port that the parent listening on|
|REQUEST_METHOD|GET or POST|
|REMOTE_HOST|Domain name of client|
|REMOTE_ADDR|Dotted-decimal IP address of client|
|CONTENT_TYPE|POST only: MIME type of request body|
|CONTENT_LENGTH|POST only: Size in bytes of request body|

CGI 程序会把内容输出到标准输出 stdout，在运行子程序之前先把 stdout 重定向到分配给 client 的描述符，通过这种方式，子程序就可以把结果返回给 client。

## Putting It Together: The tiny Web Server

[Tiny Web Server 实现](https://github.com/sbwkl/practice-example/blob/master/computer-systems/network/tiny.c)

程序由 8 个函数组成，一个 main 函数和 7 个功能函数

```
void doit(int fd);
void read_requesthdrs(rio_t *rp);
int parse_uri(char *uri, char *filename, char *cgiargs);
void serve_static(int fd, char *filename, int filesize);
void get_filetype(char *filename, char *filetype);
void serve_dynamic(int fd, char *filename, char *cgiargs);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);
```

函数 main 从命令行解析端口号，打开 socket 等待客户端连接，通过死循环来重复处理客户端的请求，处理的过程委托给 doit 函数，处理完成后会关闭 connfd。

函数 doit 从 connfd 读取第一行，解析 method uri version 然后委托 read_requesthdrs 处理 header 信息。委托 parse_uri 解析文件名和参数，根据请求类型分别委托给 serve_static 和 serve_dynamic，错误处理委托给 clienterror 函数。

函数 read_requesthdrs 读取每一行 header 信息，直到读取到空行结束，这里只是简单的打印，实际情况下要对 header 做处理。

函数 parse_uri 通过 uri 中是否含有 target 字符串（这个是自定义的，没啥标准）判断是否静态请求。对于静态内容请求设置 cgiargs 为空，设置 filename 为 ./ 拼上 uri，如果以 / 结尾还会拼上 home.html。对于动态内容请求把 uri 以 ? 为界分成 2 段，前段拼上 ./ 组成 filename 后段赋值给 cgiargs。

函数 serve_static 打开 filename 文件，映射到内存，然后在写入到 connfd 返回给 client 

函数 serve_dynamic fork 子进程，重定向子进程的标准输出到 connfd 然后执行 filename 文件，父进程等待子进程返回并回收

函数 clienterror 用来处理异常情况，把错误信息返回给 client

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">07/03/2020</p>