# 《概率统计》 day 20

今天是读《概率统计》的逻辑第 20 天，学习条件期望，听到「条件」这个词，有种不祥的预感。

定义：随机变量 $X, Y$ 期望、方差都存在，条件期望

$$
E(Y|x) = \int_{-\infty}^{\infty}yg_2(y|x)dy
$$

表示当 $X = x$ 时，$Y$ 的期望，离散分布同理。

$E(Y|x)$ 以 $x$ 为自变量，就是说 $E(Y|x) = r(x)$，怎么看怎么别扭，总觉得 $y$ 才是自变量。

令 $z = r(x)$ 那么 $E(Y|x)$ 也是随机变量，相当于 $Z = r(X)$，用符号 $E(Y|X)$ 表示，套娃是吧。

<!-- 然后开始套娃， -->

它也有期望，巧了，刚好就是 $E(Y)$

$$
\begin{aligned}
E[E(Y|X)] &= \int_{-\infty}^{\infty}E(Y|x)f_1(x)dx \\
          &= \int_{-\infty}^{\infty}\int_{-\infty}^{\infty} yg_2(y|x)f_1(x)dydx\\
          & = \int_{-\infty}^{\infty}\int_{-\infty}^{\infty}yf(x, y)dydx\\
          &= E(Y)
\end{aligned}
$$

上一节学 $M.S.E.$ 的时候，有点像机器学习的线性回归，又有点不一样，说 $d =\mu$ 时 $M.S.E.$ 最小。那如果这是个条件期望，就变成 $d(X) = E(Y|X)$ 时 $E\{[Y-d(X)]^2\}$ 最小。

这就对上了，$E(Y|X)$ 是 $x$ 的函数，$x$ 是特征量，机器学习的过程就是解这个函数的过程，无非机器学习的自变量多了亿点点。

回到 long long ago 的例子，40 个病人接受治疗，随机变量 $P$ 表示治愈概率，随机变量 $X$ 表示治愈的人数。

假设 P 是 (0, 1) 均匀分布

$$
\begin{align}
f_2(p)      &= 1 \\
g_1(x|p)    &= \binom{40}{x}p^x(1-p)^{40-x} \\
f_1(x)      &= \int_0^1g_1(x|p)f(p)dp
\end{align}
$$

再根据贝叶斯定理

$$
g_2(p|x) = \frac{g_1(x|p)f_2(p)}{f_1(x)}
$$

经过一操子牛逼操作得到

$$
g_2(p|x) = \frac{41!}{x!(40-x)!}p^x(1-p)^{40-x}
$$

中途用到一个等式

$$
\int_0^1p^k(1-p)^ldp=\frac{k!l!}{k+l+1}
$$

再然后

$$
E(P|x) = \int_0^1pg_2(p|x)dp = \frac{x + 1}{42}
$$

卧槽 $\frac{w + 1}{n + 2}$ 这个结论熟，词条 Rule of succession<sup>1</sup> 就有这个结论，当时看了半天，没看懂它在说啥。

过程很复杂，结论很简单。

这个公式估算概率很好用，买一次彩票，没中，那么中奖的概率是 1/3。明天太阳依旧升起的概率是 $\frac{46亿 + 1}{46亿 + 2}$ 无限接近一。

二项式分布可以这么

References

+ [1] Rule_of_succession：*https://en.wikipedia.org/wiki/Rule_of_succession*

封面图：Twitter 心臓弱眞君 @xinzoruo