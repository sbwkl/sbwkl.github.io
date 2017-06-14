# GitLab CI 学习笔记

## 介绍

GitLab 内置了持续集成/持续部署，可以编译，测试，部署代码。在项目中的 Pipelines 标签页中可以查看 CI 的结果，如果没有配置，那么这个标签页下面是没有内容的

### 特性

- 多平台支持：Unix, Windows, OSX 和其他支持 Go 的平台
- 多语言支持：支持 Java, PHP, Ruby, C 等
- 稳定：执行编译，测试等操作的机子是其他机子，不是 GitLab 本身，不会对 GitLab 服务端造成影响
- 实时日志：实时查看正在构建的任务的日志

### 架构图

![Architecture](https://about.gitlab.com/images/ci/arch-1.jpg)

从上图中可以看出 GitLab CI 由两部分组成 GitLab Server 和 GitLab Runner

- GitLab Server 就是提供版本管理的服务端
- GitLab Runner 是执行编译，测试，打包等操作的应用，它可以运行在支持 Go 语言的平台，如 Linux, OSX, Windows 等，通过 API 和 GitLab Server 通信

## GitLab CI 配置

一共需要做两件事情，这两件事不分先后顺序，我选择的是先配置 GitLab Runner

- 在根目录添加一个 ```.gitlab-ci.yml``` 文件
- 配置 GitLab Runner

### 配置 GitLab Runner

Runner 可以运行在很多平台，我使用的是一台 CentOS7 的虚拟机

1. 添加 GitLab 的官方源

    ```
    # For Debian/Ubuntu
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

    # For RHEL/CentOS
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash
    ```

1. 安装 ```gitlab-ci-multi-runner```

    ```
    # For Debian/Ubuntu
    sudo apt-get install gitlab-ci-multi-runner

    # For RHEL/CentOS
    sudo yum install gitlab-ci-multi-runner
    ```

1. [注册 Runner](https://docs.gitlab.com/runner/register/index.html)

    1. 执行命令
    
        ```
        sudo gitlab-ci-multi-runner register
        ```
    1. 填写 GitLab 的 URL
    
        ```
        Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com )
        http://192.168.0.116/ci
        ```
    1. 填写 Token 
    
        ```
        Please enter the gitlab-ci token for this runner
        DVZL3rvQHWwSAa1tgMPK
        ```
    1. 填写 runner 的描述，也就是名字，可以通过 web UI 修改
    
        ```
        Please enter the gitlab-ci description for this runner
        my-runner
        ```
    1. 填写 tag 列表，用逗号隔开，可以通过 web UI 修改
    
        ```
        Please enter the gitlab-ci tags for this runner (comma separated):
        xx-25t,obj140
        ```
    1. 选择 Runner 选择 job 的时候是否需要tags。可以通过 web UI 修改 true：不用匹配 tag，false：需要匹配 tag 才能被 Runner 执行
    
        ```
        Whether to run untagged jobs [true/false]:
        [false]: false
        ```
    1. 选择是否锁定 Runner
    
        ```
        Whether to lock Runner to current project [true/false]:
        [false]: false
        ```
    1. 填写 Runner executor
    
        ```
        INFO[0034] fcf5c619 Registering runner... succeeded
        Please enter the executor: shell, docker, docker-ssh, ssh?
        docker
        ```
    1. 填写默认镜像
    
        ```    
        Please enter the Docker image (eg. ruby:2.1):
        ruby:2.1
        INFO[0037] Runner registered successfully. Feel free to start it, but if it's
        running already the config should be automatically reloaded!
        ```

配置完成！

其中 URL 和 Token在 Settings ==> CI/CD Pipelines 的 Specific Runners 中找到，就是第 2 步和第 3 步
    
### 创建 ```.gitlab-ci.yml``` 文件

注：```.gitlab-ci.yml``` 是 [YAML](https://learn.getgrav.org/advanced/yaml) 文件，熟悉文件的语法会很有帮助，冒号后面需要有空格，不要使用制表符 Tab

在 GitLab 项目的根目录添加 ```.gitlab-ci.yml``` 文件

```
maven-build:
    image: maven:3-jdk-8
    stage: build
    script: "mvn package -B -Dmaven.test.skip=true"
    artifacts:
        paths:
            - target/*.jar
tags: 
    - xx-25t
```

这个示例配置做了这么几件事情

1. 定义一个 ```maven-build``` 的 job
2. 使用 Docker Hub 上 [maven](https://store.docker.com/images/maven) 镜像来编译项目，使用的脚本为 ```mvn package -B -Dmaven.test.skip=true```

如果想要校验 ```.gitlab-ci.yml``` 是否正确，可以在 Pipelines ==> Pipelines 或者 Pipelines ==> Jobs 页面的右边找到「CI Lint」按钮，点击进入可以校验文件

### 修改 config.toml 配置

因为官方的 docker 镜像使用的是官方的 maven 仓库，部分公司的 jar 不再官方仓库，所以需要把镜像中的 maven 配置修改掉

1. 修改 Runner 所在服务器的配置文件 ```/etc/gitlab-runner/config.toml``` 增加镜像的更新策略为 if-not-present 如果本地有镜像就不下载镜像了

    ```
    [[runners]]
      name = "0.11-runner"
      url = "http://192.168.0.116/ci"
      token = "7515aa52de264ebede1288017d8555"
      executor = "docker"
      [runners.docker]
        tls_verify = false
        image = "ruby:2.1"
        privileged = false
        disable_cache = false
        volumes = ["/cache"]
        shm_size = 0
        pull_policy=if-not-present
      [runners.cache]
    ```

1. 修改官方的 maven 镜像，把自定义的 Nexus 地址添加到 settings.xml 中，重命名新的镜像为 ucmed/maven
1. 修改 ```.gitlab-ci.yml``` 中的镜像为 ucmed/maven

### 日常使用

当有新的代码被 push 到服务器或者有 Merge Request 被合并时就会触发去执行 maven-build 任务，执行完成后会反馈结果，如果 failed 会有邮件通知

## 参考链接

+ [GitLab-ci 介绍](https://about.gitlab.com/features/gitlab-ci-cd)
+ [GitLab-CI quick start](https://gitlab.com/help/ci/quick_start/README.md)
+ [安装 GitLab Runner](https://docs.gitlab.com/runner/install)
+ [config.toml 高级配置](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md)
+ [config.toml.example](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/config.toml.example)


<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">06/08/2017</p>