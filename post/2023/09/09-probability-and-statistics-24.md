# 《概率统计》 day 24

今天是读《概率统计》的逻辑第 24 天，学习各种各样的分布（下）。

**指数分布**

这个分布大概是用来建模等待时间的。

概率密度函数

$$
f(x|\beta) = \beta e^{-\beta x}
$$

$x \gt 0, \beta \gt 0$

它的期望和累积分布函数分别是 $\mu =\frac{1}{\beta }$，$F(x|\beta ) = 1 - e^{-\beta x}$，于是有

$$
\begin{aligned}
P(X \gt \mu )  &= 1 / e   &=0.3679\\
P(X \gt 2\mu ) &= 1 / e^2 &=0.1353\\
P(X \gt 3\mu ) &= 1 / e^3 &=0.0498\\
\end{aligned}
$$

如果医院平均 5 分钟叫一个号，等了 15 分钟还没叫下一号，赶紧找护士姐姐问问，是不是已经没号了，自己还过号了，来自一个傻傻等了半小时的冤大头。

实际医院一早上四个小时放两百多个号，每个号就一分钟点，这效率，杠杠的。

偶尔特别衰的时候，比如医生电脑卡住了，打印机坏了，没纸了，最难绷的是遇上唠嗑的，那等的是真吐血。

**伽马分布**

如果前面等着好几个人，需要多长时间？

$$
f(x|\alpha, \beta ) = \frac{\beta ^\alpha}{Γ(\alpha)}x^{\alpha - 1}e^{-\beta x}
$$

$\alpha \gt 0, \beta \gt 0, x \gt 0$

其中 $Γ(\alpha)$ 叫伽马函数，是阶乘的扩展，大概长这样

$$
Γ(\alpha) = \int_0^{\infty}x^{\alpha-1}e^{-x}dx
$$

很难想象，这个式子居然可以表示阶乘。

它的矩母函数

$$
\begin{aligned}
\psi(t) &= E(e^{tX}) = \int_0^{\infty}e^{tx}f(x|\alpha, \beta )dx \\
&= \int_0^{\infty}e^{tx}\frac{\beta ^\alpha}{Γ(\alpha)}x^{\alpha - 1}e^{-\beta x}dx \\
&= \frac{\beta ^\alpha}{Γ(\alpha)}\int_0^{\infty}x^{\alpha - 1}e^{-(\beta -t)x}dx \\
&=(\frac{\beta }{\beta -t})^\alpha
\end{aligned}
$$

这个形式的矩母函数可以这么写

$$
\psi(t) = \prod_{i=1}^{k}\psi_i(t)
$$

就是说 k 个独立的，$\beta$  相同的伽马分布的和是 $\alpha_1 + ... + \alpha_k, \beta$ 的伽马分布。

刚好指数分布是 $\alpha = 1$ 的伽马分布，那么等 n 个人就是 $n, \beta$ 的伽马分布。

**帕累托分布**

伽马分布在 $\alpha \lt 1$ 的时候有点像幂律分布（二八定律），我一度怀疑就是。经过一番搜索后发现不对，幂律分布似乎没完全敲定，有个叫帕累托的比较接近。

$$
f(x|x_0, \alpha) = \frac{\alpha x_0^\alpha}{x^{\alpha+1}}
$$

$\alpha \gt 0, x \gt x_0$

国统局说 22 年人均可支配收入平均值 36883，中位数 31370，查帕累托的期望和中位数公式，于是有

$$
\begin{cases}
\frac{\alpha x_0}{\alpha - 1} &= 36883\\
x_0\sqrt[\alpha]{2} &= 31370
\end{cases}
$$

这个方程组解肯定是不会解的，但可以乱试，试了几组参数，发现 $\alpha = 3.15, x_0 = 25174$ 最接近。

但是按照这个参数

```
from scipy.stats import pareto
rv = pareto(b = 3.15, scale=25174)
print(rv.ppf(0.9))
print(rv.ppf(0.99))
```

90 分位是 52289，99 分位是 108610 似乎有点少，再一个 $x_0$ 是最小值，就是说最低都有 25174，这个和总理说的明显矛盾。

这么来看，可支配收入可能不适用这个分布。

另外有意思的是如果 X 是帕累托分布，那么 $log(X/x_0)$ 就是指数分布。

**贝塔分布**

和伽马类似，有个函数叫贝塔函数，于是有个分布叫贝塔分布。

<!-- 这个分布用来建模概率， -->

很早之前有个例子，观察患者治疗结果，推测治愈概率

$$
g_2(p|x) = \frac{p^x(1-p)^{n-x}}{\int_0^1p^x(1-p)^{n-x}dp}
$$

这个分母就是贝塔函数的定义

$$
Β(\alpha, \beta) = \int_0^1p^{\alpha-1}(1-p)^{\beta-1}dp
$$

经过一操子牛逼计算

$$
Β(\alpha, \beta ) = \frac{Γ(\alpha)Γ(\beta )}{Γ(\alpha + \beta )}
$$

概率密度函数

$$
f(x|\alpha, \beta) = \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha)\Gamma(\beta)}x^{\alpha-1}(1-x)^{\beta-1}
$$

当时用的均匀分布 $f(p) = 1$，是 $\alpha=\beta=1$ 的特殊情况。

如果 $P$ 是参数 $\alpha, \beta$ 的贝塔分布，n 次试验，观察到 x 次成功后的条件概率 $f(p|X=x)$ 是 $\alpha + x$, $\beta  + n - x$ 的贝塔分布，大幅简化了计算过程。

看过伽马分布和贝塔分布，我就想有没有阿尔法分布，搜了下还真有

$$
f(x|\alpha, \beta ) = \frac{\beta }{\sqrt{2\pi}\Phi(\alpha)x^2}e^{-\frac{(\alpha - (\beta /x))^2}{2}}
$$

不知道有啥用，长得倒和正态分布有几分相似。

封面图：Twitter 心臓弱眞君 @xinzoruo