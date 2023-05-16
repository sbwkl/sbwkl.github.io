# 《概率统计》 day 17

今天是读《概率统计》的逻辑第 17 天，继续学习期望，介绍 Y = r(X) 时，E(Y) 和 E(X) 的关系。


|Y = r(X)|E(Y)|
|--|--|
|$$Y = aX + b$$|$$E(Y) = aE(X) + b$$|
|P(X = c) = 1|E(X) = c|
|$$Y = X_1 + \dots + X_n$$|$$E(Y)=E(X_1) + \dots + E(X_n)$$|
|X<sub>i</sub> 独立|$$E(\prod_{i=1}^n X_i) = \prod_{i=1}^nE(X_i)$$|


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

这定理还是有用的，假设有个氪金游戏，抽到五星的概率是 p

那么 n 抽出五星的概率是

$$
P(X \ge n) = (1-p)^{n-1}
$$

期望是

$$
E(X) = (1-p)^0 + (1-p)^1 + \dots \\
=\frac{1}{1-(1-p)} = frac{1}{p}
$$

不过现在的游戏为了照顾非酋，流行保底，就不能这么算了。



封面图：Twitter 心臓弱眞君 @xinzoruo