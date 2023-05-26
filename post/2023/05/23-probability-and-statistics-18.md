# 《概率统计》 day 18

今天是读《概率统计》的逻辑第 18 天，学习矩。

随机变量 X 和正整数 k，$E(X^k)$ 叫做 X 的第 k 个矩。

矩的原文是 moment，这个翻译据说和物理学有关，

这个词我只知道有瞬间的意思，怎么也没法和矩联系在一起。

中心矩 $E(X - \mu)^k$，其中 $\mu = E(X)$

查了下资料，根据知乎老哥<sup>[1]</sup>的说法，这个概念和物理学力矩有点关系。

力矩是力和距离的乘积，如果两个力 $F_1D_1 = F_2D_2$ 那么就能保持平衡。

如果把分布看做大小不一的力，那么 E(X) 相当于支点。

$E[(X - \mu)]^3 / \sigma^3$

$E[(\frac{X - \mu}{\sigma})^4]$

Moment Generating Functions 简称 $m.g.f.$ 这个有叫矩母函数的，也有叫动差生成函数。

$$
\psi(t) = E(e^{tX})
$$

$$
E(X^n) = \psi^{(n)}(0)
$$

一些定理

$$\psi_2(t) = e^{bt}\psi_1(at)$$

$$\psi(t) = \prod_{i=1}^{n}\psi_i(t)$$

X 是二项式分布 (n, p)，那么 $\psi(t) = (pe^t + 1 - p)^n$

$X_i$ 是二项式分布 ($n_i$, p) (i = 1, 2)，那么 $X_1 + X_2$ 是二项式分布 ($n_1 + n_2$, p)，$\psi(t) = (pe^t + 1 - p)^{n_1 + n_2}$


参考资料

[如何通俗的理解矩母函数](https://zhuanlan.zhihu.com/p/148408669)

[统计学中「矩」这个概念是怎么引入的](https://www.zhihu.com/question/19915565/answer/233262673)

[Kurtosis](https://en.wikipedia.org/wiki/Kurtosis)

封面图：Twitter 心臓弱眞君 @xinzoruo