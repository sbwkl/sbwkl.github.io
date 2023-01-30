# 

前几天准备总结下去年的开销，

本来应该过年的时候就做好总结，但是整理某人一年的账单实在太痛苦了，银行在记账方便就没好好做

我所用的所有银行信用卡都是 pdf 账单，先用工具转成 excel。

工商银行

中国银行 web 版现在还是用卡号、密码登录，这都 2023 年了

工商银行 web 我用 chrome 直接提示版本过低，我 109.x 的最新版的 chrome 你和我说版本过低。

换成 edge 浏览器打开扫码，提示「预留验证信息」为空，为了安全需要填写。

然后牛逼了，验证码这栏根本没法输入，我灵机一动，既然只是个验证信息那我手机版维护也一样。

在安全中心果然有这一项，维护上。

我真为自己的小聪明偷笑的时候，扫码登录，还是提示「预留验证信息」为空，我去你*的。

人才啊，做的什么玩意儿。

总结下来如果一次性记账，那么 pdf 转 excel 工具是必不可少的。另外信用卡的交易记录虽然字段少，但比较能看得出交易内容。

借记卡显示都是这么消费、银企服务、网上快捷支付这种意义不明的摘要。

当然最好的是每天或者每周记一次，这样也许花的总时间更多，但体验更好，一次性记一年真的吐血。




```
# pdf to image
sudo yum install poppler-utils
pdftoppm input.pdf outputname -png
```

```
install tesseract

yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
sudo rpm --import https://build.opensuse.org/projects/home:Alexander_Pozdnyakov/public_key
yum update
yum install tesseract 
yum install tesseract-langpack-chi_sim

# 检查版本，需要 4.0 以上
tesseract --version
```

