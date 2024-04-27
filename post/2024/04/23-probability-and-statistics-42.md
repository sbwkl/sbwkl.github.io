# 《概率统计》 day 42

今天是读《概率统计》的逻辑第 42 天，学习 Two-Sample t Test，比较两个随机样本均值。

$X_1, ..., X_m$ 是 $(\mu_1, \sigma^2)$ 的正态分布，$Y_1, ..., Y_n$ 是 $(\mu_2, \sigma^2)$ 的正态分布

$$
H_0: \mu_1 \le \mu_2
$$
$$
H_1: \mu_1 \gt \mu_2
$$

定义统计

$$
U = \frac{\sqrt{m+n-2}(\overline{X}_m - \overline{Y}_n)}{\sqrt{\frac{1}{m} + \frac{1}{n}}\sqrt{S_X^2 + S_Y^2}}
$$

当 $\mu_1 = \mu_2$ 时，U 是自由度 m + n - 2 的 t 分布

$\delta$: 如果 $U \ge c$ 拒绝 $H_0$，c 根据显著性等级 $\alpha_0$ 计算。

套路和上一节很像，只是统计更加复杂了。

练习7

封面图：Twitter 心臓弱眞君 @xinzoruo