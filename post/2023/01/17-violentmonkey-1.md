# 开发一个油猴脚本

前段时间收到一个奇怪的问题，问有没有办法方便的从精选联盟拷贝商品信息到 excel，现在的做法是一个个拷贝数据，先拷贝商品标题，接着价格、销量等。

虽然不知道他想干什么，但比这个要方便的办法还是有的，油猴脚本应该能实现，正好拿这个来试试手。
​​
我的浏览器一直装着 Tampermonkey 虽然没咋用，想着这么多年过去了，搜索下有没有新产品，吼~~还不少

1. Tampermonkey: 闭源，据说嵌了 Google Analytics
2. Greasemonkey: 似乎停止维护了，最后更新时间 2022.4
3. Violentmonkey: 开源，据说也有隐私问题，不过官方解释不会收集用户信息
4. Firemonkey: 在谷歌扩展商店没找到

最后选了 violentmonkey，不过我倒没那么在意隐私问题，毕竟现在十个电话八个骚扰两个诈骗，都习惯了，想尝个鲜。

Violentmonkey 有内置编辑器，创建脚本很方便，点加号就行，还会自动填充元数据。

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

这段表面看上去是注释，实际上是有用的。

@name 和 @namespace 脚本唯一键，简单理解就是 namespace 是文件夹，name 是文件。

@match 指定脚本执行的网站，支持通配符 (*)。

本来还有个 @run-at 也挺重要的，指定脚本执行的时机，但精选联盟这个网页就加载个壳，剩下的内容都是 ajax 填充的。

针对这种情况，有两种解决办法

1. 在网页上整几个按钮，逻辑写到 click 事件里面
2. 用 MutationObserver 监控某个结点，触发回调函数

本着怎么方便怎么来，我选第一种，给他个一键拷贝也比一个个拷贝方便。

随便网上拷了段代码

```javascript
var button = document.createElement('button');
button.innerHTML = '复制商品';
button.style = `
    top: 0; right: 0; 
    position: absolute; 
    z-index: 9999`;
document.body.appendChild(button);
button.addEventListener('click', function () {
    ...
    navigator.clipboard.writeText(...);
})
```

这段代码先在右上角创建一个按钮，设置 z-index = 9999 保证它一定在最上面，免得被别的元素挡住，然后设置 click 事件，把需要拷贝的数据从页面里摘出来，最后写入粘贴板。

比较蛋疼的是这个页面能用的选择器太少，用 querySelector 玩了半天搞不定，只好一层层往下找。这里还踩了个坑，属性 firstChild 和 firstElementChild 是有区别的，firstChild 多一些乱七八糟的东西，点着点着就 undefined 了，同理 children 和 childNodes 也有区别。

如果只是自用脚本，到这里就够了，如果要更进一步有两个问题需要解，脚本共享和编辑器。于是刷了一遍官网文档，还都有解，早知道先刷文档了。

有一篇文章专门介绍怎么用自己顺手的编辑器

1. 创建 .user.js 结尾的文件，必须这个命名，不然识别不了
2. Violentment 插件打开 Allow access to file URLs 权限
3. 拖拽文件到浏览器，插件自动识别，弹出安装界面，勾上 Track local file before this window is closed 安装
4. 如果是 Firefox 需要额外的 http 服务，它不支持本地文件，刚好我用的 chrome 没这个问题
5. 用喜欢的编辑器修改文件，保存后自动同步

脚本共享更简单，代码上传 github 就能访问，还可以加到专门的网站里，比如 https://openuserjs.org/，https://greasyfork.org/，https://www.userscript.zone/

我选了 greasyfork，这个可以直接用 github 账号登陆。在通过导入脚本就完成了，这样别人要用直接在 violentmonkey 搜索就行。

开发到此结束，但油猴插件一般不需要自己写脚本，用前辈们写好的脚本才是它正确的打开方式。

B 站用户可以试试 Bilibili-Evolved，功能巨多，需要自己添加，比如视频下载、bv 转换。

喜欢逛知乎的朋友可以试试知乎增强，屏蔽登陆弹窗和外链提醒。

还有一个控制浏览器时间流速的脚本，计时器掌控者。它可以用来倍速播放视频，也可以变相跳过广告，只要设置十倍速，那就算 75 秒的广告也只要 8 秒钟，不过跳广告一般有专门的脚本。用完之后记得调回去，据说有个老哥用完直接去考试，刚打开网页就可以交卷了。

参考链接

+ 官网：https://violentmonkey.github.io/
+ 顺手的编辑器：https://violentmonkey.github.io/posts/how-to-edit-scripts-with-your-favorite-editor/
+ Bilibili-Evolved：https://github.com/the1812/Bilibili-Evolved
+ 知乎增强：https://github.com/XIU2/UserScript
+ 计时器掌控者：https://greasyfork.org/en/scripts/372673

封面图：Twitter 心臓弱眞君 @xinzoruo