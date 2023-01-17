# 开发一个油猴脚本

前段时间收到一个奇怪的问题，问有没有办法方便的从精选联盟拷贝商品信息到 excel，他现在的做法是一个一个数据拷贝，先拷贝商品标题，接着价格、销量等。

虽然不知道他想干什么，但想着油猴脚本应该能实现，正好那这个来试试手。
​​
我的浏览器一直装着 Tampermonkey 虽然没咋用，想着这么多年过去了，会不会有新产品，搜索了下，吼~~，还不少

1. Tampermonkey: 闭源，据说嵌入了 Google Analytics
2. Greasemonkey: 似乎停止维护了，最后更新时间 2022.4
3. Violentmonkey: 开源，据说也有隐私问题，不过官方解释不会收集用户信息
4. Firemonkey: 在谷歌扩展商店没找到

最后我选了 violentmonkey 其实我倒没那么在意隐私问题，毕竟现在十个电话八个骚扰两个诈骗，都习惯了，更多的是想试试新鲜的。

Violentmonkey 有内置编辑器，可以很方便的创建脚本，点那个加号就行，创建的时候还会自动填充元数据。

```
// ==UserScript==
// @name        New script - baidu.com
// @namespace   Violentmonkey Scripts
// @match       https://www.baidu.com/
// @grant       none
// @version     1.0
// @author      -
// @description 1/17/2023, 2:21:29 PM
// ==/UserScript==
```

这段表面看上去是注释，实际上是有用的，不能瞎写。@name 和 @namespace 唯一确定一个脚本，简单理解就是 namespace 是文件夹，name 是文件。@match 表明什么网站运行这个脚本，支持通配符 (*) 可以有多个 @match，其他的暂时用不上。 

本来还有个 @run-at 也挺重要的，指定脚本执行的时机，但精选联盟这个网页就加载个框子，剩下的内容都是 ajax 填充的，这鬼 TM 能判断什么时候网页加载完成。

针对这种情况，插件提供了两种解决办法

1. 在网页上整几个按钮，逻辑写到 click 事件里面，人可以判断网页有没有加载完
2. 用 MutationObserver 监控某个结点是否存在，存在触发回调函数

我选了简单的第一种，给他个一件拷贝也比他一个个拷贝方便。随便网上考了段代码

```javascript
var button = document.createElement('button');
button.innerHTML = '复制商品';
button.style = 'top: 0; right: 0; position: absolute; z-index: 9999';
document.body.appendChild(button);
button.addEventListener('click', function () {
    ...
    navigator.clipboard.writeText(...);
})
```

前四句在右上角创建一个按钮，z-index 设置 9999 保证它一定在最上面，免得被别的元素挡住。第五句设置 click 事件，把需要拷贝的数据从页面里摘出来，最后写入粘贴板，简单的功能就做好了。

比较蛋疼的是这个页面太少可以定位元素的选择器，用 querySelector 玩了半天搞不定。只好 `.children[n]` 一路点下去，这里还顺便查了下 children 和 childNodes 的区别，似乎是 childNodes 不仅包含 element 还会包含注释、text 等一些乱七八糟的东西，那从我的角度肯定只需要关注 element 就够了。

如果只是自用的脚本，到这里就可以了。但总觉得不方便，代码拷来拷去，自带的编辑器用起来也不顺手。于是把官网的文档都刷了一遍，之前遇到的问题在官网里都有解。

有一篇文章专门介绍怎么用自己顺手的编辑器

1. 创建 .user.js 结尾的文件，比如这个格式，不然识别不了。
2. Violentment 打开 Allow access to file URLs 权限
3. 拖拽文件到 chrome 浏览器，插件会自动识别，弹出安装界面，勾上 Track local file before this window is closed 然后安装。
4. 如果是 Firefox 那么额外需要 http 服务，它不支持本地文件，刚好我用的 chrome 没这个问题
5. 用顺手的编辑器修改文件，保存后会自动同步

脚本共享更简单，代码直接上传 github 直接通过链接访问，简单点么这就够了，为了方便检索可以使用专门的网站，比如 https://openuserjs.org/，https://greasyfork.org/，https://www.userscript.zone/

我选了 greasyfork，这个可以直接用 github 账号登陆。在通过导入脚本就完成了，这样别人要用直接在 violentmonkey 搜索就行。

但是油猴插件一般不需要自己写脚本，用前辈们写好的脚本才是油猴的正确打开方式。

比如 B 站增强脚本 Bilibili-Evolved 这个功能巨多，不过阿 B 正规化之后用的就少了，看个番不是圣骑就是暗牧。

喜欢逛知乎的朋友可以试试知乎增强，很烦它的登陆弹窗和跳外链提醒。

逛论坛偶尔有看到求原图的可以试试图搜图，本质是复制图片链接到对应的搜图网站搜一下，它简化步骤，以及不用记域名了。

计时器掌控者这个脚本可以变相跳过广告，现在视频网站广告越来越长，动不动就是 75 广告，一不小心刷新了又是 75 秒，用这个脚本可以倍速播放，比如设置 10 倍速，那么就只要看 8 秒，另外开个 4 倍速刷厕纸番也挺安逸。

它的另一个用处是有些视频作者会在视频的某一帧插入一张图片，借此考验网友暂停的手速，正常速度下很难一次成功，这时候只要调整到 0.01 倍速，随便停。

用完之后记得调回去，据说有个老哥没有调回去然后在线考试，刚打开就可以交卷了。

参考链接

+ 官网：https://violentmonkey.github.io/
+ 顺手的编辑器：https://violentmonkey.github.io/posts/how-to-edit-scripts-with-your-favorite-editor/
+ Bilibili-Evolved：https://github.com/the1812/Bilibili-Evolved
+ 知乎增强：https://github.com/XIU2/UserScript
+ 图搜图：https://greasyfork.org/en/scripts/2998
+ 计时器掌控者：https://greasyfork.org/en/scripts/372673

封面图：Twitter 心臓弱眞君 @xinzoruo