# Copilot 使用体验

Copilot (https://github.com/github/copilot-docs) 是代码自动补全插件，与传统不同，它通过 AI 识别程序员的意图来自动补全代码，官方简介是 Your AI pair programmer。

Copilot 基于 OpenAI Codex (https://openai.com/blog/openai-codex) 开发，后者是 openAI 公司用包括 github 在内的数十亿行源码训练的模型。

Copilot 目前免费，需要申请资格。顺着文档步骤做就行，其中有一步就是申请资格，蛮快的，我从申请到通过大约过了 3 天。

整体使用下来还是蛮舒服的，对我来说有三种场景能用上。

一种是语言基础操作。最近因为工作需要写 python 和 node 代码，这俩语法我都不太熟悉，有事没事都要查谷歌，也就是面向 google 编程。用了插件以后遇到不会的语法只要写注释，然后等插件补全即可。

比如带索引的 for 循环，关键字记不住，放以前都谷歌的。

![](https://files.mdnice.com/user/18103/7839eea2-4c66-46ea-93ce-3df84b58c94c.png)

一种是工具类，最近写了不少时间操作，别吐槽没有指定时区

![](https://files.mdnice.com/user/18103/42401736-b988-4abc-9ba3-43421f2538f5.png)

还会调用已有的 API

![](https://files.mdnice.com/user/18103/71c18100-86b8-49f9-82d6-614c00f73eb4.png)

还有一种是重复代码。比如下面这个代码，从第二句 set_not_null_field 开始只要负责按 Tab 就行。

![](https://files.mdnice.com/user/18103/6bad71e4-d484-470a-b0fc-5bb72756cf15.png)

也许有小伙伴会说你这个例子写个 for 循环不是更好么，写那么多重复代码丢不丢人。

阿哲，没办法，太菜了。

另外还发现了一些有意思的特性，比如

能够补全省份信息

![](https://files.mdnice.com/user/18103/39eb14a5-ddb1-4c7d-a21b-660844785280.png)

能够补全法外狂徒「张三」

![](https://files.mdnice.com/user/18103/891a56a9-2a1c-4bfe-98a2-fc4ba9cf3194.png)

这种小细节特别有意思。

其他场景还在探索中，官方也给了不少例子

https://github.com/github/copilot-docs/tree/main/gallery

对了，出现补全提示的时候按快捷键 ```alt + [``` 或者 ```alt + ]``` 切换补全的代码，或者按 ```alt + Enter``` 列出所有的候选项。

Intellij 需要 2021.2 之后的版本，我专门下了社区版玩一玩，体验没有 vs code 好，可能是因为插件对 java 语言的支持没有 python 好。

分享到群里，有个朋友指出这个插件可能会读取代码上下文，有一定的安全隐患，仔细想想确实有这个问题。

如果从事没有网络或者安全等级特别高的工作，这个插件应该是用不了的，不过能在这种条件下工作十有八九都是大佬，也不需要这个插件。

前有低代码平台，后有 AI 编码插件，作为一个 CRUD boy + CV warrior 只能躲在角落瑟瑟发抖，越发感觉剩下的时间不多了。


封面图：Photo by Anand Dandekar from Pexels