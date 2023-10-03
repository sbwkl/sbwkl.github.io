# 《概率统计》 day 28

今天是读《概率统计》的逻辑第 28 天，学习统计推断。

这节大部分都是炒冷饭，重新定义了一堆概念，什么参量空间，就是参数的取值范围,什么先验分布和后验分布，就是先验概率和后验概率改个名，顺便把符号也改了，从原来的 $f(x)$ 改成歪歪扭扭的 $\xi(\theta)$。

<!-- 一般来说先验指边缘分布，后验是条件分布。 -->

有个叫 statistic 的概念有点意思，翻译过来大概叫统计，没找到百科，不是很确定。

说是一组可观察的随机变量 $X_1, ..., X_n$，$r$ 是任意函数，那么随机变量 $T=r(X_1, ..., X_n)$ 叫做统计。

这么来看 $Y=\sum_{i=1}^nX_i$ 就是一种统计。

怎么说呢，有点理所当然，又有点新奇，这种感觉不好描述。

<!-- 所以统计应该是随机变量，至少得是个名词，以前都把它当动词看。 -->

<!-- 后面还出现了两个词 Bayesians 和 frequentists，前一个词在某些文章中还刷到过。 -->

<!-- 另外对推断问题做了分类 -->

统计推断用的贝叶斯定理

$$
\xi(\theta|\vec{x}) = \frac{1}{g_n(x)}f_n(\vec{x}|\theta)\xi(\theta)
$$

据说这玩意儿是现代人工智能的基础。

等式左边是后验分布，$\vec{x}$ 是可观察的随机变量。

<!-- 硬币只要抛了，看了，就知道正反，薛定谔只要开箱就知道猫挂了还是没挂。 -->

等式右边 $\xi(\theta)$ 是先验分布，$f_n(\vec{x}|\theta)$ 改了个名，叫似然函数。

<!-- 它其实是联合分布 $f_n(\vec{x}, \theta)$ -->

<!-- 只要看见如来了，那他就真的来了。 -->

系数 $1/g_n(\vec{x})$ 是个和 $\theta$ 无关的常量，所以上面的式子可以写成

$$
\xi(\theta|\vec{x}) \propto f_n(\vec{x}|\theta) \xi(\theta)
$$

上面这个式子给了一个求 $1/g_n(\vec{x})$ 的思路，不用废了吧唧的计算积分。

$$
\xi(\theta|\vec{x}) = c f_n(\vec{x}|\theta) \xi(\theta)
$$

两边对 $\theta$ 积分，$\Omega$ 是 $\theta$ 的参量空间

$$
\int_\Omega \xi(\theta|\vec{x}) = c \int_\Omega f_n(\vec{x}|\theta) \xi(\theta)
$$

左边是随机变量的积分，结果肯定等于一，所以

$$
c = \frac{1}{\int_\Omega f_n(\vec{x}|\theta) \xi(\theta)}
$$

然后看看 $f_n(\vec{x}|\theta) \xi(\theta)$ 长得像什么分布，硬套解决。

还是抛硬币游戏，这次怀疑硬币有诈，假定正面概率 $\theta$ 是 [0, 1] 的均匀分布 $\xi(\theta) = 1$，计算 $n$ 次试验之后 $\theta$ 的分布。

每次试验 $X_i$ 是伯努利分布 $f(x|\theta) = \theta^x(1-\theta)^{1-x}$。

统计 $Y=\sum_{i=1}^n X_i$ 代表正面次数

似然函数 $f_n(\vec{x}|\theta) = \theta^{y}(1-\theta)^{n-y}$，这里二项式系数 $\binom{n}{x}$ 没了，应该是观测的时候顺序也固定了。



<!-- $f_n(\vec{x}|\theta)\xi(\theta) = \theta^y(1-\theta)^{n-y}$ -->

后验分布

$$
\xi(\theta|\vec{x}) \propto \theta^y(1-\theta)^{n-y}
$$

右边这个长得像贝塔分布，凑一凑参数 $\alpha = y + 1, \beta = n - y + 1$

$$
\xi(\theta|\vec{x}) = \frac{\Gamma(n + 2)}{\Gamma(y + 1)\Gamma(n - y + 1)}\theta^y(1-\theta)^{n-y}
$$

$\theta$ 的后验分布是 $(y + 1, n - y + 1)$ 的贝塔分布，和之前硬算的一样。

现在观察到 8 次出现 3 次正面的分布

$$
\xi(\theta|\vec{x}) = \frac{\Gamma(10)}{\Gamma(4)\Gamma(6)}\theta^3(1-\theta)^5
$$

$P(0.4 \le \theta \le 0.6|\vec{x}) = 0.3833$

呃……如诈？

封面图：Twitter 心臓弱眞君 @xinzoruo