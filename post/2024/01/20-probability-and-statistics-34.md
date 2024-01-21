# 《概率统计》 day 34

今天是读《概率统计》的逻辑第 34 天，学习用贝叶斯分析正态分布。

根据之前的知识，贝叶斯就是假设一个先验，然后观察一系列样本，再计算后验的过程，这次也不例外，只是过程复杂了亿点点。

首先对正态分布的定义做了调整，不用方差，改用它的倒数 $\tau = 1/\sigma^2$ 叫做 precision，概率密度函数跟着调整为

$$
f(x|\mu, \tau) = (\frac{\tau}{2\pi})^{1/2}exp[-\frac{\tau}{2}(x-\mu)^2]
$$

现在假设先验 $\mu|\tau$ 是 $(\mu_0, \lambda_0\tau)$ 的正态分布，$\tau$ 是 $(\alpha_0, \beta_0)$ 的伽马分布，观察一组随机样本 $\vec{X}$，计算后验分布。

计算之前先做点准备工作

1 用 $\propto$ 符号表示同比例的函数，舍弃常量简化函数，两个先验可以表示为

$\xi(\mu|\tau) \propto \tau^{1/2}exp[-\frac{\lambda_0\tau}{2}(\mu-\mu_0)^2]$

$\xi(\tau) \propto \tau^{\alpha_0-1}exp(-\beta_0\tau)$

2 两个特殊符号

$\overline{x}_n = \frac{1}{n}\sum x_i$

$s_n^2 = \sum (x_i - \overline{x}_n)^2$

3 随机样本 $\vec{x}$ 联合概率密度函数

$$
f_n(\vec{x}|\mu, \tau) = (\frac{\tau}{2\pi})^{n/2}exp[-\frac{\tau}{2}\sum_{i=1}^{n}(x_i-\mu)^2]
$$

4 一个关于 $\mu, \overline{x}_n, s_n^2$ 的恒等式

$$
\begin{aligned}
\sum(x_i-\mu)^2 - \sum(x_i - \overline{x}_n)^2 &= \sum(\mu^2 - 2x_i\mu + 2x_i\overline{x}_n - \overline{x}_n^2) \\
&= n\mu^2 -2\mu\sum x_i + 2\overline{x}_n\sum x_i -n\overline{x}_n^2 \\
&= n(\mu - \overline{x}_n)^2
\end{aligned}
$$

5 另一个恒等式 completing the square，翻译过来叫配方法，皮囊虽然不同，灵魂是一致的，初中解一元二次方程用它的简化形式。

$$
\begin{aligned}
\sum a_i(x-b_i)^2 + cx &= (\sum a_i)(x - \frac{\sum a_ib_i - c / 2}{\sum a_i})^2 \\
&+ \sum a_i(b_i - \frac{\sum a_ib_i}{\sum a_i})^2 \\
&+ (\sum a_i)^{-1}[c \sum a_ib_i - c^2/4]
\end{aligned}
$$

根据假设贝叶斯定理

$$
\xi(\mu, \tau|\vec{x}) = \frac{f_n(\vec{x}|\mu, \tau)\xi(\mu, \tau)}{\int f_n(\vec{x}|\mu, \tau)\xi(\mu, \tau) d\mu d\tau}
$$

分母是个常量，用 $\propto$ 表示的话可以省去，带入函数

$$
\xi(\mu, \tau|\vec{x}) \propto \{\tau^{1/2} exp[-\frac{\tau}{2}(\sum_{i=n}^n(x_i - \mu)^2 + \lambda_0(\mu - \mu_0)^2)]\}(\tau^{n/2 + \alpha_0 - 1}e^{ - \beta_0\tau})
$$

中间 exp 圆括号这段根据恒等式改写为

$$
n(\mu - \overline{x}_n)^2 + \lambda_0(\mu - \mu_0)^2 + s_n^2
$$

再用配方法改写为

$$
(\lambda_0 + n)(\mu - \mu_1)^2 + n(\overline{x}_n - \mu_1)^2 + \lambda_0(\mu_0 - \mu_1)^2 + s_n^2
$$

这里的

$$
\mu_1 = \frac{\sum a_ib_i}{\sum a_i} = \frac{n\overline{x}_n + \lambda_0\mu_0}{n + \lambda_0}
$$

再算出剩余的项

$\overline{x}_n - \mu_1 = [\lambda_0(\overline{x}_n - \mu_0)] / (\lambda_0 + n)$

$\mu_0 - \mu_1 = [n(\mu_0 - \overline{x}_n)]/(\lambda_0 + n)$

最后得到

$$
\sum_{i=n}^n(x_i - \mu)^2 + \lambda_0(\mu - \mu_0)^2 = (\lambda_0 + n)(\mu - \mu_1)^2 + \frac{n\lambda_0(\overline{x}_n - \mu_0)^2}{\lambda_0 + n} + s_n^2
$$

把后两项扔到 exp 外面和 $-\beta_0\tau$ 凑一起，整理得到

$$
\xi(\mu, \tau|\vec{x}) \propto \{\tau^{1/2}exp[-\frac{\tau}{2}\lambda_1(\mu - \mu_1)^2]\} (\tau^{\alpha_1 - 1} e^{-\beta_1\tau})
$$

形式和先验一样，共轭分布，后验的超参数计算简化为

$\lambda_1 = \lambda_0 + n$

$\mu_1 = (n\overline{x}_n + \lambda_0\mu_0) / (\lambda_0 + n)$

$\alpha_1 = \alpha_0 + n/2$

$\beta_1 = \beta_0 + s_n^2 / 2 + \frac{n\lambda_0(\overline{x}_n-\mu_0)^2}{2(\lambda_0 + n)}$

第一个发现这玩意儿的人到底咋想的，这么复杂都能凑出来。

到这里 $\mu$ 还是给定 $\tau$ 条件分布，它的边缘分布

$$U = (\frac{\lambda_0\alpha_0}{\beta_0})^{1/2}(\mu - \mu_0)$$

是 $2\alpha_0$ 的 t 分布，证明过程看不懂，不妨碍使用，问题不大。

$$
P(\mu_0 - c(\frac{\beta_0}{\lambda_0\alpha_0})^{1/2} \lt \mu \lt \mu_0 + c(\frac{\beta_0}{\lambda_0\alpha_0})^{1/2}) = P(|U| < c) = \gamma
$$

如果先验超参数选择

$\mu_0 = \lambda_0 = \beta_0 = 0, \alpha_0 = -1/2$

那么后验超参数

$\mu_1 = \overline{x}_n, \lambda_1 = n, \alpha_1 = (n - 1) / 2, \beta_1 = s_n^2 / 2$

这时候概率为 $\gamma$ 的 $\mu$ 区间是

$$
\overline{x}_n - c(\frac{s_n^2}{n(n-1)})^{1/2} \lt \mu \lt \overline{x}_n + c(\frac{s_n^2}{n(n-1)})^{1/2}
$$

这个结果用 $\sigma' = (\frac{s_n^2}{n-1})^{1/2}$ 代入，结果和上一节的置信区间一模一样。上一节说 (a, b) 是 (A, B) 的一个取值，不能认为 $\mu$ 落在 (a, b) 的概率是 $\gamma$，这节用贝叶斯，特殊先验下，可以说 $\mu$ 落在 (a, b) 的概率是 $\gamma$，这可真是神奇。

封面图：Twitter 心臓弱眞君 @xinzoruo