## 使用GitHub Pages和Jekyll搭建个人blog

1. [环境准备](#环境准备)
2. [创建 repository](#创建 repository)
3. [本地预览](#本地预览)
1. [保持本地和 GitHub Pages gem 同步](#保持本地和 GitHub Pages gem 同步)
1. [常见问题](#常见问题)
1. [参考链接](#参考链接)

### 环境准备
1. [GitHub](https://github.com/) 帐号
1. [Git Bash](https://git-scm.com/)
1. Bundler & Ruby 2.1.0+

推荐使用 Bundler 安装和运行 jekyll。Bundler 管理 Ruby gem dependencies，减少 jekyll 编译错误和环境问题，安装 Bundler 之前需要先安装 Ruby
1. 打开 Git Bash，检查是否有 Ruby 环境
```
$ ruby --version
ruby 2.3.3p222 (2016-11-21 revision 56859) [x64-mingw32]
```
1. 如果命令返回「ruby 不是一个命令」需要先安装 Ruby，访问 https://rubyinstaller.org/downloads ，下载 2.1.0 以上的版本和对应的 development kit
1. 下载完成后，双击 rubyinstaller-2.X.X-x64.exe 安装，安装完成后配置环境变量
1. 安装 Ruby devKit，双击安装到某个目录，如「D:\Program Files\Downloads」，cd 到对应目录，执行命令
```
$ ruby dk.rb init
$ ruby dk.rb install
```
1. 安装 Bundler
```bash
$ gem install bundler
```

### 创建 repository
1. 在 GitHub上 创建一个项目，名字为 your_username.github.io
1. 把项目 clone 到本地，添加一个 README.md 文件，里面随便写点内容，然后执行命令
```git
$ git add README.md
$ git commit -m '我的博客'
$ git push origin master
```
在浏览器访问 your_username.github.io，就能够看到刚才写的内容，但是此时是没有样式的
1. 创建（如果存在就修改）```_config.yml``` 文件，写入
```
theme: jekyll-theme-minimal
repository: your_username/your_username.github.io
google_analytics: 
```
将代码 push 到 GitHub ，再次访问 your_username.github.io ，这次你看到的就是主题为「jekyll-theme-minial」的样式了
1. 现在我们可以写我们的文章了，但是如果我们想要预览我们的页面就需要 push 到 GitHub，这样很不方便

### 本地预览
1. 在 GitHub 创建一个 [Personal access tokens](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)，token 的 scope 只要选中 ```repo``` 即可。注 Personal access tokens 相当于密码，请谨慎保管
1. 配置名为 ```JEKYLL_GITHUB_TOKEN``` 的环境变量 value 等于生成的 token
1. 下载 [cacert.pem](https://curl.haxx.se/ca/cacert.pem) 文件，存放到本机的不易被删除的位置
1. 配置名为 ```SSL_CERT_FILE``` 的环境变量 value 等于文件的绝对地址，QQ 管家可能会报警告，添加信任
1. 如果是 windows 电脑，需要重启
1. 使用命令 ```telnet 127.0.0.1 4000``` 检查端口 4000 是否被占用，如果被占用，kill 掉被占用的程序，FoxitProtect.exe 会占用这个端口

    ```
    $ netstat -ano | findstr 4000
    # TCP    127.0.0.1:4000         0.0.0.0:0              LISTENING       5264
    # TCP    127.0.0.1:4000         127.0.0.1:55907        CLOSE_WAIT      5264
    # TCP    127.0.0.1:4000         127.0.0.1:56037        CLOSE_WAIT      5264
    # TCP    127.0.0.1:55907        127.0.0.1:4000         FIN_WAIT_2      17312
    # TCP    127.0.0.1:56037        127.0.0.1:4000         FIN_WAIT_2      17312

    $ tasklist | findstr 5264
    # FoxitProtect.exe              5264 Services                   0     43,204 K
    ```

1. 创建（如果存在就修改）```Germfile``` 文件，写入
```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```
1. 安装 Jekyll 和其他依赖
```
$ bundle install
```
1. 启动项目
```
$ bundle exec jekyll serve
```
输出信息
```
# Configuration file: D:/workspace/your_username.github.io/_config.yml
# Configuration file: D:/workspace/your_username.github.io/_config.yml
#             Source: D:/workspace/your_username.github.io
#        Destination: D:/workspace/your_username.github.io/_site
#  Incremental build: disabled. Enable with --incremental
#       Generating...
#                     done in 8.279 seconds.
#   Please add the following to your Gemfile to avoid polling for changes:
#     gem 'wdm', '>= 0.1.0' if Gem.win_platform?
#  Auto-regeneration: enabled for 'D:/workspace/your_username.github.io'
# Configuration file: D:/workspace/your_username.github.io/_config.yml
#     Server address: http://127.0.0.1:4000/
#   Server running... press ctrl-c to stop.
```
1. 接着就可以边修改边预览

### 保持本地和 GitHub Pages gem 同步
[Jekyll](https://github.com/jekyll/jekyll) 是一个活跃的开源项目会频繁更新，如果 GitHub Pages 服务器更新了，但是本地没有更新会导致本地预览和实际效果不一致
1. 打开 Git Bash
1. 执行下面提供的方法的其中一种即可
- 方法1，适用于安装了 bundle 程序的环境
```
$ bundle update github-pages
```
- 方法2，适用于没有安装 bundle 程序的环境
```
$ gem update github-pages
```

### 常见问题
+ 出现错误信息

    ```
    Using bundler 1.14.6
    Gem::InstallError: The 'json' native gem requires installed build tools.  
     
    Please update your PATH to include build tools or download the DevKit
    from 'http://rubyinstaller.org/downloads' and follow the instructions
    at 'http://github.com/oneclick/rubyinstaller/wiki/Development-Kit'

    An error occurred while installing json (1.8.6), and Bundler cannot continue.
    Make sure that `gem install json -v '1.8.6'` succeeds before bundling.
    ```
    可能原因是 devKit 没有安装，从[这里](https://rubyinstaller.org/downloads/)下载安装
+ 出现错误信息

    ```
        Configuration file: D:/workspace/minimal/_config.yml
    Configuration file: D:/workspace/minimal/_config.yml
                Source: D:/workspace/minimal
           Destination: D:/workspace/minimal/_site
     Incremental build: disabled. Enable with --incremental
          Generating...
                        done in 1.083 seconds.
      Please add the following to your Gemfile to avoid polling for changes:
        gem 'wdm', '>= 0.1.0' if Gem.win_platform?
     Auto-regeneration: enabled for 'D:/workspace/minimal'
    Configuration file: D:/workspace/minimal/_config.yml
    jekyll 3.4.1 | Error:  Permission denied - bind(2) for 127.0.0.1:4000
    ```
    可能原因是 4000 端口被占用，找到对应程序 kill 掉
+ 出现错误信息

    ```
        Configuration file: E:/workspace/your_username.github.io/_config.yml
    Configuration file: E:/workspace/your_username.github.io/_config.yml
                Source: E:/workspace/your_username.github.io
           Destination: E:/workspace/your_username.github.io/_site
     Incremental build: disabled. Enable with --incremental
          Generating...
       GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
    jekyll 3.4.3 | Error:  SSL_connect returned=1 errno=0 state=error: certificate verify failed
    ```
    可能原因是环境变量 JEKYLL_GITHUB_TOKEN 和 SSL_CERT_FILE 设置不对

### 参考链接
- [GitHub Pages](https://pages.github.com)
- [rubyinstaller](https://rubyinstaller.org/)
- [setting-up-your-github-pages-site-locally-with-jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll)
- [GitHub Metadata NO GitHub api Authentication could be found](http://knightcodes.com/miscellaneous/2016/09/13/fix-github-metadata-error.html)
- [install Ruby 2.1.0 or higher](https://www.ruby-lang.org/en/downloads)
- [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">03/16/2017</p>