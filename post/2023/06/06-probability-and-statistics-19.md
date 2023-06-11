# 《概率统计》 day 19

今天是读《概率统计》的逻辑第 19 天，学习中位数。

这个概念以前有听过，当时还在纠结如果统计个数是偶数，那么中位数怎么算。

这节刚好解惑，结论是最中间两个的区间都可以，流行一点就取平均数

中位数定义：随即变量 X，中位数 m 满足

$P(X \le m) \ge 1/2$ 且 $P(X \ge m) \ge 1/2$

如果 X 的概率函数是

$$
f(x) =
\begin{cases}
0.25 &\text{x = 1, 2, 3, 4} \\
0    &\text{otherwise}
\end{cases}
$$

那么区间 [2, 3] 的每个数都是中位数，最流行的做法取中点 2.5

$M.S.E.$ 全称 Mean Squared Error，翻译过来叫均方误差。这个在线性回归看到好多次。

不过看下来和线性回归的不太一样，



$M.A.E.$ 全称 Mean Absolute Error，翻译过来叫平均绝对误差

协方差 covariance

相关 correlation

两个新概念，衡量两个随机变量线性依赖的程度。

$Cov(X, Y)=E[(X-\mu_X)(Y-\mu_Y)]$

这么看的话 $Var(X) = Cov(X, X)$

$\rho(X,Y)=\frac{Cov(X,Y)}{\sigma_X\sigma_Y}$


$[E(UV)]^2 \le E(U^2)E(V^2)$

$\rho(X,Y)$ 的取值在 [-1, 1] 之间，

$Cov(X, Y)=E(XY) - E(X)E(Y)$

所以如果 X, Y 独立，那么 Cov(X, Y) = 0，但反过来不一定成立。

比如 X = -1, 0, 1，$Y = X^2$ 那么 Cov(X, Y) = 0

实际上如果 X 在 x = 0 对称，Y 是 X 的偶数次幂，那么协方差都是零。

所以协方差也不是万能的。



$Var(X+Y)=Var(X) + Var(Y) + 2Cov(X,Y)$

回到之前的投资组合题，这次增加条件相关 -0.3



封面图：Twitter 心臓弱眞君 @xinzoruo