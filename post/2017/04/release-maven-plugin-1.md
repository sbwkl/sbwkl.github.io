## release-maven-plugin 使用心得

### 介绍

[Maven Release Plugin](http://maven.apache.org/maven-release/maven-release-plugin/) 是一个 maven 插件，用来发布项目，节省大量的手动工作，主要使用两个命令 prepare 和 perform

### 环境准备

- [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](http://maven.apache.org)
- [Nexus](http://www.sonatype.org/nexus/)

假设 Nexus 的信息为

    用户名：admin
    密  码：admin123
    
### 配置信息

在 settings.xml 文件的 servers 节点增加一个 server 节点，配置 Nexus 的账户信息

```
<servers>
    <server>  
        <id>nexus-releases</id>  
        <username>admin</username>  
        <password>admin123</password>  
    </server>
</servers>
```
我们可以在当前用户下的 .m2 文件夹或者 maven 安装目录的 conf 文件夹中找到它

在 pom.xml 中配置 scm 和 distributionManagement 信息

```
<scm>
    <connection>scm:git:git@github.com:sbwkl/todo-example.git</connection>
    <developerConnection>scm:git:git@github.com:sbwkl/todo-example.git</developerConnection>
</scm>
```

```
<distributionManagement>
    <repository>
        <id>nexus-releases</id>
        <name>Nexus Releases Repository</name>
        <url>
            http://192.168.2.195:8081/nexus/content/repositories/release/
        </url>
    </repository>
    <snapshotRepository>
        <id>nexus-snapshots</id>
        <name>Nexus Snapshots Repository</name>
        <url>
            http://192.168.2.195:8081/nexus/content/repositories/snapshots/
        </url>
    </snapshotRepository>
</distributionManagement>
```

在项目中添加插件

```
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-release-plugin</artifactId>
        <version>2.5.3</version>
    </plugin>
</plugins>
```

### 执行命令

```
mvn release:prepare -Darguments="-Dmaven.test.skip=true -Dfile.encoding=UTF-8" -DautoVersionSubmodules=true
```

这句命令会检查是否有未提交的本地代码，是否存在 -SNAPSHOT 结尾的版本号，如果存在问题会中断操作，再次执行这个命令会从中断的地方继续执行，命令执行完成后会在服务端 release 一个 tag 如果需要从头开始执行这句命令

```
mvn release:prepare -Dresume=false
```
或者

```
mvn release:clean release:prepare
```

- ```-Darguments``` 指定 maven 的一些参数，这里跳过测试
- ```-DautoVersionSubmodules=true``` 多 module 项目不需要一个一个子项目确认版本号

prepare 命令执行成功后，执行第二句命令

```
mvn release:perform -Darguments="-f web/pom.xml -Pisv -Dmaven.test.skip=true -Dfile.encoding=UTF-8"
```

这句命令会从 tag 检出代码然后打包上传到 Nexus 

指定版本号命令

```
mvn --batch-mode release:update-versions -DdevelopmentVersion=1.2.0-SNAPSHOT
```

这句命令在 hotfix 的时候会比较有用，注意版本号必须以 -SNAPSHOT 结尾，否则插件会无视指定的版本号而选择自动升级版本号

详细的源码在这里 [example](https://github.com/sbwkl/todo-example/tree/master/release-example)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">05/12/2017</p>