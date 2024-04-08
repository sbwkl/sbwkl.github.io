# 《概率统计》 day 38

今天是读《概率统计》的逻辑第 38 天，学习一种特殊的假设检验，它的 $H_0$ 只有一个值，$H_1$ 也只有一个值。

理想状态下 $\theta \in \Omega_0$, $\pi(\theta|\delta) = 0$，但现实不是理想。

定义两种误差 type I error 和 type II error，中文应该叫假阳性和假阴性，尽量小就对了。

$$α(δ) = P(\text{Rejecting} \ H_0|θ = θ_0)$$
$$β(δ) = P(\text{Not Rejecting} H_0|θ = θ_1)$$

这节提供一个方法，寻找最小化 $α(δ), β(δ)$ 的检验 $\delta$

有两种形式

1. 选两个参数 a,b 让 $aα(δ) + bβ(δ)$ 最小
2. $α(δ) \le \alpha_0$ 固定，让 $\beta(\delta)$ 最小

用下来感觉差不多

**第一种形式**

$$
\begin{aligned}
a \alpha(\delta) + b \beta(\delta) &= a \sum_{\vec{x} \in S_1}f_0(\vec{x}) + b \sum_{\vec{x} \in S_0} f_1(\vec{x}) \\
&= a \sum_{\vec{x} \in S_1}f_0(\vec{x}) + b [1 - \sum_{\vec{x} \in S_1} f_1(\vec{x})] \\
&= b + \sum_{\vec{x} \in S_1} [af_0(\vec{x}) - bf_1(\vec{x})]
\end{aligned}
$$

只要把所有 $af_0(\vec{x}) - bf_1(\vec{x})$ 为负的 $\vec{x}$ 都划进 $S_1$，那么 $a \alpha(\delta) + b \beta(\delta)$ 肯定最小。

检验 $\delta$：如果 $af_0(\vec{x}) - bf_1(\vec{x}) \lt 0$ 拒绝 $H_0$

要是 a, b 都大于零，还能调整为

$\delta$：如果 $f_1(\vec{x})/f_0(\vec{x}) > a/b$ 拒绝 $H_0$

有点抽象，直接上例子更有感觉，随机样本 $\vec{X}$ 是正态分布，有两种可能

$$
H_0: \mu = 0, \sigma = 1\\
H_1: \mu = 1, \sigma = 1
$$

现在需要一种测试方法，让 $\alpha(\delta) + \beta(\delta)$ 最小。

这里 $a = b = 1$

<!-- 寻找 $\delta$ 让 ， -->

$$
\begin{aligned}
\frac{f_1(\vec{x})}{f_0(\vec{x})} &= \frac{1/\sqrt{2\pi} * exp[- 1/2 \sum_{i=1}^{n}(x_i - 1)^2]}{1/\sqrt{2\pi} * exp(- 1/2 \sum_{i=1}^{n}x_i^2)} \\
&= exp\{-1/2 \sum_{i=1}^{n}[(x_i - 1)^2 - x_i^2]\} \\
&= exp [n(\overline{x}_n - 1/2)] > 1
\end{aligned}
$$

$\delta$：如果 $\overline{X}_n \gt 1/2$ 拒绝 $H_0$。

$\alpha(\delta) = P(\overline{X}_n \gt 1/2|H_0) = P(\sqrt{n}\overline{X}_n \gt 1/2\sqrt{n}) = 1 - \Phi(\sqrt{n}/2)$

$\beta(\delta) = P(\overline{X}_n \le 1/2|H_1) = P(\sqrt{n}(\overline{X}_n - 1) \le -\sqrt{n} / 2) = \Phi(-\sqrt{n}/2)$

当样本数 $n = 9$, $\alpha(\delta) = 0.0668$, $\beta(\delta) = 0.0668$, $\alpha(\delta) + \beta(\delta)=0.1336$

随便想个 $\delta_1$ 挑战一下：如果 $\overline{X}_n \gt 0.6$ 拒绝 $H_0$

$\alpha(\delta_1) = 0.0359$, $\beta(\delta_1) = 0.1151$, $\alpha(\delta) + \beta(\delta)=0.1510$

$\alpha(\delta_1)$ 是小了，但 $\beta(\delta_1)$ 大了不少。

**第二种形式**

要求 $\alpha(\delta) \le 0.05$ 寻找 $\delta$ 最小化 $\beta(\delta)$

计算过程和第一种非常类似，无非是 a 固定是 1

$f_1(\vec{x})/f_0(\vec{x}) = exp [n(\overline{x}_n - 1/2)] > 1/b$ 得到 $\overline{x}_n \gt 1/2 + (1/n)log(1/b)$

$\alpha(\delta) = P(\overline{X}_n \gt k'|H_0) \le 0.05$ 解出 $k'=0.5483$

$\delta$：如果 $\overline{X}_n \gt 0.5483$ 拒绝 $H_0$

$\beta(\delta) = P(\overline{X}_n \le 0.5483|H_1) = P(\sqrt{n}(\overline{X}_n - 1) \le \sqrt{n}(0.5483 - 1))=0.0877$

$0.05 + 0.0877 = 0.1377$ 比第一种略微大一点。

第二种形式 $f_1(\vec{x})/f_0(\vec{x})$ 这个东西最大的作用就是确定 $\overline{x}_n$ 后面接大于号还是小于号。为什么这么说，有道练习题看岔参数，错的一塌糊涂，唯独符号对了，你猜怎么着，结果居然算对了。

封面图：Twitter 心臓弱眞君 @xinzoruo