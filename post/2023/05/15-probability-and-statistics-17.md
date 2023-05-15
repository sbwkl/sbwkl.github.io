# 《概率统计》 day 17

今天是读《概率统计》的逻辑第 17 天，继续学习期望，介绍一些期望的特性，方便计算。

if

Y = aX + b

then

E(Y) = aE(X) + b

if

P(X = c) = 1

then

E(X) = c

if

$$
X_1, X_2, ..., X_n
$$

独立

then

$$
E(\prod_{i=1}^n X_i) = \prod_{i=1}^nE(X_i)
$$

假设 X 只能取非负数，那么

$$
E(X) = \sum_{n=1}^{\infty}P(X \ge n)
$$

这个定理的证明挺有意思的

三角形数列

$$
\begin{aligned}
& P(X = 1) & P(X = 2) & P(X = 3) & \dots \\
&          & P(X = 2) & P(X = 3) & \dots \\
&          &          & P(X = 3) & \dots \\
&          &          &          & \ddots
\end{aligned}
$$

然后这个数列按行按列求和，可以写作

$$
\sum_{n=1}^{\infty}nP(X=n) = \sum_{n=1}^\infty P(X \ge n)
$$


根据期望定义

$$
E(X) = \sum_{n=0}^{\infty}nP(X=n) = \sum_{n=1}^{\infty}nP(X=n)
$$

so 证明完成

氪金抽卡，抽到五星停手

封面图：Twitter 心臓弱眞君 @xinzoruo