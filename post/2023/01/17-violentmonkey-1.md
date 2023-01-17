# 开发一个油猴脚本

前段时间收到一个奇怪的问题，问有没有办法方便的从精选联盟拷贝商品信息到 excel，现在的做法是一个个数据拷贝，先拷贝商品标题，接着价格、销量等。

虽然不知道他想干什么，但方法还是有的，油猴脚本应该能实现，正好试试手。

搜索油猴插件，吼~~~还不少

1. Tampermonkey: 闭源，据说嵌了 Google Analytics
2. Greasemonkey: 似乎停止维护了，最后更新时间 2022.4
3. Violentmonkey: 开源，据说也有隐私问题，不过官方解释不会收集用户信息
4. Firemonkey: 谷歌商店没找到

最后选了 violentmonkey，我倒没那么在意隐私，现在十个电话八个骚扰两个诈骗，都佛系了。

Violentmonkey 有内置编辑器，创建脚本很方便，点加号就行，还会自动填充元数据。

```
// ==UserScript==
// @name        New script - baidu.com
// @namespace   https://sbwkl.github.io/
// @match       https://www.baidu.com/
// @grant       none
// @version     1.0
// @author      -
// @description 1/17/2023, 2:21:29 PM
// ==/UserScript==
```

这段代码表面看上去是注释，实际上是有用的。

@name 和 @namespace 唯一键，简单理解 namespace 是文件夹，name 是文件名。

@match 指定脚本执行网站，支持通配符 (*)。

本来还有个 @run-at 也挺重要的，指定脚本执行时机，但精选联盟这个网页就加载个壳，剩下的内容都是 ajax 填充。

应对的办法也简单，直接在网页上加个按钮，逻辑全写到 click 事件里面，给他做个一键拷贝。

随便拷了段代码

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

这段代码先在右上角创建按钮，设置 z-index = 9999 保证它一定在最上面，免得被别的元素挡住，然后设置 click 事件，把需要的数据从页面里摘出来，最后写入粘贴板。

比较蛋疼的是这个页面能用的选择器太少，`querySelector` 玩了半天搞不定，只好一层层往下找。这里还踩了个坑，属性 `firstChild` 和 `firstElementChild` 是有区别的，`firstChild` 可以是一些乱七八糟的东西，点着点着就 undefined 了，同理 `children` 和 `childNodes` 也有区别。

雪中送炭到这就结束了，接下来是锦上添花，解决两个问题：自带编辑器不好用，脚本共享。

官网专门有一篇文章介绍配置编辑器

1. 代码保存到 .user.js 结尾的文件，必须这个命名，不然识别不了
2. Violentment 插件打开 Allow access to file URLs 权限
3. 拖拽文件到浏览器，插件自动识别，弹出安装界面，勾上 Track local file before this window is closed，安装
4. 如果是 Firefox 需要额外的 http 服务，它不支持本地文件，我用的 chrome 没这个问题
5. 用喜欢的编辑器修改文件，文件自动同步

脚本共享更简单，上传 github 即可（github 文件有访问地址），顺便还解决了版本控制问题，还可以上传到专门管理脚本的网站，比如

+ https://openuserjs.org/
+ https://greasyfork.org/
+ https://www.userscript.zone/

开发到此结束，然而油猴插件的正确打开方式是白嫖前辈写好的脚本，海量的脚本才是它最牛逼的地方。

B 站用户可以试试 Bilibili-Evolved，功能巨多，需要自己添加，比如视频下载、bv 转换。

喜欢逛知乎的朋友可以试试「知乎增强」，屏蔽登陆弹窗和外链提醒。

还有一个控制浏览器时间流速的脚本「计时器掌控者」，用来倍速播放视频，也可以变相跳过广告，设置十倍速，75 秒的广告只需 8 秒，不过跳广告一般有专门的脚本。用完之后记得调回去，据说有个老哥用完直接去考试，刚打开网页就可以交卷了。

参考链接

+ 官网：https://violentmonkey.github.io/
+ 配置编辑器：https://violentmonkey.github.io/posts/how-to-edit-scripts-with-your-favorite-editor/
+ Bilibili-Evolved：https://github.com/the1812/Bilibili-Evolved
+ 知乎增强：https://github.com/XIU2/UserScript
+ 计时器掌控者：https://greasyfork.org/en/scripts/372673

封面图：Twitter 心臓弱眞君 @xinzoruo