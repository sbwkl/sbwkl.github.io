# 《概率统计》 day 35

今天是读《概率统计》的逻辑第 35 天，学习无偏估计量。

一种新的估计量 $\delta(\vec{X})$，满足 $E_\theta[\delta(\vec{X})] = g(\theta)$，最简单就是 $g(\theta) = \theta$

$$
\hat{\theta} = 3/T
$$

T 是 $(3, \theta)$ 的伽马分布

$$
E(\hat{\theta}) = 3E(1/T) = 3 \int \frac{1}{t} f(t) dt = 3 \int \frac{1}{t} \frac{\theta^2}{\Gamma(3)} t^2 e^{-\theta t}dt = 3\theta / 2
$$

可以知道 $\hat{\theta}$ 不是 $\theta$ 的无偏估计量，进一步可以知道 $2/T$ 是 $\theta$ 的无偏估计量

T 是 $(n, \theta)$ 的伽马分布

$$
E(\hat{\theta}) = n E(1/T) = n \int \frac{1}{t} f(t) dt = n \int \frac{1}{t} \frac{\theta^n}{\Gamma(n)} t^{n-1} e^{-\theta t}dt = \frac{n}{n-1} \theta
$$

$E_\theta [\delta(\vec{X})] - g(\theta)$ 叫做 bias，没找到翻译，也许叫偏差？顺便一说，机器学习里也有这个词。

可以知道 $\hat{\theta}$ 的无偏估计量是 $(n-1)/T$，又多一种，好在这些估计量在 n 很大的时候差别不大，样本量才是王道。

$$
E_\theta[(\delta - g(\theta))^2] = Var_\theta(\delta) + bias^2
$$

有些分布的无偏估计量很怪，基本没法用。比如几何分布，$g(\theta) = p$ 的无偏估计量，对任何 p 满足

$$
E[\delta(X)] = \sum_{x=0}^\infty \delta(x) f(x|p) = p
$$

代入函数

$$
\delta(0)p(1-p)^0 + \delta(1)p(1-p)^1 + \delta(2)p(1-p)^2 + ... = p
$$

两边除以 p

$$
\delta(0) + \delta(1)(1-p)^1 + \delta(2)(1-p)^2 + ... = 1
$$

要求这个式子对所有 p 都成立，那好像只有 $\delta(0) = 1$，其他 $\delta(x)$ 都等于 0。

这样的无偏估计量没啥用，毕竟估计量是用来预测以辅助决策的。这个要么 0 要么 1 太二极管。

根据上一节

$$
\sum_{i=1}^n (X_i -\mu)^2 = \sum_{i=1}^n(X_i - \overline{X}_n)^2 + n(\overline{X}_n - \mu)^2
$$

其中 $E[(X_i - \mu)^2]$ 是 $X_i$ 的方差，$E[(\overline{X}_n - \mu)^2]$ 是 $\overline{X}_n$ 的方差，是 $X_i$ 方差的 $1/n$

那么

$$
\begin{aligned}
E[\sum_{i=1}^n(X_i - \overline{X}_n)^2] &= E[\sum_{i=1}^n (X_i -\mu)^2] - nE[(\overline{X}_n - \mu)^2] \\
&= \sum_{i=1}^n E[(X_i -\mu)^2] - nE[(\overline{X}_n - \mu)^2] \\
&= n\sigma^2 - n(\frac{1}{n}\sigma^2) = (n-1)\sigma^2
\end{aligned}
$$

对于随机样本 $\vec{X} = (X_1, ..., X_n)$ 如果 $g(\theta) = Var_\theta(X_1)$ 这时候的无偏估计量是

$$
\delta(\vec{X}) = \frac{1}{n-1} \sum (X_i - \overline{X})^2
$$

对于格式

$$
T_c = c \sum_{i=1}^n (X_i - \overline{X}_n)^2
$$

的所有估计量

$$
\begin{aligned}
MSE(T_c) &= E[(T_c - \sigma^2)^2] \\
&=[E(T_c) - \sigma^2]^2 + [Var(T_c)]^2 \\
&=[(n-1)c-1]^2\sigma^4 + 2(n-1)c^2\sigma^4 \\
&=[(n^2-1)c^2 - 2(n-1)c + 1]\sigma^4
\end{aligned}
$$

一元二次方程解最小值，好怀念的感觉，当 $c=n+1$ 的时候 MSE 最小。

好家伙，关于 $\sigma^2$ 现在有 3 个估计量，就看你信哪个

MLE $\hat{\theta} = 1/n \sum_{i=1}^n (X_i - \overline{X}_n)^2$

无偏估计量 $1/(n-1) \sum_{i=1}^n (X_i - \overline{X}_n)^2$

最后一个方差最小 $1/(n+1) \sum_{i=1}^n (X_i - \overline{X}_n)^2$

还挺规律

封面图：Twitter 心臓弱眞君 @xinzoruo