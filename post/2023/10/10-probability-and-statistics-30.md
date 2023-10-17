# 《概率统计》 day 30

今天是读《概率统计》的逻辑第 30 天，学习 Maximum Likelihood Estimators，Bayes Estimators。

Estimator 这个词百科叫估计量，类似的还有被估量（estimand）和估计值（estimate）。

这么来看，也许可以叫最大似然估计量？但很可惜并没有这个词条。

这两个技术解决生活中习以为常的问题。比如食堂排队打饭，看到前面三个人分别用了 3，1.5，2.1 分钟，估计第四人要几分钟。

大概率回答 $(3 + 1.5 + 2.1)/3 = 2.2$ 分钟，但好像从来没怀疑过为什么这么算，这两个技术尝试解释这个原因。

假设等待时间满足指数分布 $f(x|\theta) = \theta e^{-\theta x}$，那么平均等待时间 $\psi = 1/\theta$

联合概率 $f(\vec{x}|\theta)=\theta^n e^{\theta \sum_{i=1}^n x_i}$ 也叫似然函数，把 $n$ 和 $x_i$ 看做常量，它是 $\theta$ 的函数，最可能的 $\theta$ 取值应该让似然函数值最大。

取对数再求导

$$L(\theta) = log(f(\vec{x}|\theta)) = n log\theta - \sum_{i=1}^n x_i \theta$$

$$
\frac{\partial L(\theta)}{\partial \theta} = \frac{n}{\theta} - \sum_{i=1}^n x_i
$$

$$
\frac{1}{\theta} = \frac{1}{n}\sum_{i=1}^n x_i
$$

现在观察到 $X_1=3, X_2 = 1.5, X_3 = 2.1$，那么平均等待时间 $\psi = 1/\theta = 2.2$

这种估计方法叫 Maximum Likelihood Estimators。

$\frac{1}{n} \sum_{i=1}^n x_i$ 叫做估计量，是一个函数，入参是观察到的数据 $X_1, ..., X_n$，出参是预估值，记作

$$
\delta(X_1, ..., X_n) = \frac{1}{n} \sum_{i=1}^n X_i
$$

估计值是估计量的一个值。

<!-- 无意识中运用了知识。 -->

然后看另一种 Bayes Estinator，它需要损失函数辅助。

损失函数 $L(\theta, a)$ 记录参数 $\theta$ 和预估值 $a$ 之间的误差，Bayes Estinator 寻找最合适的 $a$ 使得 $E[L(\theta, a)|\vec{x}]$ 最小。

同样前提下，参数为 $\theta$ 的后验分布 $\xi(\theta|\vec{x})$ 是 $(\alpha + n, \beta + \sum_{i=1}^n x_i)$ 的伽马分布。

损失函数选择 $L(\theta, a) = (\theta - a)^2$

$$
E[L(\theta, a)|\vec{x}] = \int_\Omega(\theta - a)^2 \xi(\theta|\vec{x})d\theta
$$

这个等式当 $a=E(\theta|\vec{x})$ 时最小 $M.S.E$ 的时候学过。

接下来有个奇怪的操作，因为我们并不是要预估 $\theta$ 而是预估 $\psi$，它并没有先计算 $\theta$ 然后再通过 $1/\theta$ 求平均等待时间。

而是直接计算 $E(\psi|\vec{x})$

$$
\begin{aligned}
E(\psi|\vec{x}) &=E(\frac{1}{\theta}|\vec{x})= \int_{0}^{\infty} \frac{1}{\theta}\xi(\theta|\vec{x}) \\
&= \frac{(\beta + y)^{\alpha+n}}{\Gamma(\alpha + n)}\int_0^{\infty} \theta^{\alpha + n - 1}e^{-y\theta}d\theta\\
&= \frac{\beta + y}{\alpha + n - 1}
\end{aligned}
$$

$y=\sum_{i=1}^n x_i$

不同的 $(\alpha, \beta)$ 有不同的值，$\alpha = 1, \beta = 0$ 时和上一个一样。

这种相比前一种更灵活，先验分布有多种可以选，而且还能用别人算好的先验分布。

损失函数也有多种可以选，$L(\theta, a) = |\theta - a|$ 这时候 $a$ 等于中位数误差最小。

最近刷一些文章，还有这种损失函数 $L(\theta, a) = ||\theta - a||_2$，搜了下叫 $p-norm$

$$
||\vec{x}||_p = (\sum_{i=1}^n|x_i|^p)^{1/p}
$$

这种损失函数不知道估计量要怎么算，大力出奇迹么。

封面图：Twitter 心臓弱眞君 @xinzoruo