# 《概率统计》 day 45

今天是读《概率统计》的逻辑第 45 天，学习 Test of Goodness-of-Fit，有点像多项分布。

它描述总体由 k 种不同类型组成，每种类型的概率 $\vec{p} = (p_1, ..., p_k)$。

一次随机采样，各类型计数 $N_1, ..., N_k$，判断 $H_0: \vec{p} = (p_1^0, ..., p_k^0)$

$\delta$：如果 $Q \ge c$ 拒绝 $H_0$。

统计

$$
Q = \sum_{i=1}^k \frac{(N_i - np_i^0)^2}{np_i^0}
$$

当 n -> ∞ 是自由度 k - 1 的 $\chi^2$ 分布。

这种场景还蛮常见的，比如判断服务 95% 可用，4% 错误，1% 未响应。

调用 531 次

||数量|概率|np<sub>i</sub><sup>0</sup>|
|--|--|--|--|
|正确|512|95%|504.45|
|错误|18|4%|21.24|
|未响应|1|1%|5.31|

$$
\begin{aligned}
q &= \frac{(512-504.45)^2}{504.45} + \frac{(18-21.24)^2}{21.24} + \frac{(1-5.31)^2}{5.31} \\
&= 4.1
\end{aligned}
$$

自由度 2，$P(Q \ge 4.1) = 0.1284$，$\alpha_0 \gt 0.1284$ 的 $\delta$ 拒绝 $H_0$。

它还有种怪用法，检验连续分布，先把连续分布分成几个区间，原则上每个区间概率近似且不能太小。

五等分的标准正态分布

|区间|概率|
|--|--|
|(-∞, -0.8416]|0.2|
|(-0.8416, -0.2533]|0.2|
|(-0.2533, 0.2533]|0.2|
|(0.2533, 0.8416]|0.2|
|(0.8416, ∞)|0.2|

也可以间隔相同

|区间|概率|
|--|--|
|(-∞, -0.75]|0.2266|
|(-0.75, -0.25]|0.1747|
|(-0.25, 0.25]|0.1974|
|(0.25, 0.75]|0.1747|
|(0.75, ∞)|0.2266|

然后就一样了，汇总每个区间的个数，计算 Q。

只是都知道是正态分布，直接用 t test 不好么，还特意拆成小区间，有点脱裤子放屁的感觉。

进阶一点 $p_i$ 不是常量而是函数，比如

$p_1 = \theta^2, p2= 2 \theta(1-\theta), p_3 = (1-\theta)^2$

首先用 $\pi_i(\vec{\theta})$ 表示概率，s 表示 $\vec{\theta}$ 的维度

$\pi_i(\theta)$，s = 1

$\pi_i(\mu, \sigma^2)$，s = 2

似然函数

$$
L(\theta) = \binom{n}{N_1, ..., N_k} \prod_{i=1}^{k} [\pi_i(\theta)]^{N_i}
$$

$\hat{\theta}$ 是 $L(\theta)$ 的 MLE。

统计

$$
Q = \sum_{i=1}^k \frac{[N_i - n\pi_i(\hat{\theta})]^2}{n\pi_i(\hat{\theta})}
$$

是自由度 k - 1 - s 的 $\chi^2$ 分布。

上面这个例子经过取对数、求导，还算容易

$$
\frac{\partial log L(\theta)}{\partial \theta} = \frac{2N_1 + N_2}{\theta} - \frac{2N_3 + N_2}{1-\theta}
$$

解出 $\hat{\theta} = (2N_1 + N_2) / 2n$。

正态分布那种就没那么容易了，这时候退而求其次，使用分布本身的 MLE

$$
Q' = \sum_{i=1}^k \frac{(N_i - n\pi_i(\hat{\theta}))^2}{n\pi_i(\hat{\theta})}
$$

当 n -> ∞ 介于 k - 1 - s 和 k - 1 的之间。

一组 500 人的身高数据，样本均数 67.6，样本方差 1

正态分布的 MLE $\hat{\mu} = \overline{X} = 67.6$，$\hat{\sigma^2} = S_n/n = 1$

$\pi_i(\hat{\mu}, \hat{\sigma^2}) = P(a_i \lt X \le b_i) = \Phi[(b_i - \hat{\mu})/\hat{\sigma}] - \Phi[(a_i - \hat{\mu})/\hat{\sigma}]$

|身高|数量|概率|
|--|--|--|
|＜ 66|18|0.0548|
|66 ~ 67.5|177|0.4054|
|67.5 ~ 68.5|198|0.3558|
|68.5 ~ 70|102|0.1758|
|＞ 70|5|0.0082|

$q' = 11.2$

$0.0037 \lt P(Q' \ge 11.2) \lt 0.0244$ 介于自由度 2 和 4 之间。

封面图：Twitter 心臓弱眞君 @xinzoruo