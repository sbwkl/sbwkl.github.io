# 《概率统计》 day 35

今天是读《概率统计》的逻辑第 35 天，学习无偏估计量。

无偏估计量，满足 $E_\theta[\delta(\vec{X})] = g(\theta)$，最简单的 $g(\theta) = \theta$。

举个例子

指数分布的 MLE $\hat{\theta} = n / T$，T 是 $(n, \theta)$ 的伽马分布

$$
\begin{aligned}
E[\hat{\theta}] &= E[\frac{n}{T}] = nE(\frac{1}{T}) \\
&=n \int \frac{1}{t} f(t) dt \\
&=n \int \frac{1}{t} \frac{\theta^n}{\Gamma(n)} t^{n-1} e^{-\theta t}dt \\
&=\frac{n}{n-1} \theta
\end{aligned}
$$

$E(\hat{\theta}) - \theta=\theta/(n-1)$，可以知道 $\hat{\theta}$ 不是无偏估计量，略大，但 $(n-1)/T$ 是。

正态分布 $\sigma^2$ 的 MLE $\hat{\sigma^2} = 1/n \sum_{i=1}^n (X_i - \overline{X}_n)^2$

根据

$$
\sum_{i=1}^n (X_i -\mu)^2 = \sum_{i=1}^n(X_i - \overline{X}_n)^2 + n(\overline{X}_n - \mu)^2
$$

$E[(X_i - \mu)^2]$ 是 $X_i$ 的方差

$E[(\overline{X}_n - \mu)^2]$ 是 $\overline{X}_n$ 的方差

那么

$$
\begin{aligned}
E[\hat{\sigma^2}] &= \frac{1}{n} E[\sum_{i=1}^n(X_i - \overline{X}_n)^2] \\
&= \frac{1}{n} E[\sum_{i=1}^n (X_i -\mu)^2] - E[(\overline{X}_n - \mu)^2] \\
&= \frac{1}{n} \sum_{i=1}^n E[(X_i -\mu)^2] - E[(\overline{X}_n - \mu)^2] \\
&= \sigma^2 - \frac{1}{n}\sigma^2 = \frac{n-1}{n} \sigma^2
\end{aligned}
$$

$E(\hat{\sigma^2}) - \sigma^2 = -\sigma^2/n$ 可以知道 $\hat{\sigma^2}$ 也不是无偏估计量，略小，但 $\frac{1}{n-1} \sum_{i=1}^n (X_i - \overline{X})^2$ 是，咋都少一。

有些分布的无偏估计量很怪，比如几何分布 $p$ 的无偏估计量，需要满足

$$
E[\delta(X)] = \sum_{x=0}^\infty \delta(x) f(x|p) = p
$$

代入概率函数

$$
\delta(0)p(1-p)^0 + \delta(1)p(1-p)^1 + \delta(2)p(1-p)^2 + ... = p
$$

两边除以 p

$$
\delta(0) + \delta(1)(1-p)^1 + \delta(2)(1-p)^2 + ... = 1
$$

这个等式要求对所有 p 都成立，那好像只有 $\delta(0) = 1$，其他都等于 0 了。

这个估计量没啥用，估计量是用来预测以辅助决策的，这个要么 0 要么 1 也太 2 了。

$E(\delta) - g(\theta)$ 叫做偏差，显然无偏估计量的偏差为零。顺便一说，机器学习里也有这个词。

估计量的 M.S.E. $E_\theta[(E(\delta) - g(\theta))^2]$，如果 $\delta$ 是无偏估计量，那么 $E_\theta[(E(\delta) - g(\theta))^2]=Var_\theta(\delta)$ 这个很好理解。如果不是，那么 $E_\theta[(E(\delta) - g(\theta))^2] = Var_\theta(\delta) + bias^2$ 这就很费解了。

查了一些资料，过程都很微妙，其中一种

已知 $E(X^2) = Var(X) + [E(X)]^2$，把 $\delta - \theta$ 代入 X 得到

$$
E[(\delta - \theta)^2] = Var(\delta - \theta) - [E(\delta - \theta)]^2
$$

等号左边是 MSE 的定义，等号右边第二项是偏差的平方，问题是为毛 $Var(\delta - \theta) = Var(\delta)$，难道把 $\theta$ 当常量看，不应该是随机变量么，不懂，有没有大手子解释下。

这个公式简化 MSE 计算，估计量 $T_c = c \sum_{i=1}^n (X_i - \overline{X}_n)^2$ 计算 MSE。

<!-- 都可以当做正态分布 $\sigma^2$ 的估计量 -->

$\sum_{i=1}^n (X_i - \overline{X}_n)^2/\sigma^2$ 是 n - 1 的 $\chi^2$ 分布（假设 $X_i$ 是正态分布）有

$E[T_c] = (n-1)c\sigma^2$,

$Var(T_c) = 2(n-1)c^2\sigma^4$

$$
\begin{aligned}
MSE(T_c) &=Var(T_c) + [E(T_c) - \sigma^2]^2 \\
&=2(n-1)c^2\sigma^4 + [(n-1)c-1]^2\sigma^4\\
&=[(n^2-1)c^2 - 2(n-1)c + 1]\sigma^4
\end{aligned}
$$

一元二次方程解最小值，好怀念的感觉，当 $c=1/(n+1)$ 的时候 MSE 最小。

这下好了，关于 $\sigma^2$ 有 3 个估计量

$$\frac{1}{n} \sum_{i=1}^n (X_i - \overline{X}_n)^2$$

$$\frac{1}{n-1} \sum_{i=1}^n (X_i - \overline{X}_n)^2$$

$$\frac{1}{n+1} \sum_{i=1}^n (X_i - \overline{X}_n)^2$$

就看你信哪个。

难怪说科学的尽头是玄学。

封面图：Twitter 心臓弱眞君 @xinzoruo