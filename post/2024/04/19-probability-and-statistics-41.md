# 《概率统计》 day 41

今天是读《概率统计》的逻辑第 41 天，学习 t Test，光听名字就能猜到它和 t 分布有关。

回顾 t 分布，推理期望和方差都未知的正态分布

$$
U = \frac{\sqrt{n}(\overline{X}_n - \mu)}{\sigma'}
$$

$$
S_n^2 = \sum_{i=1}^n (x_i - \overline{x}_n)^2
$$

$$
\sigma' = \sqrt{\frac{S_n^2}{n-1}}
$$

$\overline{X}_n$ 是 $(\mu, \sigma/\sqrt{n})$ 的正态分布

$\sum_{i=1}^n (X_i − \overline{X}_n)^2/σ^2$ 是 n - 1 的 $\chi^2$ 分布

t test

$$
H_0: \mu \le \mu_0
$$
$$
H_1: \mu \gt \mu_0
$$

$\delta$：如果 $U \ge c$ 拒绝 $H_0$

举个例子，商家打广告号称他家的奶酪乳酸浓度不高于 1.2，有杠精觉得商家吹牛，哪能这么低，于是买了他家的奶酪，测量 10 个不同部位的乳酸浓度，得到一组数据

0.86, 1.53, 1.57, 1.81, 0.99, 1.09, 1.29, 1.78, 1.29, 1.58

$$
H_0: \mu \le 1.2
$$
$$
H_1: \mu \gt 1.2
$$

假设乳酸浓度符合正态分布，每次测量互相独立，那么 U 是自由度 9 的 t 分布。

显著性水平 $\alpha_0 = 0.05$ 得到 $c = T_{9}^{-1}(1 - 0.05) = 1.8331$

$\delta$：如果 $U \ge 1.8331$ 拒绝 $H_0$

根据样本数据，计算得出

$$
u = \frac{\sqrt{n}(\overline{x}_n - \mu_0)}{\sigma'} = 1.7275
$$

好可惜，以目前的数据不能拒绝 $H_0$

p 值 = $P(U \ge 1.7275) = 1 - T_9(1.7275) = 0.0591$

学到了，以前只会简单算个平均数，搁那比大小。

当 $\mu \ne \mu_0$

U 不再是 t 分布，而是叫做 noncentral t Distributions。

它的定义

$$
X = \frac{W}{(\frac{Y}{m})^{1/2}}
$$

W 是 $(\psi, 1)$ 的正态分布，Y 是自由度 m 的 $\chi^2$ 分布

刚好 U 可以改写为

$$
U = \frac{\sqrt{n}(\overline{X}_n - \mu_0)}{\sigma'} = \frac{\sqrt{n}(\overline{X}_n - \mu_0)/\sigma}{\sigma'/\sigma} = \frac{\sqrt{n}(\overline{X}_n - \mu_0)/\sigma}{(\frac{S_n^2/\sigma^2}{n-1})^{1/2}}
$$

$\sqrt{n}(\overline{X}_n - \mu_0)/\sigma$ 是 $(\sqrt{n}(\mu - \mu_0)/\sigma, 1)$ 的正态分布

$S_n^2/\sigma^2$ 是自由度 n - 1 的 $\chi^2$ 分布

所以 t 分布其实是 $\psi=0$ 的 noncentral t 分布对么。

我本以为 noncentral t 分布是对称轴左右移动的 t 分布，画出来之后发现不对，都歪了

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import nct

n, psi = 5, 5
x = np.linspace(-5, 15, 100)

def f1(x, n, nc):
    return nct(df=n, nc=nc).pdf(x)

plt.plot(x, f1(x, n, psi), label=f'n = {n}, ψ = {psi}')

plt.legend()
plt.show()
```

![](https://files.mdnice.com/user/18103/3955203a-81b6-4612-9fde-89821758fbe5.png)

如果 $H_0: \mu_0 = 1.2$ 是这种假设，

最后搜了下 python 直接有包计算 t test，只要输入样本数据即可，这可太方便了。

```python
from scipy.stats import ttest_1samp

mu0 = 1.2
x = [0.86, 1.53, 1.57, 1.81, 0.99,\
     1.09, 1.29, 1.78, 1.29, 1.58]

ttest_1samp(x, mu0, alternative='greater')
```

封面图：Twitter 心臓弱眞君 @xinzoruo