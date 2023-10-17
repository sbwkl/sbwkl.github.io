# 《概率统计》 day 30

今天是读《概率统计》的逻辑第 30 天，学习 Maximum Likelihood Estimators，Bayes Estimators。

Estimator 这个词百科叫估计量，类似的还有被估量（estimand）和估计值（estimate）。

这么来看，也许可以叫最大似然估计量？但很可惜并没有这个词条。

这两个技术解决生活中习以为常的问题。比如食堂排队打饭，看到前面三个人分别用了 3，1.5，2.1 分钟，估一下平均花费几分钟。

大概率回答 $(3 + 1.5 + 2.1)/3 = 2.2$ 分钟，但好像从来没怀疑过为什么这么算。

这两个技术尝试解释这个原因。

假设打饭时间满足指数分布 $f(x|\theta) = \theta e^{-\theta x}$，那么平均等待时间 $\psi = 1/\theta$

<!-- 观察到  -->

联合概率 $f(\vec{x}|\theta)=\theta^n e^{\theta \sum_{i=1}^n x_i}$

合理猜测 $\theta$ 的取值让 $f(\vec{x}|\theta)$ 值最大，毕竟这事儿发生了。

取对数再求导
<!-- $\theta = 3/6.6$ $f(\vec{x}|\theta)$ 最大。 -->

$$L(\theta) = log(f(\vec{x}|\theta)) = n log\theta - \sum_{i=1}^n x_i \theta$$

$$
\frac{\partial L(\theta)}{\partial \theta} = \frac{n}{\theta} - \sum_{i=1}^n x_i
$$

$$
\frac{1}{\theta} = \frac{1}{n}\sum_{i=1}^n x_i
$$

现在观察到 $X_1=3, X_2 = 1.5, X_3 = 2.1$，那么平均等待时间 $\psi = 1/\theta = 2.2$

这种估计方式叫 Maximum Likelihood Estimators。

无意识中已经运用了这么多诡异的知识。话说这真的不是已经知道了答案，然后找个像样的过程糊弄上去么。

上面这个 $\frac{1}{n} \sum_{i=1}^n x_i$ 就是估计量，

估计量是一个函数，入参是观察到的数据 $X_1, ..., X_n$，出参预估值，记作 $\delta(X_1, ..., X_n)$。

上面这个例子中，估计量等于

$$
\delta(X_1, ..., X_n) = \frac{1}{n} \sum_{i=1}^n X_i
$$

估计值 (2.2) 是函数的其中一个值 $\delta(x_1, ..., x_n)$。

现在再来一种更加诡异的。

损失函数 $L(\theta, a)$ 记录参数 $\theta$ 和预估值 $a$ 之间的误差。

Bayes Estinator 寻找函数 $\delta^*(\vec{x})$ 使得 $E[L(\theta, \delta^*(\vec{x}))|\vec{x}]$ 最小。

同样前提下，参数为 $\theta$ 的后验分布 $\xi(\theta|\vec{x})$ 是 $(\alpha + 3, \beta + 6.6)$ 的伽马分布。

为了方便 $\alpha = \beta = 0$



如果损失函数用 $L(\theta, a) = (\theta - a)^2$ 这时候 $a=E(\theta|\vec{x})$ 最小 $E[L(\theta, \delta^*(\vec{x}))|\vec{x}] = E[(\theta - a)^2]$

接下来有个奇怪的操作，它没有直接计算 $\theta$ 然后再通过 $1/\theta$ 求平均等待时间，如果这样算的话和前面是一样的。

它直接计算 $E(\psi|\vec{x})$ 作为预估量

<!-- $\psi = 1/\theta$ -->

<!-- $\delta^*(\vec{x}) = E(\psi|\vec{x}) = E(h(\theta)|\vec{x})$ -->


<!-- $E(\theta|\vec{x}) = 3/6.6$ -->

<!-- 预测的平均等待时间 $\psi =h(\theta) = 1/\theta$ -->

$$
%\delta^*(\vec{x}) = 
E(\psi|\vec{x})=
E(\frac{1}{\theta}|\vec{x}) = \int_{0}^{\infty} \frac{1}{\theta}\xi(\theta|\vec{x}) = \frac{6.6^3}{2}\int_0^{\infty} \theta^1e^{-6.6\theta}d\theta = 3.3
$$

差距还挺大，

$$
\delta(X_1, ..., X_n) = \frac{\beta + \sum_{i=1}^n X_i}{\alpha + n - 1}
$$

不同的 $(\alpha, \beta)$ 有不同的值。

这种相比前一种更灵活，损失函数有多种可以选，先验分布也有多种可以选，代价就是更复杂，还有一点点反直觉。

<!-- 我比较好奇为什么这里不是先算 $E(\theta|\vec{x})$ 然后在用 $\psi = 1/\theta$ 来计算，如果这么算的话，结果是一样的。 -->

<!-- 这个和平时见到的损失函数似乎不太一样，平常见到的都是估计值和实际值。 -->

<!-- $E[L(\theta, a)] = \int_{\Omega}L(\theta, a)\xi(\theta)d\theta$ -->


<!-- $$
E[L(\theta, \delta^*(\vec{x}))|\vec{x}] = \min_{All \ a} E[L(\theta, a)|\vec{x}]
$$ -->

<!-- 两种特殊的损失函数


$E[(\theta - a)^2|\vec{x}]$ 最小，根据很早的 $M.S.E.$ 知识 $a=E(\theta|X)$ 也就是后验分布的期望

同理 -->

另一种损失函数 $L(\theta, a) = |\theta - a|$ 这种 a 等于中位数误差最小。

最近刷一些文章，还有这种损失函数 $L(\theta, a) = ||\theta - a||_2$，搜了下叫 $p-norm$

$$
||\vec{x}||_p = (\sum_{i=1}^n|x_i|^p)^{1/p}
$$

这种损失函数不知道估计量要怎么算，大力出奇迹么。

封面图：Twitter 心臓弱眞君 @xinzoruo