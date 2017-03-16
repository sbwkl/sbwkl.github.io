## goaccess使用

### 介绍
goaccess用于分析分析web日志，提供html，csv，json格式的报告的软件，可以运行在类linux系统里，常用于分析nginx日志。

https://goaccess.io

### 安装
goaccess安装很简单，根据不同系统使用不同命令
#### CentOS ####

    # yum install goaccess
    
#### Ubuntu ####

    # apt-get install goaccess

#### 编译安装 ####

如果有特殊需求也可以通过编译安装，如果编译安装需要注意配置参数，如需要能持久化功能就需要配置`--enable-tcb=<memhash|btree>`参数，详细参数查看[这里](https://goaccess.io/man#configuration)

    $ wget http://tar.goaccess.io/goaccess-1.1.1.tar.gz
    $ tar -xzvf goaccess-1.1.1.tar.gz
    $ cd goaccess-1.1.1/
    $ ./configure --enable-geoip --enable-utf8
    $ make
    # make install
    
### 使用方法

在终端生成报告

    # goaccess -f /var/log/nginx/access.log
    
生成HTML报告
    
    # goaccess -f /var/log/nginx/access.log --load-from-disk --keep-db-files --db-path=/home/ucmed/database/ -a -o report.html
    
生成CSV报告

    # goaccess -f /var/log/nginx/access.log --load-from-disk --keep-db-files --db-path=/home/ucmed/database/ -a -o report.csv
    
生成JSON报告

    # goaccess -f /var/log/nginx/access.log --load-from-disk --keep-db-files --db-path=/home/ucmed/database/ -a -o report.json

生成特定内容的报告

    # sed -n -e '/^open\.rubik\.zwjk\.com/p;/^open\.zwjk\.com/p; /^api\.zwjk\.com/p' /var/log/nginx/access.log | awk '$8=$1$8' | goaccess -a -o report$RANDOM.html
    
`-f` 用于指定需要分析的日志

`--load-from-disk` 表明 分析结果持久化到磁盘

`--keep-db-files` 表明 从磁盘读取之前持久化的结果，聚合到这次分析中

`--db-path` 表明 指定持久化磁盘的位置，默认为`/tmp`

goaccess支持管道命令（sed，awk）可以通过这些命令来过滤数据，有了这个特性就可以做出各种各样的分析了，详细的点击[这里](https://goaccess.io/man#examples)

上面的这个例子统计了日志中包含open.zwjk.com,open.rubik.zwjk.com,api.zwjk.com而且data部分使用虚拟host+URL记录的HTML统计

更多的参数点击[这里](https://goaccess.io/man#options)，多个日志文件的处理方式点击[这里](https://github.com/allinurl/goaccess#multiple-log-files)

### 配置文件

参数除了可以通过命令行的方式指定，还可以通过配置文件指定，CentOS7系统下配置文件位于`/etc/goaccess.conf`，在配置文件中需要关注`log-format`参数，这个参数决定如何解析日志，以nginx日志为例，在`/etc/nginx/nginx.conf`中有一段日志格式的配置

    log_format  main  '$host '
                      '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for" '
                      '"$request_time" "$upstream_response_time"';

    access_log  /var/log/nginx/access.log  main;
    
打印出来的日志是这样的

    192.168.0.11 192.168.1.14 - - [23/Feb/2017:11:37:34 +0800] "GET / HTTP/1.1" 200 11450 "-" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36" "-" "0.017" "0.017"
    
log-format的配置是这样的

    log-format %v %h - %^ [%d:%t %^] "%r" %s %b "%R" "%u" "%^" "%T" "%^"
    
log-format的配置是根据nginx的日志格式来确定

`%v` 表明访问的域名

`%h` 表明访问者的ip

[更多...](https://goaccess.io/man#custom-log)

通过这个项目[nginx2goaccess](https://github.com/stockrt/nginx2goaccess)转化log-format，比如上面的例子可以这么执行

    # nginx2goaccess.sh '$host ''$remote_addr - $remote_user [$time_local] "$request" ''$status $body_bytes_sent "$http_referer" ''"$http_user_agent" "$http_x_forwarded_for" ''"$request_time" "$upstream_response_time"';
    
可以得到下面的结果    
    
    - Generated goaccess config:

    time-format %T
    date-format %d/%b/%Y
    log_format %v %h - %^ [%d:%t %^] "%r" %s %b "%R" "%u" "%^" "%T" "%^"
    
备注：time-format和data-format似乎有问题，log_format也是，应该是log-format才对，估计是版本问题，好久没更新了，用默认的就可以，只要修改下log-format就可以了