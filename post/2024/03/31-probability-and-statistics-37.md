# 《概率统计》 day 37

今天是读《概率统计》的逻辑第 36 天，学习假设检验。

假如有一天和朋友赌图，抛硬币猜正反，玩了 20 局，输了 14 张涩图，你怀疑他耍诈，但没有证据。

从概率上来说，如果硬币没问题

```
In [1]: from scipy.stats import binom
   ...: rv = binom(n = 20, p=0.5)
   ...: 1 - rv.cdf(14-1)
Out[1]: 0.057659149169921875
```

输 14 局以上的概率是 $P(\sum_{i=1}^{20} X_i \ge 14|p=0.5) = 1 - F(13) = 0.0577$

![](https://files.mdnice.com/user/18103/b5d8defd-7bf3-4cc7-9233-b1ad5b4e24bf.png)

这还真有点合理，一般的标准是 0.05 以下，要是再输一局，可以考虑削他。

这是假设检验的应用，特殊 case

1. 假设只有一个值 θ = 0.5
2. 检验的形式为「如果 T ≥ t 拒绝假设」

硬币的概率 θ 分为两个不相交的子集 $\Omega_0$ 和 $\Omega_1$，对应两个假设

$$
\begin{aligned}
H_0: θ=0.5 \\
H_1: θ \ne 0.5
\end{aligned}
$$

$H_0$ 叫做 null hypothesis，不仅如此，它只有一个值，还能叫 simple null hypothesis，$H_1$ 叫做 alternative hypothesis。

理论上两个假设可以反过来写，但假设检验有点反证法的味道，想证明硬币有问题，$H_0$ 就假设没问题，再一个，反过来后面计算会很蛋疼。

20 局的结果用统计 $T = \sum_{i=1}^{n} X_i$ 表示，理论上任何 $T = r(\vec{X})$ 都行，用矢量 $\vec{X} = (X_1, ..., X_n)$ 表示也行，会复杂很多很多。

检验 $\delta$：如果 T ≥ c 拒绝 $H_0$。

集合 R = $[c, \infty)$ 叫做 rejection region，其实还有个和 R 对应的由 $\vec{X}$ 组成的集合 $S_1$ 叫 critical region 不过很少用。

最后 $P(T \ge c|p)$ 叫做 power function，它表示任何 p 检验 $\delta$ 拒绝 $H_0$ 的概率，符号 $\pi(\theta|\delta)$。

$\pi(p|\delta) = P(T \ge c|θ) = 1 - F(c-1)$

理想的情况

$$
\pi(\theta|\delta) =
\begin{cases}
0 \ \theta \in \Omega_0 \\
1 \ \theta \in \Omega_1
\end{cases}
$$

实际做不到，只能尽量小，定义显著性水平 $\alpha_0$：所有 $\theta \in \Omega_0$ 满足 $\pi(\theta|\delta) \le \alpha_0$，一般用 0.05。

定义 size $\alpha(\delta) = sup_{\theta \in \Omega_0} \pi(\theta|\delta)$ 任何大于 $\alpha(\delta)$ 的值都能当显著性水平。

$\alpha_0$ 代入 $\pi(θ|\delta_c)$ 解出 $c = F^{-1}(1-\alpha_0) + 1$，取 0.05 时 c = 15.

显著性等级 0.05 的 $\delta$ 描述为：如果 $T \ge 15$ 拒绝 $H_0$。太可惜了，就差一点。

显著性水平可以判断要不要拒绝 $H_0$，15 和 16 都拒绝 $H_0$，没区别。但明显 16 更加邪门，定义 p 值表示区别。

p 值的定义很抽象，我放一下原文

> In general, the p-value is the smallest level $α_0$ such that we would reject the null-hypothesis at level $α_0$ with the observed data.

限定在形式「如果 T ≥ t 拒绝 $H_0$」可以简化为计算

$$
sup_{\theta \in \Omega_0} \pi(\theta|\delta) = sup_{\theta \in \Omega_0} P(T \ge t|\theta)
$$

$p_{15} = P(T \ge 15|p=0.5) = 0.0207$

$p_{16} = P(T \ge 16 | p=0.5) = 0.0059$

这时能看出 16 有更低的显著性水平。

<!--  -->

$\Omega_0$ 只有一个值，看起来还比较简单，如果 $H_0: \theta \le 0.6$ 那就复杂很多了。

一个方法是证明 $\pi(\theta|\delta)$ 是递增或递减函数，这样 $\alpha(\delta)$ 只会出现在 $\theta$ 的最大值或最小值上。

直觉来说，二项式的累积分布函数 F(x) 对 p 应该是递减的。$F(c|\theta) = P(X ≤ c|\theta)$，随着 p 增加，每次 $X_i = 1$ 的概率变大，总体应该更大，那么小于固定值 c 的概率应该变低，网上有个证明$^{[1]}$，然而看不懂。

$F(c|\theta)$ 递增，那么 $\pi(\theta|\delta) = 1 - F(c-1|\theta)$ 递减，那么 $\alpha(\delta)$ 应该在 0.6 处最大，这样就和前面的计算一样了。

- [1] Monotonicity of the CDF of a Binomial Distribution: *https://math.stackexchange.com/questions/3314465/monotonicity-of-the-cdf-of-a-binomial-distribution*

封面图：Twitter 心臓弱眞君 @xinzoruo