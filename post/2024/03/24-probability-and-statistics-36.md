# 《概率统计》 day 36

今天是读《概率统计》的逻辑第 36 天，学习 Fisher Information，百度百科叫费希尔信息。

首先要满足条件，对于任何 $\theta$，$f(x|\theta)$ 要么都大于 0，要么都等于 0。也就是 $f(x|\theta)$ 是否等于 0 不收 $\theta$ 的影响。

所以首先排除 $[0, \theta]$ 的均匀分布，这个用不了

满足条件下，Fisher Information

$$
I(\theta) = E_\theta\{[\lambda'(X|\theta)]^2\}
$$

$$
\lambda'(x|\theta) = log f(x|\theta)
$$

$$
I(\theta) = Var_\theta[\lambda'(X|\theta)] = E_\theta[\lambda''(X|\theta)]
$$

费舍尔信息对随机样本同样有效

$$
I_n(\theta) = nI(\theta)
$$

