# 《概率统计》 day 11

今天是读《概率统计》的逻辑第 11 天，学习二维分布，应该是这么翻译，原文叫 Bivariate Distribution。

它类似联合概率，只不过联合概率研究两个事件，二维分布研究两个随机变量。

函数从 f(x) 升级到 f(x, y)，照这个架势，升级到 n 个随机变量，指日可待。

随机变量 X, Y 分别有两种选择，共三种组合

X Y 离散，这个最简单，一张二维表就可以描述，概率就是求和

$$
P[(X, Y) \in C] = \sum_{(x, y) \in C} f(x, y)
$$


X Y 连续，这个时候概率是体积

$$
P[(X, Y) \in C] = \int_C \int f(x, y) dx dy
$$

X 离散 Y 连续，这个就很难想象了，x 轴离散，y 轴连续，这是个啥。

$$
P(X \in A \text{ and } Y \in B) = \int_B\sum_{x \in A}f(x, y)dy
$$

回到最初丢硬币的例子，假设这是块邪门的硬币，丢出正面的概率是 p，X = 0，1 分别表示反面和正面，那么

$$
f(x, p) = p^x(1-p)^{1-x}
$$

这个等式怎么看都觉得没什么卵用，但总有种很牛逼的感觉。

二维分布也有 c.d.f. 用 F(x, y) 表示

$$
F(x, y) = P(X \le x \text{ and } Y \le y)
$$

二维可以推导一维

$$
F_1(x) = \lim_{y -> \infty}F(x, y)
$$

如果连续的话，还能推导出 f(x, y)

$$
f(x, y) = \frac{∂^2F(x, y)}{∂x ∂y}
$$

碎碎念

去成都看滚滚尤其要注意气温，超过 25℃ 滚滚都回玻璃房吹空调，要是再赶上人多，那就只能听到一片「走起来，走起来」

封面图：Twitter 心臓弱眞君 @xinzoruo