# 《概率统计》 day 39

今天是读《概率统计》的逻辑第 39 天，学习 UMP Test。

它的定义

> A test procedure $δ^∗$ is a *uniformly most powerful (UMP) test* of the hypotheses at the level of significance $α_0$ if $α(δ^∗) ≤ α_0$ and, for every other test procedure $δ$ such that $α(δ) ≤ α_0$, it is true that $π(θ|δ) ≤ π(θ|δ^∗)$ for every value of $θ ∈ \Omega_1$.

以我有限的理解，应该说的是众多满足 $α(δ) ≤ α_0$ 的 $\delta$ 中，$\delta^*$ 的 $\pi(\theta|\delta^*)$ 在 $\Omega_1$ 范围内最大。

这节的方法有两个要求

1. $\theta_1 \lt \theta_2$，$f(\vec{x}|\theta_2)/f(\vec{x}|\theta_1)$ 对 $r(\vec{x})$ 有单调性，又叫 monotone likelihood ratio (MLR)
2. $H_1$ 要么大于要么小于

对于假设

$$
H_0: \theta \le \theta_0
$$
$$
H_1: \theta \gt \theta_0
$$

$T=r(\vec{X})$ 单调递增，那么 $\delta^*$ 描述为: 如果 $T \ge c$ 拒绝 $H_0$。

这个 c 可以通过显著性水平 $\alpha_0$ 算出来，$P(T \ge c|\theta=\theta_0)=\alpha_0$

比如 $\sigma$ 已知的正态分布

$$
\begin{aligned}
\frac{f_n(\vec{x}|\mu_1)}{f_n(\vec{x}|\mu_2)} &= \frac{1/(\sqrt{2\pi\sigma})^n exp[-1/2\sigma^2 \sum (x_i - \mu_2)^2]}{1/(\sqrt{2\pi\sigma})^n exp[-1/2\sigma^2 \sum (x_i - \mu_1)^2]} \\
&= exp\{\frac{n(\mu_2 - \mu_1)}{\sigma^2}[\overline{x}_n - \frac{(\mu_2 - \mu_1)}{2}]\}
\end{aligned}
$$

对 $\overline{X}_n$ 递增，$P(\overline{X}_n \ge c|\mu = \mu_0)=\alpha_0$ 解出

$c = \mu_0 + \sigma / \sqrt{n} * \Phi^{-1}(1 - \alpha_0)$

$\delta^*$：如果 $\overline{X}_n \ge \mu_0 + \sigma / \sqrt{n} * \Phi^{-1}(1 - \alpha_0)$ 拒绝 $H_0$。

$$
\begin{aligned}
\pi(\mu|\delta^*) &= P[\overline{X}_n \ge \mu_0 + \frac{\sigma}{\sqrt{n}} \Phi^{-1}(1 - \alpha_0)|\mu] \\
&= P[\frac{\sqrt{n}(\overline{X}_n -\mu)}{\sigma} \ge \frac{\sqrt{n}}{\sigma}(\mu_0 + \frac{\sigma}{\sqrt{n}} \Phi^{-1}(1 - \alpha_0) - \mu)] \\
&= P[Z \ge \Phi^{-1}(1 - \alpha_0) + \frac{\sqrt{n}}{\sigma}(\mu_0 - \mu)] \\
&=\Phi[\frac{\sqrt{n}}{\sigma}(\mu - \mu_0) - \Phi^{-1}(1 - \alpha_0)]
\end{aligned}
$$

现在有一组数据 $n = 4, \sigma=1, \mu_0 = 10, \alpha_0 = 0.05$ 那么 c = 10.8224

$\delta^*$：如果 $\overline{X}_n \ge 10.8224$ 拒绝 $H_0$

$\pi(\mu|\delta^*) = \Phi[2(\mu - 10) - 1.6449]$

随便取另一个满足显著性水平的 $\delta$：如果 $\overline{X}_n \ge 10.9$ 拒绝 $H_0$。

把这两个函数画出来，$\delta^*$ （蓝线）确实在上面，不过 12 之后基本叠在一起了。

```
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

n = 4
sigma = 1
mu0 = 10
alpha0=0.05

sigma_n = sigma / np.power(n, 0.5)

c = mu0 + norm().ppf(1 - alpha0) * sigma_n
c1 = 10.9

mu = np.linspace(8, 13, 400)

def f1(mu):
    rv = norm(loc=mu, scale=sigma_n)
    return 1 - rv.cdf(c)

def f2(mu):
    rv = norm(loc=mu, scale=sigma_n)
    return 1 - rv.cdf(c1)

y1 = f1(mu)
y2 = f2(mu)
plt.plot(mu, y1, label='δ∗')
plt.plot(mu, y2, label='δ1')
plt.legend()
plt.show()
```

![](https://files.mdnice.com/user/18103/21ba2ea9-74dc-4b25-a31d-9100d9031ebd.png)

如果假设反过来

$$
H_0: \theta \ge \theta_0
$$
$$
H_1: \theta \lt \theta_0
$$

那么 $\delta^*$ 也反过来：如果 $T \le c$ 拒绝 $H_0$

如果 MLR 单调递减，那就改一下 $r(\vec{x})$ 加个负号或者倒数什么的，改成递增。这个东西看起来只是为了算大于/小于号，算 c 和它没多大关系。

比如指数分布

$$
\frac{f_n(\vec{x}|\theta_2)}{f_n(\vec{x}|\theta_1)} = (\frac{\theta_2}{\theta_1})^n exp[(\theta_1-\theta_2)\sum_{i=1}^n x_i]
$$

对 $T=\sum_{i=1}^n X_i$ 递减，但对 $T'=-\sum_{i=1}^n X_i$ 就是递增。

那么 $T' \ge c$ 就是 $T \le c'$，后续计算除了符号方向反了，没区别。

至于为什么这个方法找出来的 $\delta^*$ 就是 UMP Test 其实有详细的论证，但怎么说呢，每个单词我都能认出来，合起来就不知道它在讲啥了。

封面图：Twitter 心臓弱眞君 @xinzoruo