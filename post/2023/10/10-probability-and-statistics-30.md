# 《概率统计》 day 30

今天是读《概率统计》的逻辑第 30 天，学习 Bayes Estimators。

Estimator 百科叫做估计量，估计量（estimator）、被估量（estimand）和估计值（estimate）

or 结尾的很像叫他估算器

这么来看，也许可以叫贝叶斯估计量？

估计量是一个参数为 $\theta$，入参为一系列随机变量 $X_i$ 的函数，记作 $\delta(X_1, ..., X_n)$，估计值是函数的其中一个值 $\delta(x_1, ..., x_n)$。

这里的 $\theta$ 不一定是一个参数，也可以是 1750 亿。

损失函数



封面图：Twitter 心臓弱眞君 @xinzoruo

$\psi = h(\theta)$

$\delta^*(\vec{x}) = E(\psi|\vec{x}) = E(h(\theta)|\vec{x})$

一个例子是观察一个队伍，有 3 个人分别等了 $X_1=3, X_2 = 1.5, X_3 = 2.1$

预测平均等待时间

根据之前的知识，$X_i$ 建模为参数为 $\theta$ 的指数分布，那么后验分布 $\xi(\theta|\vec{x})$ 是 $(\alpha + 3, \beta + 6.6)$ 的伽马分布。

为了方便 $\alpha = \beta = 0$

$$
E(\theta|\vec{x}) = 3/6.6
$$


预测的平均等待时间 $\psi =h(\theta) = 1/\theta$

$$
\delta^*(\vec{x}) = E(\frac{1}{\theta}|\vec{x}) = \int_{0}^{\infty} \frac{1}{\theta}\xi(\theta|\vec{x}) = \frac{6.6^3}{2}\int_0^{\infty} \theta^1e^{-6.6\theta}d\theta = 3.3
$$

$1/\delta^*(\vec{x}) = 6.6/3=2.2$

第二种是最自然的预测方式，算平均数，略小于贝叶斯估计值。

最大似然估计量

不需要先验分布和损失函数

$$
f(\vec{x}|\theta) = \theta^3e^{-6.6\theta}
$$

最大似然更符合直觉，似然函数是 $\vec{x}$ 发生的概率，那既然观察到了，那就是说明对于

