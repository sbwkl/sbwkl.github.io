# Docker 学习笔记

## 介绍

Docker 是一个容器平台，可以让很多个容器跑在它上面，彼此之间又不会互相影响。Docker 还可以让部署一个 app 变得简单，不需要进行复杂的配置，总之就是一个能提升程序员幸福感的工具。推荐在 Linux 或者 OSX 上面运行，Windows 可能会有些许问题

## 安装

这里介绍下 CentOS 7 环境的安装，依次运行下面的命令

```
## 移除旧版本 docker 如果从来没有安装过，跳过这一步
$ sudo yum remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine \
                  docker-engine-selinux
                  

## 安装依赖包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

## 添加 docker 源
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

## 更新索引
$ sudo yum makecache fast

## 安装 docker 企业版的化改成 docker-ee 
## 如果是生产环境使用，最好使用特定的版本
sudo yum install docker-ce

## 启动 docker
$ sudo systemctl start docker
```

国内使用官方的 docker 镜像下载速度很慢，这里需要感谢 [daocloud.io](https://www.daocloud.io) 提供了免费国内镜像，运行下面这个命令

```
$ curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://313aeaf1.m.daocloud.io
```

重启 docker

```
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

检查 docker 是否安装完成

```
$ docker version

Client:
 Version:      17.05.0-ce
 API version:  1.29
 Go version:   go1.7.5
 Git commit:   89658be
 Built:        Thu May  4 22:06:25 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.05.0-ce
 API version:  1.29 (minimum version 1.12)
 Go version:   go1.7.5
 Git commit:   89658be
 Built:        Thu May  4 22:06:25 2017
 OS/Arch:      linux/amd64
 Experimental: false
```

如果出现

```
Client:
 Version:      17.05.0-ce
 API version:  1.29
 Go version:   go1.7.5
 Git commit:   89658be
 Built:        Thu May  4 22:06:25 2017
 OS/Arch:      linux/amd64
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

是因为 docker 没有运行

运行第一个 app

```
$ docker run hello-world
```

（可选）配置 docker registry 如果需要把镜像 push 到一个本地的 registry 需要配置

```
## for CentOS
/usr/lib/systemd/system/docker.service
#ExecStart=/usr/bin/dockerd
ExecStart=/usr/bin/dockerd --insecure-registry 192.168.0.167:5000
```

## 使用 docker

根据二八原则，只要掌握 20% 的命令基本就能满足 80% 的日常工作，下面就介绍几个 docker 命令

```
## 后台启动 redis 并且将本地的 16379 端口映射到容器的 6379 端口
$ docker run --name some-redis -p 16379:6379 -p 8080:8080 -d redis

## some-tomcat-app 能够访问 some-redis，在 some-tomcat-app 里 ping -w3 some-redis 能正常返回
$ docker run --name some-tomcat-app --link some-redis -d tomcat:8.5.15-jre8-alpine
```

- ```-p``` 映射本地的端口和容器端口
- ```-d``` 后台运行容器
- ```--name``` 指定容器名字，很有用后面的所有操作都可以根据容器名来，不需要拷贝那个难记的 ID
- ```--rm``` 当退出后自动删除容器，想临时启动某个容器看看的时候挺有用，省了删除的事
- ```--link``` 这个参数可能即将废弃，替代的参数为 ```--network```
- 更多命令查看 ```docker run --help```

```
## 在运行的容器里运行一个命令，常常用来进入容器
$ docker exec -it some-redis /bin/bash
```

- ```/bin/bash``` 一般根据 [store](https://store.docker.com)（一个官方的镜像库）中提供的文档来确定，不知道的话可以试试这个和 ```/bin/sh```
- 如果想退出容器且不停止当前容器按 ctrl + p, ctrl + q
- 更多命令查看 ```docker exec --help```

```
## 列出运行中的容器
$ docker ps

## 列出全部的容器
$ docker ps -a

## 停止一个容器
$ docker stop some-redis

## 删除一个容器
$ docker rm some-redis
```

- 更多命令查看 ```docker --help```

## 使用 docker-compose

每次运行都带那么多参数比较麻烦，这里通过配置 ```docker-compose.yml``` 来运行

使用命令安装 docker-compose Windows 用户安装好 Docker 后直接就可以使用 docker-compose

```
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

这个命令的本质就是下载一个文件，然后丢到 /usr/local/bin 文件夹下面，并且赋予执行权限

对于上面 redis 的命令我们可以配置这样一个文件

```yml
version: '3'

services: 
    rubik-redis: 
        image: redis
        container_name: rubik-redis
        ports: 
            - "8080:8080"
            - "16379:6379"
```

然后运行命令

```
$ docker-compose -f ./docker-compose.yml up -d
```

如果在与配置文件同一个目录，可以不需要 ```-f``` 参数

## 参考链接

+ [Docker 安装](https://docs.docker.com/engine/installation/linux/centos)
+ [加速器](https://www.daocloud.io/mirror#accelerator-doc)
+ [进入容器](https://askubuntu.com/questions/505506/how-to-get-bash-or-ssh-into-a-running-container-in-background-mode)
+ [不停止容器退出](https://stackoverflow.com/questions/25267372/correct-way-to-detach-from-a-container-without-stopping-it)
+ [Docker 官方仓库](https://store.docker.com)


<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">06/26/2017</p>