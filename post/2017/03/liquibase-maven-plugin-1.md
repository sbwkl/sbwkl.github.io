## liquibase-maven-plugin 使用心得

### 介绍
liquibase 是一个数据库版本管理工具，提供了 update, rollback 等方法用来管理数据库的版本。liquibase 通过把每次数据库变更抽象成 changeSet，再通过 xml 把 changeSet 串起来。通过命令可以更新/回滚数据库到特定版本

### 引入原因
日常的业务开发少不了数据库，但是 sql 没有像 svn，git 这样有工具来管理版本，在团队成立之初甚至于直接干过从开发库往生产库拷贝这样的事  
 
后来逐渐将每一次更新库表的操作存储成 sql 文件，然后在需要的时候执行 sql 文件，但是由于每个版本更新库表的次数很多导致每次都有很多个 sql 需要执行，很不方便，为了解决这个问题，写了一个 bat 脚本来批量执行 sql。  
 
在开发过程中会频繁的运行这个 bat 脚本，一部分 sql 文件在第二次运行的时候会出错，如对某张表添加一个字段的操作，为了保证每个sql 能够执行多次，使用存储过程来添加字段，在存储过程中判断字段是否已经添加  
 
一次偶然的机会，在[安姐](http://mp.weixin.qq.com/s/1EPlPJwEscpP2Llm27WVmg)的小密圈中发现了 liquibase 这个工具，与它类似的还有 flyway，相对来说 liquibase 的文档更加齐全一点，这里选择了 liquibase。

### 环境准备
- [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](http://maven.apache.org)
- [MySQL](https://www.mysql.com)
    
假设 MySQL 的链接信息
```
host    :127.0.0.1
port    :3306
dbname  :liquibase-example
username:root
password:123456
```

### 项目结构

liquibase 可以通过 [command line](http://www.liquibase.org/documentation/command_line.html), [Ant](http://www.liquibase.org/documentation/ant/index.html), [Maven](http://www.liquibase.org/documentation/maven/index.html), [Spring](http://www.liquibase.org/documentation/spring.html), [servlet listener](http://www.liquibase.org/documentation/servlet_listener.html) 和 [CDI Environment](http://www.liquibase.org/documentation/cdi.html) 运行，因为项目是 Maven 的，所以选择 Maven 来运行 liquibase。

项目的结构如下，在实际使用时作为父项目的一个 module 存在，需要注意的是在执行 Maven 命令时需要 cd 到具体的项目，不要直接在父项目下运行

```
.
├── db
│   ├── ddl                                                    sql 存放文件夹
│   │   ├── 1.1.x                                              minor 中版本
│   │   │   ├── 1.1.6                                          patch 小版本
│   │   │   │   ├── 001_table_dynamic_func_create.sql          sql 文件
│   │   │   │   ├── 008_table_user_push_create.sql
│   │   │   │   └── db.changelog-1.1.6.xml                     配置信息
│   │   │   ├── 1.1.7
│   │   │   │   ├── 001_table_mi_message_info_create.sql
│   │   │   │   ├── 002_table_me_message_entrance_create.sql
│   │   │   │   └── db.changelog-1.1.7.xml
│   │   │   └── db.changelog-1.1.x.xml
│   │   └── db.changelog-master.xml
│   ├── dev
│   │   └── liquibase.properties                               dev 环境的 jdbc 配置
│   └── dev-test
│       └── liquibase.properties                               dev-test 环境的 jdbc 配置
└── pom.xm
```
sql 文件的版本管理与项目相同，使用 major.minor.patch 的方式命名

pom.xml 中添加 liquibase-maven-plugin 插件，同时添加对应的数据库依赖，我使用的是 MySQL，如果想使用 H2 数据库，就添加 H2 的依赖

```
<plugin>
    <groupId>org.liquibase</groupId>
    <artifactId>liquibase-maven-plugin</artifactId>
    <version>3.5.3</version>
    <configuration>
        <promptOnNonLocalDatabase>false</promptOnNonLocalDatabase>
        <propertyFile>./db/${runtime.env}/liquibase.properties</propertyFile>
    </configuration>
</plugin>
```
```
<dependencies>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.6</version>
    </dependency>
</dependencies>
```
```
<profiles>
    <profile>
        <id>dev</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <runtime.env>dev</runtime.env>
        </properties>
    </profile>
    <profile>
        <id>dev-test</id>
        <properties>
            <runtime.env>dev-test</runtime.env>
        </properties>
    </profile>
</profiles>
```
使用 profile 来区分不同的环境，避免频繁的修改配置文件，dev 一般是不提交到 Git 的，作为本地使用，每位成员各自一份

信息可以通过 properties 配置，也可以直接配置插件的 configuration 节点里面，这里选择 properties 配置

```
promptOnNonLocalDatabase=false
changeLogFile=db/ddl/db.changelog-master.xml
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:3306/liquibase-example?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true
username=root
password=123456
```
指定数据库的信息，url 添加 characterEncoding=UTF-8 以免出现乱码

changeSet 有全局唯一的 id 否则会报错，author 填写这次修改的成员昵称。
changeSet 下有 createTable, alterTable, dropTable 等标签用于数据库修改，由于项目之前已经有 sql 文件保存下来，这里直接使用 sqlFile 标签，详细介绍参考[这里](http://www.liquibase.org/documentation/changes/sql_file.html)

```
<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
                   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                   xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
                   http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.2.xsd">

    <changeSet id="1.1.6" author="zhang">
        <tagDatabase tag="1.1.6"/>
    </changeSet>
    <changeSet id="1.1.6-1" author="zhang">
        <sqlFile encoding="UTF-8" relativeToChangelogFile="true" path="001_table_dynamic_func_create.sql"/>
        <rollback>
            DROP TABLE IF EXISTS `dynamic_func`;
        </rollback>
    </changeSet>
    <changeSet id="1.1.6-2" author="li">
        <sqlFile encoding="UTF-8" relativeToChangelogFile="true" path="008_table_user_push_create.sql"/>
        <rollback>
            DROP TABLE IF EXISTS `user_push`;
        </rollback>
    </changeSet>
</databaseChangeLog>
```

更新数据库版本

    mvn liquibase:update

查看需要更新的 changeSet

    mvn liquibase:status
    
回滚数据库版本，3 种方法取其中一种
    
    mvn liquibase:rollback -Dliquibase.rollbackTag=1.1.6
    mvn liquibase:rollback -Dliquibase.rollbackCount=1
    mvn liquibase:rollback -Dliquibase.rollbackDate=2017-03-30
    
[更多命令](http://www.liquibase.org/documentation/maven/index.html)

详细的例子在这里 [example](https://github.com/sbwkl/todo-example/tree/master/liquibase-example)，参考了这个[项目](https://github.com/bigpuritz/javaforge-blog/tree/master/liquibase-sample)。

### 常见问题

执行命令途中卡在 Waiting for changelog lock....
```
INFO 17-3-30 2:17: liquibase: Waiting for changelog lock....
INFO 17-3-30 2:18: liquibase: Waiting for changelog lock....
INFO 17-3-30 2:18: liquibase: Waiting for changelog lock....
INFO 17-3-30 2:18: liquibase: Waiting for changelog lock....
INFO 17-3-30 2:18: liquibase: Waiting for changelog lock....
```
上一次执行命令时意外中断，或者有其他人正在使用同一个数据库执行命令。在确保没别人使用的情况下只用命令释放锁
    
    mvn liquibase:releaseLocks

    
### 参考链接

- [http://www.liquibase.org](http://www.liquibase.org)
- [https://github.com/liquibase/liquibase](https://github.com/liquibase/liquibase)
- [https://github.com/bigpuritz/javaforge-blog/tree/master/liquibase-sample](https://github.com/bigpuritz/javaforge-blog/tree/master/liquibase-sample)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">03/30/2017</p>
