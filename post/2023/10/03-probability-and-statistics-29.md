# 《概率统计》 day 29

今天是读《概率统计》的逻辑第 29 天，学习共轭先验分布。

这名字听着很屌，查了下 conjugate 还有成对的意思，那就是 CP 喽。

观察任意样本后，如果先验分布和后验分布属于同种分布，那它是样本分布的共轭先验。

选择共轭先验可以让后验的计算变得简单，这在上一节确实有点感觉。

**伯努利 - 贝塔**

伯努利分布的随机样本，先验选择参数 $(\alpha, \beta)$ 的贝塔分布，n 个样本后得到 $(\alpha + \sum_{i=1}^nx_i, \beta + n - \sum_{i=1}^n x_i)$ 的贝塔分布。

$(\alpha, \beta)$ 叫先验超参数，$(\alpha + \sum_{i=1}^nx_i, \beta + n - \sum_{i=1}^n x_i)$ 叫后验超参数。

没想到能在这里见到超参数，上一次听到这个词还是 TensorFlow 的入门视频里。

**泊松 - 伽马**

泊松分布的随机样本，先验选择参数 $(\alpha, \beta)$ 的伽马分布，n 个样本后得到 $(\alpha + \sum_{i=1}^n x_i, \beta + n)$ 的伽马分布。

**指数 - 伽马**

指数分布的随机样本，先验选择参数 $(\alpha, \beta)$ 的伽马分布，n 个样本后得到 $(\alpha + n, \beta + \sum_{i=1}^n x_i)$ 的伽马分布。

**正态 - ?**

正态分布比较复杂，有两种情况，期望未知或者方差未知，对应有两个共轭先验，渣男石锤了。

**正态 - 正态**

随机样本是 $(\theta, \sigma^2)$ 的正态分布，期望 $\theta$ 未知，先验选择 $(\mu_0, v_0^2)$ 的正态分布，n 个样本后得到 $(\mu_1, v_1^2)$ 后验分布

$$
\mu_1=\frac{\sigma^2\mu_0 + nv_0^2 \bar{x}_n}{\sigma^2 + nv_0^2}
$$

$$
v_1^2 = \frac{\sigma^2v_0^2}{\sigma^2 + nv_0^2}
$$

**正态 - 倒伽马**

随机样本是 $(\mu, \theta)$ 的正态分布，方差 $\theta$ 未知，先验选择 $(\alpha, \beta)$ 的倒伽马分布

$$
\xi(\theta) = \frac{\beta^\alpha}{\Gamma(\alpha)}\theta^{-(\alpha + 1)} e^{-\beta / \theta}
$$

n 个样本后得到参数为 $(\alpha + n/2, \beta + \frac{1}{2}\sum_{i=1}^n(x_i - \mu)^2)$ 的倒伽马分布。

正态分布这两个有点扯，哪有这么巧的事，刚好有一个数据是已知的。

最后，如果联合概率可以写成

$$
f(x|\theta) = a(\theta)b(x)e^{c(\theta)d(x)}
$$

那么先验试试

$$\xi_{\alpha, \beta}(\theta) \propto a(\theta)^{\alpha} e^{c(\theta)\beta}$$

说不定就是共轭先验。

不过我觉得直接问谷歌或者 ChatGPT 更快。

封面图：Twitter 心臓弱眞君 @xinzoruo