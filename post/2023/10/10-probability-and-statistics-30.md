# 《概率统计》 day 30

今天是读《概率统计》的逻辑第 30 天，学习 Maximum Likelihood Estimators，Bayes Estimators。

Estimator 这个词百科叫估计量，类似的还有被估量（estimand）和估计值（estimate）。

这么来看，也许可以叫最大似然估计量？但很可惜并没有这个词条。

这两个技术解决生活中习以为常的问题。比如食堂排队打饭，假如前面三个人分别用了 3，1.5，2.1 分钟，那么预估每个人平均花费几分钟。

大概率回答 $(3 + 1.5 + 2.1)/3 = 2.2$ 分钟，但好像从来没怀疑过为什么这么算。

假设平均等待时间是 $\psi$，等待时间满足指数分布 $f(x|\theta) = \theta e^{-\theta x}$，平均时间 $\psi = 1/\theta$

<!-- 观察到  -->

$X_1=3, X_2 = 1.5, X_3 = 2.1$ 的联合概率是 $f(\vec{x}|\theta) = \theta^3e^{-6.6\theta}$

合理猜测 $\theta$ 的取值让 $f(\vec{x}|\theta)$ 值最大，因为这件事发生了。

先取对数再求导

$$L(\theta) = log(f(\vec{x}|\theta)) = 3 log\theta - 6.6\theta$$

$$
\frac{\partial L(\theta)}{\partial \theta} = \frac{3}{\theta} - 6.6
$$

$\theta = 3/6.6$ $f(\vec{x}|\theta)$ 最大，$\psi = 1/\theta = 2.2$。

这种估计方式叫 Maximum Likelihood Estimators

无意识中已经运用了这么多诡异的知识。

估计量是一个函数，入参是观察到的数据 $X_1, ..., X_n$，出参预估值，记作 $\delta(X_1, ..., X_n)$。

$$
\delta(X_1, ..., X_n) = \frac{1}{n} \sum_{i=1}^n X_i
$$

估计值是函数的其中一个值 $\delta(x_1, ..., x_n)$。

现在再来一种更加诡异的 Bayes Estimators。

根据之前的知识，参数为 $\theta$ 的后验分布 $\xi(\theta|\vec{x})$ 是 $(\alpha + 3, \beta + 6.6)$ 的伽马分布。

为了方便 $\alpha = \beta = 0$

损失函数 $L(\theta, a)$ 记录参数 $\theta$ 和预估值 $a$ 之间的误差。

$\psi = h(\theta)$

$\delta^*(\vec{x}) = E(\psi|\vec{x}) = E(h(\theta)|\vec{x})$




<!-- $E(\theta|\vec{x}) = 3/6.6$ -->

预测的平均等待时间 $\psi =h(\theta) = 1/\theta$

$$
\delta^*(\vec{x}) = E(\frac{1}{\theta}|\vec{x}) = \int_{0}^{\infty} \frac{1}{\theta}\xi(\theta|\vec{x}) = \frac{6.6^3}{2}\int_0^{\infty} \theta^1e^{-6.6\theta}d\theta = 3.3
$$

比前一种大挺多，我比较好奇为什么这里不是先算 $E(\theta|\vec{x})$ 然后在用 $\psi = 1/\theta$ 来计算，如果这么算的话，结果是一样的。

<!-- 这个和平时见到的损失函数似乎不太一样，平常见到的都是估计值和实际值。 -->

<!-- $E[L(\theta, a)] = \int_{\Omega}L(\theta, a)\xi(\theta)d\theta$ -->

Bayes Estinator 寻找函数 $\delta^*(\vec{x})$ 使得 $E[L(\theta, \delta^*(\vec{x}))|\vec{x}]$ 最小。

<!-- $$
E[L(\theta, \delta^*(\vec{x}))|\vec{x}] = \min_{All \ a} E[L(\theta, a)|\vec{x}]
$$ -->

两种特殊的损失函数

$L(\theta, a) = (\theta - a)^2$

$E[(\theta - a)^2|\vec{x}]$ 最小，根据很早的 $M.S.E.$ 知识 $a=E(\theta|X)$ 也就是后验分布的期望

同理

$L(\theta, a) = |\theta - a|$ 根据 $M.A.E$，a 等于后验分布的中位数。

最近刷一些文章，还有这种损失函数 $L(\theta, a) = ||\theta - a||_2$，搜了下，这种叫 $p-norm$

$$
||\vec{x}||_p = (\sum_{i=1}^n|x_i|^p)^{1/p}
$$

这种损失函数不知道估计量要怎么算。



封面图：Twitter 心臓弱眞君 @xinzoruo