# 《概率统计》 day 38

今天是读《概率统计》的逻辑第 38 天，学习一种特殊的假设检验。

这种假设检验 $H_0$ 只有一个值，$H_1$ 也只有一个值。

上一节定义了 power function $\alpha(\delta)$，这节多一个 $\beta(\delta)$

$$α(δ) = P(\text{Rejecting} \ H_0|θ = θ_0)$$
$$β(δ) = P(\text{Not Rejecting} H_0|θ = θ_1)$$

这两个叫 type I error 和 type II error，不过中文语境叫假阳性和假阴性多一点。反正都尽量小

这节提供一个方法，在 $H_0$, $H_1$ 都只有一个值的前提下，找到最小化 $α(δ) β(δ)$ 的检验 $\delta$

有两形式，一种是选两个参数 a,b 找到 $\delta$ 让 $aα(δ) + bβ(δ)$ 最小，另一种是 $α(δ) = \alpha_0$ 固定，找到 $\delta$ 让 $\beta(\delta)$ 最小，但用下来感觉差不多

对于第一种形式，根据定义

$$
\begin{aligned}
a \alpha(\delta) + b \beta(\delta) &= a \sum_{\vec{x} \in S_1}f_0(\vec{x}) + b \sum_{\vec{x} \in S_0} f_1(\vec{x}) \\
&= a \sum_{\vec{x} \in S_1}f_0(\vec{x}) + b [1 - \sum_{\vec{x} \in S_1} f_1(\vec{x})] \\
&= b + \sum_{\vec{x} \in S_1} [af_0(\vec{x}) - bf_1(\vec{x})]
\end{aligned}
$$

$a \alpha(\delta) + b \beta(\delta)$ 最小就把所有 $af_0(\vec{x}) - bf_1(\vec{x})$ 为负的 $\vec{x}$ 算进 $S_1$

检验 $\delta$ 构建为：如果 $af_0(\vec{x}) - bf_1(\vec{x}) \lt 0$ 拒绝 $H_0$

如果选取的 a, b 都大于零，整理下调整为

$\delta$：如果 $f_1(\vec{x})/f_0(\vec{x}) > a/b$ 拒绝 $H_0$

有点抽象，假设有两个正态分布

$$
H_0: \mu = 0, \sigma = 1\\
H_1: \mu = 1, \sigma = 1
$$

寻找 $\delta$ 让 $\alpha(\delta) + \beta(\delta)$ 最小

a = b = 1

$$
\begin{aligned}
\frac{f_1(\vec{x})}{f_0(\vec{x})} &= \frac{1/\sqrt{2\pi} * exp[- 1/2 \sum_{i=1}^{n}(x_i - 1)^2]}{1/\sqrt{2\pi} * exp(- 1/2 \sum_{i=1}^{n}x_i^2)} \\
&= exp\{-1/2 \sum_{i=1}^{n}[(x_i - 1)^2 - x_i^2]\} \\
&= exp [n(\overline{x}_n - 1/2)] > 1
\end{aligned}
$$

$\delta$：if $\overline{X}_n \gt 1/2$ 拒绝 $H_0$

$\alpha(\delta) = P(\overline{X}_n \gt 1/2|H_0) = P(\sqrt{n}\overline{X}_n \gt 1/2\sqrt{n}) = 1 - \Phi(\sqrt{n}/2)$

$\beta(\delta) = P(\overline{X}_n \le 1/2|H_1) = P(\sqrt{n}(\overline{X}_n - 1) \le -\sqrt{n} / 2) = \Phi(-\sqrt{n}/2)$

当 n = 9 $\alpha(\delta) = 0.0668$, $\beta(\delta) = 0.0668$, $\alpha(\delta) + \beta(\delta)=0.1336$

随便想个 $\delta_1$ 挑战一下：if $\overline{X}_n \gt 1$ 拒绝 $H_0$

$\alpha(\delta_1) = 0.0013$, $\beta(\delta_1) = 0.5$

$\alpha(\delta) + \beta(\delta)=0.5013$

$\alpha(\delta_1)$ 小了很多，但 $\beta(\delta_1)$ 大了更多，加起来输了，看来 $\delta$ 还是有两把刷子的

**第二种形式**

和第一种很类似，无非是 a 固定是 1

要求 $\alpha(\delta) \le 0.05$ 寻找 $\delta$ 最小化 $\beta(\delta)$

根据前面的计算 $f_1(\vec{x})/f_0(\vec{x}) = exp [n(\overline{x}_n - 1/2)] > 1/b$

当 $\overline{x}_n \gt 1/2 + 1/n log(1/b)$ 拒绝 $H_0$，右半截用 $k'$ 表示

$\alpha(\delta) = P(\overline{X}_n \gt k'|H_0) \le 0.05$

解出 $k'=0.5483$

$\beta(\delta) = P(\overline{X}_n \le 0.5483|H_1) = P(\sqrt{n}(\overline{X}_n - 1) \le \sqrt{n}(0.5483 - 1))=0.0877$

封面图：Twitter 心臓弱眞君 @xinzoruo