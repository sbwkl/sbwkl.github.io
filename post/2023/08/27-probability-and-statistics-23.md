# 《概率统计》 day 23

今天是读《概率统计》的逻辑第 23 天，学习各种各样的分布（中）

我唯一有印象的分布

这个名字真的很难理解，直到我看到了原版 The Normal Distributions，哦，原来是这个意思，怪不得说它是最常用的分布。

正态分布

$$
f(x|\mu, \sigma^2) = \frac{1}{(2\pi)^{1/2}\sigma}e^{[-\frac{1}{2}(\frac{x - \mu}{\sigma})^2]}
$$

证明秀我一脸

$$
\int_{-infty}_{infty} f(x|\mu, \sigma^2)dx = 1
$$

令 $y = \frac{x-\mu}{\sigma}$，$dy=d(x-\mu)/\sigma = \frac{1}{\sigma}dx$

于是转化为求积分

$$
\int_{-infty}_{infty}\frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}y^2}
$$

接着画风开始骚起来了

让 $I=\int_{-infty}_{infty}e^{-\frac{1}{2}y^2}dy$ 然后

$$
I^2 = \int_{-infty}_{infty}e^{-\frac{1}{2}y^2}dy \int_{-infty}_{infty}e^{-\frac{1}{2}z^2}dz \\
= \int_{-infty}_{infty} \int_{-infty}_{infty} e^{-\frac{1}{2}(y^2 + z^2)}dydz
$$

还能这么玩哒。

再接着笛卡尔坐标 转 极坐标 $y = r cos \theta, z = r sin \theta$

$$
I^2 = \int_0^{2\pi}\int_{0}^{\infty}e^{-\frac{1}{2}r}rdrdθ
$$

这里 $dydz = rdrdθ$ 想了半天没明白，查了资料才知道 dydz 不是普通乘积，而应该叫楔形积，记为 $dy \and dz$ 更合适

至于楔形积是什么，没继续深入，似乎和线性代数有关，那将来一定会再相见。

它的运算规则是

$$
dy \and \dz = - (dz \and dy) \\
dy \and dy = 0
$$

所以

$$
dydz = d(r cos \theta) \and d(r sin \theta) = ...
$$

以上内容来自知乎老哥，虽然一直逼乎逼乎的叫，但真遇到问题，还得是它。

导数相关知识，要是大学好好听的话就没这些幺蛾子事。

说起来大学学了什么基本全忘记了，反而高数和英语因为年年补考，反而记忆深刻。


股票的例子

线性变换

标准正态分布

标准正态分布的作用应该是简化计算，但我都有计算机了，那还不随便拿个 python 库就行。



老外似乎都有制表的习惯，预先算好函数值存起来，用的时候直接查询就行，怪不得有彩虹库这样的东西。

The 


[为什么 dxdy=rdrdθ](https://www.zhihu.com/question/368888687)

