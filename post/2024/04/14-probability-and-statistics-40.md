# 《概率统计》 day 40

今天是读《概率统计》的逻辑第 40 天。

这几天看下来，似乎 $\delta$ 才是假设检验的重点。除了第一节介绍海量概念，第二节找 $\delta$，第三节找 $\delta$，这节还是找 $\delta$。

$\delta$ 形式：如果 $T \le c_1$ 或 $T \ge c_2$ 拒绝 $H_0: \mu_1 \le \mu \le \mu_2$。

因为有两个 c，从解方程升级为解方程组

$$
\begin{cases}
\pi(\mu_1|\delta) = \alpha_1 \\
\pi(\mu_2|\delta) = \alpha_2
\end{cases}
$$

$\alpha_1 \le \alpha_0, \alpha_2 \le \alpha_0$

比如 $N(\mu, 1)$ 的正态分布 $X_i$ 随机抽样 n = 25

$$
H_0: 0.1 \le \mu \le 0.2
$$
$$
H_1: \mu \lt 0.1, \ \mu \gt 0.2
$$

显著性水平 $\alpha_0$ 的 $\delta$：如果 $\overline{X}_n \le c_1$ 或者 $\overline{X}_n \ge c_2$ 拒绝 $H_0$

$$
\begin{aligned}
\pi(0.1|\delta) &= P(\overline{X}_n \le c_1|\mu=0.1) \\
&\ \ \ \ + P(\overline{X}_n \ge c_2|\mu = 0.1) \\
&= \Phi[\sqrt{n}(c_1 - 0.1)] \\
&\ \ \ \ + \Phi[- \sqrt{n}(c_2 - 0.1)]
\end{aligned}
$$

$$
\begin{aligned}
\pi(0.2|\delta) &= P(\overline{X}_n \le c_1|\mu=0.2) \\
&\ \ \ \ + P(\overline{X}_n \ge c_2|\mu = 0.2) \\
&= \Phi[\sqrt{n}(c_1 - 0.2)] \\
&\ \ \ \ + \Phi[- \sqrt{n}(c_2 - 0.2)]
\end{aligned}
$$

理论上有无限种 $c_1, c_2$ 可选，取决于 $\alpha_1, \alpha_2$ 的取值。

如果取 $\alpha_1 = \alpha_2 = 0.05$ 那么 $c_1, c_2$ 对称

$c_1 = 0.15 - c$

$c_2 = 0.15 + c$

解方程 $\Phi[5(0.05 - c)] + \Phi[-5(0.05 + c)] = 0.05$

```
from scipy import optimize
from scipy.stats import norm

rv = norm()

def f(c):
    return rv.cdf(5 * (0.05 - c)) \
        + rv.cdf(-5 * (0.05 + c))

def g(c):
    return f(c) - 0.05

optimize.newton(g, 0.4)
```

先对 $g(c)$ 作图，看到 $g(c) = 0$ 大概在 0.4 附近，初始猜测 0.4，牛顿法会迭代计算最接近的 $c = 0.4039$。

$\delta_1$：如果 $\overline{X}_n \le -0.2539$ 或 $\overline{X}_n \ge 0.5539$ 拒绝 $H_0$

----

如果 $\alpha_1 = 0.02, \alpha_2 = 0.05$ 显著性等级也是 $0.05$，算起来麻烦点，解方程组

$$
\begin{cases}
\Phi[5(c_1 - 0.1)] + \Phi[- 5(c_2 - 0.1)] = 0.02 \\
\Phi[5(c_1 - 0.2)] + \Phi[- 5(c_2 - 0.2)] = 0.05
\end{cases}
$$

方程①变换得到 $c_2 = 0.1 - 0.2 * \Phi^{-1}[0.02-\Phi(5(c_1 - 0.1))]$ 代入方程②解 $c_1$

```
from scipy import optimize
from scipy.stats import norm

rv = norm()

def _c2(c1):
    return 0.1 - 0.2 * \
        rv.ppf(0.02 - rv.cdf(5 * (c1 - 0.1)))

def f(c1):
    c2 = _c2(c1)
    return rv.cdf(5 * (c1 - 0.2)) \
        + rv.cdf(-5 * (c2 - 0.2))

def g(c1):
    return f(c1) - 0.05

c1 = optimize.newton(g, -0.5)
print([c1, _c2(c1)])
```

用牛顿法解出 $c_1 = -0.4245$, $c_2=0.5307$

$\delta_2$：如果 $\overline{X}_n \le -0.4245$ 或 $\overline{X}_n \ge 0.5307$ 拒绝 $H_0$

最后把 $\delta_1$, $\delta_2$ 都画在图上

```
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

sigma_n = 0.2
mu = np.linspace(-1, 1, 400)

def f1(mu):
    c1, c2 = [-0.2539, 0.5539]
    rv = norm(loc=mu, scale=sigma_n)
    return rv.cdf(c1) + 1 - rv.cdf(c2)

def f2(mu):
    c1, c2 = [-0.4245, 0.5307]
    rv = norm(loc=mu, scale=sigma_n)
    return rv.cdf(c1) + 1 - rv.cdf(c2)

y1 = f1(mu)
y2 = f2(mu)
plt.plot(mu, y1, label='δ1')
plt.plot(mu, y2, label='δ2')
plt.axvline(x=0.1, linestyle=':', label='μ = 0.1')
plt.axvline(x=0.2, linestyle=':', label='μ = 0.2')
plt.axhline(y=0.05, color='y', linestyle=':', label='α0 = 0.05')
plt.legend()
plt.show()
```

![](https://files.mdnice.com/user/18103/01c3c1ff-d5b0-4410-ab41-8483143708b2.png)

可以看到 $\delta_1$ 比较板正，$\delta_2$ 有一点点歪，导致有少量 $\Omega_1$ 范围内 $\pi(\mu|\delta)$ 比 $\Omega_0$ 还小。

封面图：Twitter 心臓弱眞君 @xinzoruo