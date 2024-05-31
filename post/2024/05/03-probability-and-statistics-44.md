# 《概率统计》 day 44

今天是读《概率统计》的逻辑第 44 天，学习 Bayes Test Procedures 用贝叶斯视角重新看一遍假设检验。

有贝叶斯肯定就有先验/后验。

贝叶斯视角用最小的损失来决定，定义损失函数 $L(\theta, d_i)$

||d<sub>0</sub>|d<sub>1</sub>|
|--|--|--|
|H<sub>0</sub> true|0               |w<sub>0</sub>  |
|H<sub>1</sub> true|w<sub>1</sub>   |0              |

即当 $H_0 = true$ 或者说 $\theta \in \Omega_0$，此时选择 $d_0$ 无损失，选择 $d_1$ 损失 $w_0$，$w_0$ 既可以是常量也可以是函数，$H_1$ 同理。

$\xi(\theta)$ 表示先验，$\xi(\theta|\vec{x})$ 表示后验

损失的期望表示为

$$
r(d_0|\vec{x}) = \int_{\Omega_1} w_1 \xi(\theta|\vec{x})d \theta
$$

$$
r(d_1|\vec{x}) = \int_{\Omega_0} w_0 \xi(\theta|\vec{x})d \theta
$$



假设

$$
H_0: \theta = \theta_0
$$
$$
H_1: \theta = \theta_1
$$


碎碎念

最近把夜跑改成晨跑。之前隐约感到夜跑似乎会加重失眠，看完《绝佳时间》更加确信了，但不知道是不是错觉，调整之后，感觉失眠改善了很多。

不仅如此，感觉今年有望完成 10km，想着我这台积灰了三十多年的老爷车，也能完成 10km 想想还有点小激动。

封面图：Twitter 心臓弱眞君 @xinzoruo