# 《概率统计》 day 36

今天是读《概率统计》的逻辑第 36 天，学习 Fisher Information，越大包含的信息越多。

它有前提：对于任何 $\theta$，$f(x|\theta)$ 要么都大于 0，要么都等于 0。也就是说 $f(x|\theta)$ 等不等于 0 不受 $\theta$ 的影响。

那么首先排除 $[0, \theta]$ 的均匀分布，这个分布用不了。

满足条件下，Fisher Information 的定义 $I(\theta) = E_\theta\{[\lambda'(X|\theta)]^2\}$，但这个定义没什么用，计算根本不按定义来，而是一系列意义不明操作

$$
\begin{aligned}
\lambda(x|\theta) = log f(x|\theta) \\
\lambda'(x|\theta) = \frac{\partial \lambda(x|\theta)}{\partial \theta} \\
\lambda''(x|\theta) = \frac{\partial \lambda'(x|\theta)}{\partial \theta} \\
I(\theta) = - E_\theta[\lambda''(X|\theta)]
\end{aligned}
$$

先取对数，再导两次，最后计算期望。

而且把 $\lambda'(X|\theta)$ 看成随机变量 $Y$ 还能发现 $E(Y) = 0$，这样 $I(\theta) = E_\theta(Y^2) = Var_\theta(Y)$

至于 $E(Y)$ 为什么等于零，书里的说法是 $\int_Sf(x|\theta)dx = 1$ 推出 $\int_Sf'(x|\theta)dx = 0$

又由导数的链式规则（仅剩不多的微积分知识）推出

$$
\lambda'(x|\theta) = \frac{\partial log [f(x|\theta)]}{\partial \theta} = \frac{f'(x|\theta)}{f(x|\theta)}
$$

最后 $E[\lambda'(x|\theta)] = \int_S \lambda'(x|\theta) f(x|\theta)dx = \int_S f'(x|\theta) dx = 0$

![](https://files.mdnice.com/user/18103/5e41b4a3-6ef9-43b6-8789-edc802de34f2.jpg)

**伯努利分布**

$$
\begin{aligned}
\lambda(x|p) &= xlogp + (1-x)log(1-p) \\
\lambda'(x|p) &= \frac{x}{p} - \frac{1-x}{1-p} \\
\lambda''(x|p) &= -\frac{x}{p^2} - \frac{1-x}{(1-p)^2} \\
I(p) &= \frac{E(X)}{p^2} + \frac{1 - E(X)}{(1-p)^2} = \frac{1}{p(1-p)}
\end{aligned}
$$

**二项式分布**

$$
\begin{aligned}
\lambda(x|p) &= log[\binom{n}{x}] + xlogp + (n-x) log(1-p) \\
\lambda'(x|p) &= \frac{x}{p} - \frac{n-x}{1-p} \\
\lambda''(x|p) &= -\frac{x}{p^2} - \frac{n-x}{(1-p)^2} \\
I(p) &=  \frac{E(X)}{p^2} + \frac{n - E(X)}{(1-p)^2} = \frac{n}{p(1-p)}
\end{aligned}
$$

**泊松分布**

$$
\begin{aligned}
\lambda(x|\theta) &= -\theta + x log \theta - log (x!)\\
\lambda'(x|\theta) &= \frac{x}{\theta} - 1 \\
\lambda''(x|\theta) &= -\frac{x}{\theta^2} \\
I(\theta) &= \frac{E(X)}{\theta^2} = \frac{1}{\theta}
\end{aligned}
$$

**负二项式分布**

$$
\begin{aligned}
\lambda(x|p) &= log[\binom{r+x-1}{x}] + rlogp + x log(1-p) \\
\lambda'(x|p) &= \frac{r}{p} - \frac{x}{1-p} \\
\lambda''(x|p) &= - \frac{r}{p^2} - \frac{x}{(1-p)^2} \\
I(p) &= \frac{r}{p^2} + \frac{E(X)}{(1-p)^2} = \frac{r}{p^2(1-p)}
\end{aligned}
$$

**正态分布**

$\mu$ 已知

$$
\begin{aligned}
\lambda(x|\sigma) &= -log(\sqrt{2\pi}) - log\sigma - \frac{(x-\mu)^2}{2\sigma^2} \\
\lambda'(x|\sigma) &= -\frac{1}{\sigma} + \frac{(x-\mu)^2}{\sigma^3} \\
\lambda''(x|\sigma) &= \frac{1}{\sigma^2} - \frac{3(x-\mu)^2}{\sigma^4} \\
I(\sigma) &= -\frac{1}{\sigma} + \frac{3E(X-\mu)^2}{\sigma^4} = -\frac{1}{\sigma} + \frac{3Var(X)}{\sigma^4} = \frac{2}{\sigma^2}
\end{aligned}
$$

$\sigma$ 已知

$$
\begin{aligned}
\lambda(x|\mu) &= -log(\sqrt{2\pi}\sigma) - \frac{(x-\mu)^2}{2\sigma^2} \\
\lambda'(x|\mu) &= \frac{x-\mu}{\sigma^2} \\
\lambda''(x|\mu) &= - \frac{1}{\sigma^2} \\
I(\mu) &= \frac{1}{\sigma^2}
\end{aligned}
$$

如果 $\mu, \sigma$ 都未知，这个不会。

注：上面都手算，可能有谬误，望指正。

对于随机抽样，联合概率分布 $f_n(\vec{x}|\theta) = \prod_{1}^{n}f(x_i|\theta)$ 那么 $\lambda_n(\vec{x}|\theta) = \sum_{1}^{n}\lambda(x_i|\theta)$ 于是 $I_n(\theta) = nI(\theta)$ 怪不得二项式是伯努利的 n 倍。

**Cram´er-Rao Inequality**

$$
Var_\theta(T) \ge \frac{[m'(\theta)]^2}{nI(\theta)}
$$

$m(\theta)$ 是 T 的期望，这个不等式展示统计 T 期望和方差的关系，规定方差的下限，数学上的下限一般是突破不了的。

等号成立的等价条件是统计 T 可以写成 $T = u(\theta)\lambda_n'(\vec{X}|\theta) + v(\theta)$ 这样的形式。

伯努利分布 $X = p(1-p)\lambda'(x|p) + p$

二项式分布 $X = p(1-p)\lambda'(x|p) + np$

泊松分布 $X = \theta \lambda'(x|p) + \theta$

这仨都满足等号，伯努利和泊松的方差是 $I(\theta)$ 的倒数，二项式稍微不一样，它的 $m(p) = np$。

**Efficient Estimator**

满足不等式等号的估计量，第四个估计量，但通篇没说怎么计算，只是说它的分布

$$
\frac{\sqrt{nI(\theta)}}{m'(\theta)} [T - m(\theta)]
$$

是标准正态分布，换句话说 T 是

$\mu = m(\theta)$

$\sigma= m'(\theta)/\sqrt{nI(\theta)}$

的正态分布

另外 MLE $\hat{\theta}_n$ 在样本量大时很接近 efficient estimator 可以近似认为 $\sqrt{nI(\theta)}(\hat{\theta}_n - \theta)$ 是标准正态分布。

封面图：Twitter 心臓弱眞君 @xinzoruo