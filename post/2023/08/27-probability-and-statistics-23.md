# 《概率统计》 day 23

今天是读《概率统计》的逻辑第 23 天，学习正态分布，唯一有印象的分布。

$$
f(x|\mu, \sigma^2) = \frac{1}{\sqrt{2\pi}\sigma}e^{[-\frac{1}{2}(\frac{x - \mu}{\sigma})^2]}
$$

它的原名 normal distribution 好理解很多，正态真有点意义不明，同理的还有正则，正字辈的多少有点神秘。

概率密度函数的积分要等于一，为了证明 $\int_{-\infty}^{\infty} f(x|\mu, \sigma^2)dx = 1$。

令 $y = \frac{x-\mu}{\sigma}$ 那么 $dy = \frac{1}{\sigma}dx$

于是

$$
\int_{-\infty}^{\infty} f(x|\mu, \sigma^2)dx = \int_{-\infty}^{\infty}\frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}y^2}dy
$$

简化了很多

再令 $I=\int_{-\infty}^{\infty}e^{-\frac{1}{2}y^2}dy$ 然后

$$
\begin{aligned}
I^2 &= \int_{-\infty}^{\infty}e^{-\frac{1}{2}y^2}dy \int_{-\infty}^{\infty}e^{-\frac{1}{2}z^2}dz \\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} e^{-\frac{1}{2}(y^2 + z^2)}dydz
\end{aligned}
$$

唔唔唔，成功复杂了很多

笛卡尔坐标转极坐标 $y = r cos θ$，$z = r sin θ$

$$
I^2 = \int_0^{2\pi}\int_{0}^{\infty}e^{-\frac{1}{2}r^2}rdrdθ
$$

这是变魔术吧

这里 $dydz = rdrdθ$ 想了半天没明白，查了资料<sup>[1]</sup>才知道 $dydz$ 不是普通乘积，应该叫楔形积，记为 $dy \wedge dz$。

它的运算规则有些不一样

$dy \wedge dz = - (dz \wedge dy)$

$dy \wedge dy = 0$

$(a + b) \wedge (c + d) = a \wedge c + a \wedge d + b \wedge c + b \wedge d$

所以

$$
\begin{aligned}
dydz &= d(r cos θ) \wedge d(r sin θ) \\
&= (cos θ dr - r sin θ dθ) \wedge (sin θ dr + r cos θ dθ) \\
&= r cos^2 θ drdθ - r sin^2 θ dθdr \\
&= rdrdθ
\end{aligned}
$$

至于什么是楔形积，没继续了解，只要和线性代数有关，总会相见。

以上内容来自知乎老哥「予一人」，虽然一直逼乎逼乎的叫，真遇到问题，还得是它。

都是导数知识，要是大学好好听就没那么多幺蛾子事。说起来大学学了什么基本全忘了，反而高数和英语因为年年补考记忆深刻。

**标准正态分布**

平均值 0 方差 1 的正态分布

$$
\phi(x) = f(x|0,1) = \frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}x^2}
$$
$$
\Phi(x) = \int_{-\infty}^x\phi(u)du
$$

这个东西看下来应该是简化计算用的，任何正态分布可以转化为 $Z = (X - \mu)/\sigma$ 的标准正态分布，然后

$$
F(x) = \Phi(\frac{x-\mu}{\sigma})
$$
$$
F^{-1}(p) = \mu + \sigma\Phi^{-1}(p)
$$

再把常用的 $\Phi(x)$ 制成一张表，用的时候只要查询即可。

这个做法有点六，彩虹表也是这个思路，编译时间换运行时间。

老祖宗也有本书《营造法式》里面定义各种建筑标准，只管按比例造就完事了，古代版乐高。

现在都普及计算机了，计算的事随便按两下就好。不过实际用下来对于求 $P(X \ge x)$ 先转成标准不容易出错。

+ [1]为什么 $dxdy=rdrdθ$：*https://www.zhihu.com/question/368888687*

封面图：Twitter 心臓弱眞君 @xinzoruo