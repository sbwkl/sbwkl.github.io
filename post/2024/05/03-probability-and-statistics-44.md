# 《概率统计》 day 44

今天是读《概率统计》的逻辑第 44 天，学习 Bayes Test Procedures，用贝叶斯定理的视角重新看一遍假设检验。

有贝叶斯肯定就有先验、后验、损失函数啥的。$\xi(\theta)$ 代表先验，$\xi(\theta|\vec{x})$ 代表后验，[共轭先验](https://mp.weixin.qq.com/s?__biz=MzIxNDE0MzE5MQ==&mid=2247486528&idx=1&sn=74b7b90b1989fb1c0088ba1de5cecef1&chksm=97ad55f8a0dadcee3334d36d9637b7a23e1ab45cf36b6dafaea6d96cf95b8d13aad0f5dccd9a&token=1586939312&lang=zh_CN#rd)简化后验计算。

定义损失函数 $L(\theta, d_i)$

||d<sub>0</sub>|d<sub>1</sub>|
|--|--|--|
|H<sub>0</sub> true|0               |w<sub>0</sub>  |
|H<sub>1</sub> true|w<sub>1</sub>   |0              |

即当 $H_0 = true$ 或者说 $\theta \in \Omega_0$，此时 $d_0$（不拒绝 $H_0$）无损失，$d_1$（拒绝 $H_0$）损失 $w_0$，$w_0$ 既可以是常量也可以是函数，$H_1$ 同理。

$d_0, d_1$ 损失的期望表示为

$$
\begin{aligned}
r(d_0|\vec{x}) &= \int_{\Omega_1} L(\theta, d_0) \xi(\theta|\vec{x})d \theta \\
&= w_1 [1 - P(H_0 = true|\vec{x})]
\end{aligned}
$$

$$
\begin{aligned}
r(d_1|\vec{x}) &= \int_{\Omega_0} L(\theta, d_1) \xi(\theta|\vec{x})d \theta \\
&= w_0 P(H_0 = true|\vec{x})
\end{aligned}
$$

贝叶斯倾向损失期望小的选项，所以如果 $r(d_0|\vec{x}) \lt r(d_1|\vec{x})$ 那么选 $d_0$，如果 $r(d_0|\vec{x}) \gt r(d_1|\vec{x})$ 那么选 $d_1$。

反过来说 $\delta$ 可以描述为: 如果 $r(d_0|\vec{x}) \ge r(d_1|\vec{x})$ 拒绝 $H_0$。

简化后

$$
P(H_0 = true|\vec{x}) \le \frac{w_1}{w_0 + w_1}
$$

可以看做 $H_0$ 为真的后验概率不大于 $w_1/(w_0 + w_1)$ 拒绝 $H_0$，这个描述比前面的假设检验直观多了。

对于 t test

还是那家号称 $H_0: \mu \le 1.2$ 的奶酪店，使用 improper prior

$\mu_0 = \lambda_0 = \beta_0 = 0, \alpha_0 = -1/2$

计算后验分布

$\mu_1 = \overline{x}$

$\lambda_1 = n$

$\alpha_1 = (n - 1) / 2$

$\beta_1 = s_n^2 / 2$

$$
\begin{aligned}
T &= (\frac{\lambda_1\alpha_1}{\beta_1})^{1/2}(\mu - \mu_1) \\
&= (\frac{n(n-1)/2}{s_n^2/2})^{1/2}(\mu - \overline{x}) \\
&= \frac{\sqrt{n}(\mu - \overline{x})}{\sigma'}
\end{aligned}
$$

是自由度 $2\alpha_1 = n - 1$ 的 t 分布

$$
\begin{aligned}
P(\mu \le 1.2|\vec{x}) &= P(t \le \frac{\sqrt{n}(1.2 - \overline{x})}{\sigma'}|\vec{x}) \\
&= P(t \le -u|\vec{x})
\end{aligned}
$$

这个 u 就是之前 t test 的那个 u，让 $\alpha_0 = w_1 / (w_0 + w_1)$

$P(t \le -u|\vec{x}) \le \alpha_0$

$T(-u) \le \alpha_0$

$-u \le T^{-1}(\alpha_0)$

$u \ge T^{-1}(1 - \alpha_0)$

结论和 t test 一模一样。

对于两个正态分布的 t test，使用 improper prior

$\xi(\mu_1, \mu_2, \tau) = 1/\tau$

$$
T = (m + n -2)^{1/2}\frac{(\mu_1 - \mu_2) - (\overline{x} - \overline{y})}{(1/m + 1/n)^{1/2}(s_x^2 + s_y^2)^{1/2}}
$$

的后验分布是自由度 m + n - 2 的 t 分布，这个证明过程在 9.8 节练习 8，感兴趣的可以翻翻，很长。

假设 $H_0: \mu_1 - \mu_2 \le 0$ vs $H_1: \mu_1 - \mu_2 \gt 0$

$$
P(\mu_1 - \mu_2 \le 0| \vec{x}, \vec{y}) = P(T \le -u)
$$

结论也一致。

贝叶斯视角似乎让 $\alpha_0$ 不再是单纯的数字，而是更有意义的 $w_0$ 和 $w_1$，不同的场景可以设计不同的损失函数。

**碎碎念**

最近把夜跑改成晨跑，之前隐约感到夜跑似乎会加重失眠，看完《绝佳时间》更加确信了。但不知道是不是错觉，感觉效果好的可怕，应该是心理作用吧。

不仅如此，早上状态更好，今年有望跑完 10km，积灰了三十多年的老爷车，居然还能跑起来，想想还有点小激动。

封面图：Twitter 心臓弱眞君 @xinzoruo