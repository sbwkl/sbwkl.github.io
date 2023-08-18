# 《概率统计》 day 22

今天是读《概率统计》的逻辑第 22 天，学习各种各样的分布（上）。

最近沉迷优菈，无法自拔，优菈是真好看。

这几种分布多少和抛硬币、抓球有点关系。

伯努利分布

这应该是最简单的分布了，只有两个值 0 和 1，p 的概率抛出 1，1 - p 的概率抛出 0。

$$
f(x|p) =
\begin{cases}
p^x(1-p)^{1-x} & x = 0, 1 \\
0              & \text{otherwise.}
\end{cases}
$$

二项式分布

叠加 n 个伯努利分布，有两个参数 n 和 p

$$
f(x|n, p) =
\begin{cases}
\binom{n}{x}p^x(1-p)^{n-x} & x = 1, 2, ...,n \\
0                          & \text{otherwise.}
\end{cases}
$$

k 个独立的二项式分布，只要 p 相同也能叠，叠成 $(n_1 + n_2 + ... + n_k, p)$

这是因为二项式分布的矩母函数是 $\phi(t) = (pe^t + 1 - p)^n$

$$
\phi(t) = \prod_{i=1}^{k}\phi_i(t) = \prod_{i=1}^{k}(pe^t + 1 - p)^{n_i} = (pe^t + 1 - p)^{n_1 + n_2 + ... + n_k}
$$

这是 $(n_1 + n_2 + ... + n_k, p)$ 的矩母函数

原本以为矩母函数只负责产矩，没想到还能用来证明，而且这个套路后面还用了好几次。

这节还有个例子很应景，混管测试。全民核酸刚开始那会儿，第一次听说十合一混管测试，那时候觉得：哇，好聪明，居然能想出这样的法子，回过头来看都是以前的人玩剩下的。

等后面放开了，混管就没用了，基本都是疑似阳



超几何分布

这个分布和二项式分布有点关系

$$
f(x|A, B, n) =
\begin{cases}
\frac{\binom{A}{x}\binom{B}{n-x}}{\binom{A+B}{n}}   & max(0, n-B) \le x \le min(n, A)\\
0                                                   & \text{otherwise.}
\end{cases}
$$

泊松分布

$$
f(x|\lambda) =
\begin{cases}
\frac{e^{-\lambda}\lambda^x}{x!}    & x = 0, 1, 2, ...\\
0                                   & \text{otherwise.}
\end{cases}
$$

泊松分布 $\lambda_1$ $\lambda_2$

$P(X_1|X_1 + X_2 = k)$ 是二项式分布 k, $\frac{\lambda_1}{\lambda_1 + \lambda_2}$



负二项分布

$$
f(x|r, p) =
\begin{cases}
\binom{x + r - 1}{x}p^r(1-p)^x  & x = 1, 2, ....\\
0                               & \text{otherwise.}
\end{cases}
$$

几何分布

当负二项分布的 r = 1 的时候就是几何分布。


封面图：Twitter 心臓弱眞君 @xinzoruo