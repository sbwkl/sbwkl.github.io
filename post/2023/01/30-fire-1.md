# 处理一年的账单是什么体验

先说结论，那就是痛苦，非常痛苦。

痛苦之源有几种

1. 我是替别人整理账单，银行 app 每隔几分钟就掉线
2. 账单都是 pdf 格式，极少数有 csv 格式
3. 借记卡（储蓄卡）账单都是些消费、银企服务、网上快捷支付这种意义不明的摘要，没法分类
4. 银行卡和余额宝之间账特别难搞，如果还牵扯支付宝余额，那更头疼

如果想要记账，不建议一年一次，一个月是能忍受的最长间隔，再长真的吐血。

每天或者每周记最好，也许花的总时间更多，但不容易出错，也方便跟踪预算。

如果真想一年记一次账，有几点心得可供参考

1. 记录初始金额，每年元旦记，没有初始金额账一定不会平
2. 少用借记卡消费，一定想不起这笔消费是啥
3. 同样笔数的账单，借记卡处理时间是信用卡的好几倍
4. 少用几个账号，少点工作量
5. 用 tabula-py 可以从 pdf 从抽取表格，然后微调就能得到 csv 账单，我傻乎乎的用 ocr 识别，蛋疼
6. 借记卡一般叫流水打印，信用卡一般叫账单补寄，银行 app 通常有这两个功能
7. 一次性把订单全下载了，然后写代码批量处理

最后是个一了百了的备选方案，全权委托给蓝绿修改器，这俩基本覆盖日常消费，它们的账单约等于个人年度账单。

有用的信息到这就结束了，接下来是碎碎念时间。

**招商银行**

整体体验还不错，有 pc 客户端是亮点，帮人处理账单比较方便，扫码登录就行，时效还长。

账单比较工整，不太需要微调就能使用。

**工商银行**

工行开幕雷击，我用 chrome 最新版它告诉我浏览器版本过低，不愧是宇宙第一行，未来科技恐怖如斯。

这还不是最坑的，换成 edge 浏览器扫码登陆，提示「预留验证信息」为空，需填写。填写就填写了，但你验证码这栏根本没法输入啊，装了安全控件都不行。

还好我灵机一动，既然只是维护个验证信息那我手机版一样维护，果然在安全中心找到这一项。

我正暗自偷笑，扫码登录，尼玛还提示「预留验证信息」为空，我去你*的，感情你俩维护的不是一个字段，人才啊，什么玩意儿。

得，这下又只能用手机 app 发送账单到邮箱。

其实工行借记卡账单有 csv 格式，奈何登陆不上。

**中国银行**

这货网上银行现在还用卡号、密码登录，直接放弃。

中国银行的 pdf 格式有点随意，用 tabula-py 读取应该好一点，用 ocr 识别会错行。

账目多，又有储蓄卡，处理的最久。

**宁波银行**

到它的时候我其实已经放弃网上银行了，但万万没想到这货信用卡补寄的居然是图片……图片……片，图片也就算了，还有部分记录少一截的。

只好去网上银行碰碰运气，没想到它居然有 csv 格式账单，惊了，太不容易了，这可是信用卡账单，居然有 csv 格式的。

赶紧下载，打开一看，又惊了，金额没有正负号，无论是支出、还款、退款都是正数，王德发！这大起大落的。

你们别这样啊，别在奇奇怪怪的地方百花齐发啊。但也不是没有统一的地方，比如每隔五分钟掉线就很统一，有毒吧。

在账单这方面支付宝真的完爆各家银行，银行就没想过客户会处理账单吧。

封面图：Twitter 心臓弱眞君 @xinzoruo