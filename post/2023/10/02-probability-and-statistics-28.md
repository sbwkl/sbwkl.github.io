# 《概率统计》 day 28

今天是读《概率统计》的逻辑第 28 天，学习中统计推断。

这节定义了一堆概念，但仔细看吧又都是之前见过的，重新炒了个冷饭。

有个叫 statistic 的概念有点意外，翻译过来大概叫统计，不是很确定。

说的是一组可观察的随机变量 $X_1, ..., X_n$ r 是任何函数，那么随机变量 $T=r(X_1, ..., X_n)$ 叫做 statistic。

所以统计应该是随机变量，至少得是个名词，以前都把它当动词看。

所以 $Y=\sum_{i=1}^nX_i$ 就是一种统计。

后面还出现了两个词 Bayesians 和 frequentists，前一个词在某些文章中还刷到过。

先验分布和后验分布，先验概率和后验概率改个名字。顺便把符号也改了，从原来的 $f(\theta)$ 改成了歪歪扭扭的 $\xi(\theta)$

一般来说先验指边缘分布，后验是条件分布。

似然函数

根据贝叶斯定理

$$
\xi(\theta|\vec{x}) = \frac{1}{g_n(x)}f_n(\vec{x}|\theta)\xi(\theta)
$$

$\vec{x}$ 是可观察的随机变量，硬币只要抛了，看了，就知道正反。薛定谔只要开箱就知道猫是挂了还是没挂。

只要看见如来了，那他就真的来了。

系数 $1/g_n(\vec{x})$ 是个和 $\theta$ 无关的常量。

$$
\xi(\theta|\vec{x}) \propto f_n(\vec{x}|\theta) \xi(\theta)
$$

右边半截 $f_n(\vec{x}|\theta)$ 叫似然函数，它其实是联合分布 $f_n(\vec{x}, \theta)$

上面这个给了一个求 $1/g_n(\vec{x})$ 的思路，不用废了吧唧的计算积分。

$$
\xi(\theta|\vec{x}) = c f_n(\vec{x}|\theta) \xi(\theta)
$$

两边对 $\theta$ 积分

$$
\int_\Omega \xi(\theta|\vec{x}) = c \int_\Omega f_n(\vec{x}|\theta) \xi(\theta)
$$

左边是随机变量的积分，结果肯定是一，所以

$$
c = \frac{1}{\int_\Omega f_n(\vec{x}|\theta) \xi(\theta)}
$$

然后看看 $f_n(\vec{x}|\theta) \xi(\theta)$ 长得像什么分布，硬套解决。

还是抛硬币游戏，这次怀疑硬币有诈，但没有证据。

假定正面概率 $\theta$ 是 [0, 1] 的均匀分布，那么 $\xi(\theta) = 1$

$f(x|\theta) = \theta^x(1-\theta)^{1-x}$

统计 $Y=\sum_{i=1}^n X_i$

似然函数 $f_n(\vec{x}|\theta) = \theta^{y}(1-\theta)^{n-y}$

这里它把二项式系数 $\binom{n}{x}$ 去掉了，

$f_n(\vec{x}|\theta)\xi(\theta) = \theta^y(1-\theta)^{n-y}$

后验分布

$$
\xi(\theta|\vec{x}) \propto \theta^y(1-\theta)^{n-y}
$$

右边这个长得像贝塔分布，凑一凑参数 $\alpha = y + 1, \beta = n - y + 1$

$$
\xi(\theta|\vec{x}) = \frac{\Gamma(n + 2)}{\Gamma(y + 1)\Gamma(n - y + 1)}\theta^y(1-\theta)^{n-y}
$$

$\theta$ 的后验分布是 $(y + 1, n - y + 1)$ 的贝塔分布，和之前硬算的一样。

$P(0.4 \le \theta \le 0.6|\vec{x}) = 0.3833$

呃……如诈？



封面图：Twitter 心臓弱眞君 @xinzoruo