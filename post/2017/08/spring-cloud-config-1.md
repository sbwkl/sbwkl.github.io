# Spring Cloud Config 学习笔记

[Spring Cloud Config](http://cloud.spring.io/spring-cloud-config/) 是 Spring Cloud 的子项目，通过 Git 仓库集中管理应用的配置，它会把配置信息直接隐射成 Spring Environment 中的信息，Spring Cloud Config 与 spring 项目集成比较容易，当然如果需要也能与其他非 Spring 项目集成

Spring Cloud Config 由 3 部分组成

- Spring Cloud Config Server
- Git Repo
- Spring Cloud Config Client

其中 Server 用来把配置信息映射 Http 资源，Git Repo 用来存储配置信息，Client 是使用这些配置的应用，通常是多个

## Spring Cloud Config Server

1. 通过 [Spring Initializr](http://start.spring.io) 生成 Maven 项目，在 Dependencies 中添加 Config Server
1. 修改 src/main/resources/application.properties 文件

    ```
    server.port=8888
    spring.cloud.config.server.git.uri=file:///F:/config
    ```
1. 修改 application 类添加注解 ```@EnableConfigServer```
1. 执行 ```mvn spring-boot:run``` 命令启动 Server 端
1. Server 会将隐射配置文件，其中 label 为 Git Repo 中的 Branch

    ```
    /{application}/{profile}[/{label}]
    /{application}-{profile}.yml
    /{label}/{application}-{profile}.yml
    /{application}-{profile}.properties
    /{label}/{application}-{profile}.properties
    ```
    
    在本例子中可以访问 http://127.0.0.1:8888/app/dev,test 查看配置信息
    
## Git Repo

1. 在 F:/config 中添加 2 个文件，放在其他盘符也可以，只要与 ```spring.cloud.config.server.git.uri``` 配置的路径相同即可

    文件 app-dev.yml 内容为
    
    ```
    message: dev
    ```
    
    文件 app-test.yml 内容为
    
    ```
    message: test
    ```

1. 将文件提交到仓库

    ```
    git add .
    git commit -m '提交 2 个文件'
    ```
    
## Spring Cloud Config Client

1. 通过 [Spring Initializr](http://start.spring.io) 生成 Maven 项目，在 Dependencies 中添加 Config Client 和 Web
1. 删除 src/main/resources/ 下的 application.properties 增加 bootstrap.yml 文件

    ```
    spring:
      application:
        name: app
      profiles:
        active: dev

      cloud:
        config:
          uri: http://127.0.0.1:8889
    ```

1. 向 XXApplication.java 文件中添加一个 Rest 请求

    ```
    @RefreshScope
    @RestController
    class MessageRestController {

        @Value("${message:Hello default}")
        private String message;

        @RequestMapping("/message")
        String getMessage() {
            return this.message;
        }
    }
    ```

1. 执行 ```mvn spring-boot:run``` 启动 Client 端
1. 访问 ```http://127.0.0.1:8080/message``` 返回数据 dev
1. 修改 app-dev.yml 中 message 的值为 dev1 提交到仓库中
1. 重启 Client 项目，再次访问返回数据 dev1
1. 如果不想重启 Client 需要在 Client 中添加 Actuator 依赖，在 Spring Initializr 中添加，然后配置文件中添加配置跳过认证

    ```
    management:
      security:
        enabled: false
    ```

1. 使用命令 ```curl -X POST http://127.0.0.1:8080/refresh``` 刷新配置

    
## 参考链接

+ [centralized-configuration](https://spring.io/guides/gs/centralized-configuration)
+ [Reference](http://cloud.spring.io/spring-cloud-static/spring-cloud.html#_spring_cloud_config)
+ [Fork me on GitHub](https://github.com/spring-cloud/spring-cloud-config)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">08/25/2017</p>