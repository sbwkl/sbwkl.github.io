## 使用GitHub Pages和Jekyll搭建个人blog

1. [环境准备](#环境准备)
2. [创建repository](#创建repository)
3. [本地预览](#本地预览)
1. [保持本地和GitHub Pages gem同步](#保持本地和GitHub Pages gem同步)
1. [常见问题](#常见问题)
1. [参考链接](#参考链接)

### 环境准备
1. [GitHub](https://github.com/)帐号
1. [Git Bash](https://git-scm.com/)
1. Bundler & Ruby 2.1.0+

推荐使用Bundler安装和运行jekyll。Bundler管理Ruby gem dependencies，减少jekyll编译错误和环境问题，安装Bundler之前需要先安装Ruby
1. 打开Git Bash，检查是否有Ruby环境
```
$ ruby --version
ruby 2.3.3p222 (2016-11-21 revision 56859) [x64-mingw32]
```
1. 如果命令返回“ruby 不是一个命令”需要先安装Ruby，访问https://rubyinstaller.org/downloads/，下载2.1.0以上的版本和对应的development kit
1. 下载完成后，双击rubyinstaller-2.X.X-x64.exe安装，安装完成后配置环境变量
1. 安装Ruby devKit，双击安装到某个目录，如“D:\Program Files\Downloads”，cd到对应目录，执行命令
```
$ ruby dk.rb init
$ ruby dk.rb install
```
1. 安装Bundler
```bash
$ gem bundle install
```

### 创建repository
1. 在github上创建一个项目，名字为your_username.github.io
1. 把项目clone到本地，添加一个README.md文件，里面随便写点内容，然后执行命令
```git
$ git add README.md
$ git commit -m '我的博客'
$ git push origin master
```
在浏览器访问your_username.github.io，就能够看到刚才写的内容，但是此时是没有样式的
1. 创建（如果存在就修改）```_config.yml```文件，写入
```
theme: jekyll-theme-minimal
repository: your_username/your_username.github.io
google_analytics: 
```
将代码push到GitHub，再次访问your_username.github.io，这次你看到的就是主题为"jekyll-theme-minial"的样式了
1. 现在我们可以写我们的文章了，但是如果我们想要预览我们的页面就需要push到GitHub，这样很不方便

### 本地预览
1. 在GitHub创建一个[Personal access tokens](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)，token的scope只要选中```repo```即可。注Personal access tokens相当于密码，请谨慎保管
1. 配置名为```JEKYLL_GITHUB_TOKEN```的环境变量value等于生成的token
1. 下载[cacert.pem](https://curl.haxx.se/ca/cacert.pem)文件，存放到本机的不易被删除的位置
1. 配置名为```SSL_CERT_FILE```的环境变量value等于文件的绝对地址，QQ管家可能会报警告，添加信任
1. 如果是windows电脑，需要重启
1. 使用命令```telnet 127.0.0.1 4000```检查端口4000是否被占用，如果被占用，kill掉被占用的程序，FoxitProtect.exe会占用这个端口

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

1. 创建（如果存在就修改）```Germfile```文件，写入
```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```
1. 安装Jekyll和其他依赖
```
$ bundle install
```
1. 启动项目
```
$ bundle exec jekyll serve
```
输出信息
```
# Configuration file: D:/workspace/sbwkl.github.io/_config.yml
# Configuration file: D:/workspace/sbwkl.github.io/_config.yml
#             Source: D:/workspace/sbwkl.github.io
#        Destination: D:/workspace/sbwkl.github.io/_site
#  Incremental build: disabled. Enable with --incremental
#       Generating...
#                     done in 8.279 seconds.
#   Please add the following to your Gemfile to avoid polling for changes:
#     gem 'wdm', '>= 0.1.0' if Gem.win_platform?
#  Auto-regeneration: enabled for 'D:/workspace/sbwkl.github.io'
# Configuration file: D:/workspace/sbwkl.github.io/_config.yml
#     Server address: http://127.0.0.1:4000/
#   Server running... press ctrl-c to stop.
```
1. 接着就可以边修改边预览

### 保持本地和GitHub Pages gem同步
[Jekyll](https://github.com/jekyll/jekyll)是一个活跃的开源项目会频繁更新，如果GitHub Pages服务器更新了，但是本地没有更新会导致本地预览和实际效果不一致
1. 打开Git Bash
1. 执行下面提供的方法的其中一种即可
- 方法1，适用于安装了bundle程序的环境
```
$ bundle update github-pages
```
- 方法2，适用于没有安装bundle程序的环境
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
    可能原因是devKit没有安装，从[这里](https://rubyinstaller.org/downloads/)下载安装
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
    可能原因是4000端口被占用，找到对应程序kill掉
+ 出现错误信息
    ```
    GitHub Metadata NO GitHub api Authentication could be found
    ```
    可能原因是环境变量JEKYLL_GITHUB_TOKEN和SSL_CERT_FILE设置不对

### 参考链接
- [GitHub Pages](https://pages.github.com)
- [rubyinstaller](https://rubyinstaller.org/)
- [setting-up-your-github-pages-site-locally-with-jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll)
- [GitHub Metadata NO GitHub api Authentication could be found](http://knightcodes.com/miscellaneous/2016/09/13/fix-github-metadata-error.html)
- [install Ruby 2.1.0 or higher](https://www.ruby-lang.org/en/downloads)
- [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">03/16/2017</p>