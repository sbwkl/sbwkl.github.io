# GitLab CI 学习笔记（二）

## 介绍

使用 GitLab CI 一段时间，Docker Registry 从自建的迁移到了腾讯云的容器服务，相应的也增加了一些安全配置。同时为了拥抱 Docker 在 Pipeline 中增加了制作 Image 的 Job

## GitLab CI 配置

GitLab Runner 我们上次已经安装好了，这次就不重新安装了，值得一提的是 gitlab-ci-multi-runner 是旧版本，新版本的名字是 gitlab-runner 建议都安装新版本的，虽然目前来看 2 个版本是兼容的

### 配置 Docker Registry 信息

假定有以下信息

- Registry Host = ccr.ccs.tencentyun.com
- username = 3091931055
- password = my password

1. 执行命令 ```echo -n "3091931055:my password" | base64``` 可以获得一串字符串，假定字符串的内容是 bXlfdXNlcm5hbWU6bXlfcGFzc3dvcmQ=
1. 组装 DOCKER_AUTH_CONFIG 的值，auth 的值为通过命令生成的字符串，key 是域名

    ```
    {
     "auths": {
         "ccr.ccs.tencentyun.com": {
             "auth": "bXlfdXNlcm5hbWU6bXlfcGFzc3dvcmQ="
         }
     }
    }
    ```
1. 在 GitLab > settings > CI/CD Pipelines > Secret Variables 中添加一个值
    
    ```
    key = DOCKER_AUTH_CONFIG
    value = 上面拼装的字符串
    ```
1. 接下就能访问 ccr.ccs.tencentyun.com 中对应的镜像了
1. 有些时候我们需要在容器里面也能访问仓库，比如做完镜像后要把镜像传到仓库，这个时候可以手动把认证信息写入到容器里面，在 script 里添加

    ```
    - echo ${DOCKER_AUTH_CONFIG}
    - mkdir ~/.docker
    - echo ${DOCKER_AUTH_CONFIG} > ~/.docker/config.json
    ```

### 配置制作镜像的 Job

以项目的 project.version 作为 Images 的 Tag 每次制作的镜像覆盖前一次，Job 分成 2 部分，build artifact 和 build image

1. 编译构建制作镜像需要的 war 包，并且传递到下一个 Job 构建的产物都放在 target 下避免被版本管理系统给删除了，GitLab 不能传递参数，就通过把参数写在文件里，然后通过文件传递到下一个 Job

    ```
    build-artifact: 
    image: ccr.ccs.tencentyun.com/big-devil/ie:1.0.0
    stage: build
    script: 
        - ls book/
        - mvn -f book/pom.xml clean package -Dmaven.test.skip=true
        - echo 'PROJECT_VERSION=${project.version}' | mvn -f book/pom.xml help:evaluate | grep PROJECT_VERSION > book/target/VERSION
    artifacts: 
        paths: 
            - book/target/*.jar
            - book/target/VERSION
    only: 
        - master
    tags: 
        - maven
    ```
    
2. 构建 docker image. dependencies 关联了上一个 Job 保证能拿到上个 Job 的 artifacts，当然也有个要求 stage 要求在上个 Job 之后

    ```
    deploy-docker-image:
    image: docker
    stage: deploy
    script: 
        - source book/target/VERSION
        - mkdir ~/.docker
        - echo ${DOCKER_AUTH_CONFIG} > ~/.docker/config.json
        - docker build -t ccr.ccs.tencentyun.com/big-devil/book:${PROJECT_VERSION} .
        - docker images | grep 'ccr.ccs.tencentyun.com/big-devil/book'
        - docker push ccr.ccs.tencentyun.com/big-devil/book:${PROJECT_VERSION}
    dependencies: 
        - build-artifact
    only: 
        - master
    tags: 
        - maven
    ```

3. 2 个任务都设置仅 master 分支有代码变更才执行，减少了不必要的构建过程，同时将 Docker Registry 信息封装在 DOCKER_AUTH_CONFIG 中也比较有效的降低了帐号泄露的风险
    
## 参考链接

+ [Private Docker Registry](https://docs.gitlab.com/ce/ci/docker/using_docker_images.html#define-an-image-from-a-private-docker-registry)
+ [GitLab CI dependencies](https://docs.gitlab.com/ce/ci/yaml/README.html#jobs)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">07/02/2018</p>