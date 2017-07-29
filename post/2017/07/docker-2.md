# Docker 学习笔记（二）

## 介绍

接上一篇 [Docker 学习笔记](post/2017/06/docker-1.md) 接下来分享下如何构建 docker image

## 构建

目前我知道的有 2 种方式可以构建 docker image 一种是通过命令 `docker commit` 创建一个 image 另一种是通过 Dockerfile 构建一个 images

### 通过 docker commit 创建

这种方式相对比较简单

1. 启动一个原始镜像比如 ubuntu 

    ```
    docker run -it --name some-ubuntu ubuntu bash
    ```
    ubuntu 这个镜像似乎无法通过 `-d` 启动
2. 对容器做修改，比如安装 java 环境

    ```
    ## 更新 ubuntu 源
    apt-get update
    
    ## 安装 wget 用来下载 java 安装程序
    apt-get install wget
    
    ## 安装 vim 用来编辑文件
    apt-get install vim
    cd /opt
    
    ## 下载 java 安装程序
    wget http://192.168.0.48/%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9B%B8%E5%85%B3/Java/jdk-8u112-linux-x64.tar.gz
    
    ## 解压缩
    tar -zxvf jdk-8u112-linux-x64.tar.gz
    
    ## 设置环境变量
    vi ~/.profile
    source ~/.profile
    ```
    
1. 从容器中退出，然后执行命令创建镜像

    ```
    docker commit some-ubuntu ubuntu-java
    ```
    通过 ```docker images``` 可以查看多出了一个镜像 ubuntu-java
    
1. 运行制作好的镜像
    
    ```
    docker run -it --name another-ubuntu ubuntu-java
    
    ## 检查 java 环境
    source ~/.profile
    java -version
    ```
    

### 通过 Dockerfile 创建

这种创建方式其实就是把上一种方式的操作都写到一个文件里面，然后通过 docker 命令去构建新的镜像，这种方法的好处是可以很方便的回滚某个操作，上面的操作我们可以用这么一个文件 ```Dockerfile``` 来描述

1. 编写 ```Dockerfile``` 文件

    ```
    FROM ubuntu

    RUN apt-get update \
        && apt-get install -y wget \
        && apt-get install -y vim

    WORKDIR /opt

    RUN wget http://192.168.0.48/%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9B%B8%E5%85%B3/Java/jdk-8u112-linux-x64.tar.gz \
        && tar -zxvf jdk-8u112-linux-x64.tar.gz

    ENV JAVA_HOME=/opt/jdk1.8.0_112

    ENV PATH=$PATH:$JAVA_HOME/bin

    CMD ["java", "-version"]
    ```

1. 使用命令构建镜像

    ```
    docker build -t some-java .
    ```

1. 检查生成的镜像

    ```
    docker run -it --rm some-java
    java version "1.8.0_112"
    Java(TM) SE Runtime Environment (build 1.8.0_112-b15)
    Java HotSpot(TM) 64-Bit Server VM (build 25.112-b15, mixed mode)
    ```

## 参考链接

+ [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
+ [docker build](https://docs.docker.com/engine/reference/commandline/build/)


<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">07/24/2017</p>