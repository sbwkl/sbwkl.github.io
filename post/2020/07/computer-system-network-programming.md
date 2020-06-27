# Network Programming 学习笔记

今天学习《Computer Systems 》第十一章 network programming。

## The Client-Server Programming Model

所有的网络应用都基于 *client-server* 模型，它包含一个 *server* 进程和多个 *client* 进程。Server 管理 *resource* 或者提供 *service*。

Client-server 模型最基本的操作是 *transaction* 它有 4 个步骤

+ When a client needs services, it initiates a transaction by sending a *request* to the server.
+ The server receives the request, interprets it, and manipulates its resources in appropriate way.
+ The server send a *response* to the client and then waits for the next request.
+ The client receives the response and manipulates it.

## Networks

Clients 和 servers 通常运行在不同的主机上，通过 *computer network* 通讯。对主机来说 network 是一个 I/O 设备提供数据的收发，插在扩展槽上提供网络的物理接口。从网络来的数据通过 I/O bus 和 memory bus 拷贝到主存，反之亦然。

网络通过层级结构组织，最底层是 LAN (local area network) 最流行的 LAN 技术是 *Ethernet*. *Ethernet segment* 由电线（通常是双绞线）和 hub 组成，线的一段连接到主机的适配器 (adapter)，另一端连接到 hub 的端口 (port) hub 会把收到的数据复制给所有端口，就是说每台主机都会收到一份数据。

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
#include <netinet/in.h>

/* host byte order --> network byte order */
uint32_t htonl(uint32_t hostlong);
uint16_t htons(uint16_t hostshort);

/* network byte order --> host byte order */
uint32_t ntohl(uint32_t netlong);
uint16_t ntohs(uint32_t netshort);
```
n 代表 *network* h 代表 host，htonl 可以这么理解 host to network long type

IP 地址通常用另一种给人看的方式表示，叫做 *dotted-decimal notation* 如 107.212.122.205 通过函数可以互相转化

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

*sin_family* 通常是 AF_INET *sin_port* 是 16-bit 端口 *sin_addr* 是 32-bit IP 地址，通常用 network byte order。

```
#include <sys/types.h>
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
```







