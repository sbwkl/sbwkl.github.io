# 《概率统计》 day 36

今天是读《概率统计》的逻辑第 36 天，学习 Fisher Information，百科叫费希尔信息。

首先要满足条件，对于任何 $\theta$，$f(x|\theta)$ 要么都大于 0，要么都等于 0。也就是 $f(x|\theta)$ 是否等于 0 不受 $\theta$ 的影响。

所以首先排除 $[0, \theta]$ 的均匀分布，这个用不了

满足条件的随机变量，Fisher Information

$$
I(\theta) = E_\theta\{[\lambda'(X|\theta)]^2\}
$$

$$
\lambda'(x|\theta) = log f(x|\theta)
$$

$$
I(\theta) = Var_\theta[\lambda'(X|\theta)] = E_\theta[\lambda''(X|\theta)]
$$

根据定义算了下几个学过的分布

伯努利分布

$$I(p) = \frac{1}{p(1-p)}$$

方差的倒数

二项式，n 固定

$$
I(p) = \frac{n}{p(1-p)}
$$

伯努利的 n 倍

泊松分布

$$
I(\lambda) = \frac{1}{\lambda}
$$

方差的倒数

负二项式分布

$$
I(p) = \frac{r}{p^2(1-p)}
$$

正态分布

$\mu$ 固定

$$
I(\sigma) = \frac{2}{\sigma^2}
$$

$\sigma$ 固定

$$
I(\mu) = \frac{1}{\sigma^2}
$$

$\mu, \sigma$ 不固定，我不会。

每次看到 $\mu$ 或者 $\sigma$ 已知的正态分布，总让我想起那个边放水，边灌水的疯狂泳池管理员。

伽马分布，$\alpha$ 固定

$$
I(\beta) = \frac{\alpha}{\beta^2}
$$

费舍尔信息对随机样本同样有效

$$
I_n(\theta) = nI(\theta)
$$

Cram´er-Rao Inequality

$$
Var_\theta(T) \ge \frac{[m'(\theta)]^2}{nI(\theta)}
$$

等号成立的等价条件

$$
T = u(\theta)\lambda_n'(\vec{X}|\theta) + v(\theta)
$$

