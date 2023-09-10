# 《概率统计》 day 24

今天是读《概率统计》的逻辑第 24 天，学习各种各样的分布（下）。

**伽马分布**

这个分布大概是用来建模等待时间的，比如就诊叫号，需要等几分钟。



The most frequent use case for the gamma distribution is to model the time between independent events that occur at a constant average rate. 

这个分布的形状有点像幂律分布，但很可惜似乎不是，

alpha = 3.15
xm = 25174

**贝塔分布**

$$
B(α, β) = \frac{Γ(α)Γ(β)}{Γ(α + β)}
$$

结论很简单，证明过程用到多元的随机变量变换，反正也看不懂


均匀分布 f(x) = 1 是 α + β 都等于 1 的贝塔分布

观察 n 次实验，x 次成功，它是 α + x 和 β + n - x 的贝塔分布

$$
E(p) = \frac{α}{α + β} = \frac{α + x}{α + β + n} = \frac{x + 1}{n + 2}
$$

好家伙

封面图：Twitter 心臓弱眞君 @xinzoruo