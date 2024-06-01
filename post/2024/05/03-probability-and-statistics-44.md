# 《概率统计》 day 44

今天是读《概率统计》的逻辑第 44 天，学习 Bayes Test Procedures，用贝叶斯定理的角度重新看一遍假设检验。

有贝叶斯肯定就有先验、后验，$\xi(\theta)$ 代表先验，$\xi(\theta|\vec{x})$ 代表后验，可以用[共轭先验](day34)简化后验的计算。

定义损失函数 $L(\theta, d_i)$

||d<sub>0</sub>|d<sub>1</sub>|
|--|--|--|
|H<sub>0</sub> true|0               |w<sub>0</sub>  |
|H<sub>1</sub> true|w<sub>1</sub>   |0              |

即当 $H_0 = true$ 或者说 $\theta \in \Omega_0$，此时 $d_0$（不拒绝 $H_0$）无损失，$d_1$（拒绝 $H_0$）损失 $w_0$，$w_0$ 既可以是常量也可以是函数，$H_1$ 同理。

<!-- 最简单的假设 $H_0: \theta = \theta_0$ vs $H_1: \theta = \theta_1$

$E(Loss|\theta = \theta_0) = w_0 P(d_1|\theta = \theta_0) = w_0 \alpha(\delta)$

$E(Loss|\theta = \theta_1) = w_1 P(d_0|\theta = \theta_1) = w_1 \beta(\delta)$

损失期望 $r(\delta) = \xi_0 w_0 \alpha(\delta) + \xi_1 w_1 \beta(\delta)$

损失期望 $r(\delta)$ 最小的 $\delta$ 叫做 Bayes test procedure。

根据 Nayman-Pearson lemma 很容易找到 $\delta$

$$
f_1(\vec{x})/f_0(\vec{x}) \ge \xi_0 w_0 / \xi_1 w_1
$$

比较好奇为什么这里用的是先验，不应该用后验。 -->

损失的期望表示为

$$
r(d_i|\vec{x}) = \int L(\theta, d_i) \xi(\theta|\vec{x}) d \theta
$$

$$
r(d_0|\vec{x}) = \int_{\Omega_1} L(\theta, d_0) \xi(\theta|\vec{x})d \theta = w_1 [1 - P(H_0 = true|\vec{x})]
$$

$$
r(d_1|\vec{x}) = \int_{\Omega_0} L(\theta, d_1) \xi(\theta|\vec{x})d \theta = w_0 P(H_0 = true|\vec{x})
$$

$\delta$: 如果 $r(d_0|\vec{x}) \ge r(d_1|\vec{x})$ 拒绝 $H_0$

$$
P(H_0 = true|\vec{x}) \le \frac{w_1}{w_0 + w_1}
$$

检验 $\delta$ 可以看做，如果 $H_0$ 的后验概率不大于 $w_1/(w_0 + w_1)$ 拒绝 $H_0$

这个描述比前面的假设检验更直观，之前的都是些什么抽象玩意儿。

对于 t test

还是那家号称 $H_0: \mu \le 1.2$ 的奶酪店，十个样本

0.86, 1.53, 1.57, 1.81, 0.99, 1.09, 1.29, 1.78, 1.29, 1.58

根据 improper prior（$\mu_0 = \lambda_0 = \beta_0 = 0, \alpha_0 = -1/2$） 计算后验分布

$\mu_1 = \overline{x} = 1.379$

$\lambda_1 = n = 10$

$\alpha_1 = (n - 1) / 2 = 4.5$

$\beta_1 = s_n^2 / 2 = 0.4831$

$$U = (\frac{\lambda_1\alpha_1}{\beta_1})^{1/2}(\mu - \mu_1) = (\frac{n(n-1)/2}{s_n^2/2})^{1/2}(\mu - \overline{x}) = \frac{\sqrt{n}(\mu - \overline{x})}{\sigma'}$$

是自由度 $2\alpha_1 = 9$ 的 t 分布

$$
P(\mu \le 1.2|\vec{x}) = P(u \le \frac{\sqrt{n}(1.2 - \overline{x})}{\sigma'}|\vec{x})
$$

碎碎念

最近把夜跑改成晨跑。之前隐约感到夜跑似乎会加重失眠，看完《绝佳时间》更加确信了，但不知道是不是错觉，调整之后，感觉失眠改善了很多。

不仅如此，感觉今年有望完成 10km，想着我这台积灰了三十多年的老爷车，也能完成 10km 想想还有点小激动。

封面图：Twitter 心臓弱眞君 @xinzoruo