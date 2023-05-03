# 《概率统计》 day 14

今天是读《概率统计》的逻辑第 14 天，学习 Functions of a Random Variable。

通过描述随机变量间的关系，计算新的随机变量 Y 的概率函数/概率密度函数。

比如随机变量 X 的值为 {-2, -1, 0, 1, 2} 对应的概率函数是

$$
f(x) = \frac{1}{5}
$$

那么随机变量 Y = X<sup>2</sup> 的概率函数是

$$
g(y) = \begin{cases}
\frac{1}{5} & y = 0\\
\frac{2}{5} & y = 1\\
\frac{2}{5} & y = 4
\end{cases}
$$

话说随机变量不是函数么，函数当变量使，也难怪叫随机变量。上一次有这种奇怪的感觉是 javascript，函数即对象。

离散相对容易点，只要合并具有相同 y 值的概率就行，用数学的话说

$$
g(y) = \sum_{x: r(x) = y}f(x)
$$

连续就复杂很多，虽然表面看起来就是求和换成积分。

先计算 Y 的 c.d.f.

$$
\begin{aligned}
G(y) &= P(Y \le y) = P(r(x) \le y) \\
&= \int_{x: r(x) \le y}f(x)dx
\end{aligned}
$$

对 G 求导计算 g(y)

几种特殊的变换，直接套公式

Y = aX + b

线性变换

$$
g(y) = \frac{1}{|a|}f(\frac{y - b}{a})
$$

Y = F(x)

Y 是 X 的 c.d.f.

$$
G(y) = P(Y \le y) = P(X \le x) = y
$$

$$
g(y) = 1
$$

Y = r(X)

函数 r 可导，而且是 one-to-one function，s(y) 是 r 的逆函数 x = s(y)

$$
g(y) = f[s(y)]|\frac{ds(y)}{dy}|
$$

下一节其实还要牛逼，这节内容的威力加强版，一个 Y 对 n 个 X

$$
Y = a_1X_1 + a_2X_2 + ... + b
$$

不仅如此，Y 也不止一个

$$
\begin{aligned}
Y_1 = r_1(X_1, ..., X_n) \\
Y_2 = r_2(X_1, ..., X_n) \\
... \\
Y_m = r_m(X_1, ..., X_n)
\end{aligned}
$$

然后计算

$$
f(y_1, ..., y_m)
$$

牛逼牛逼，告辞。

不过问题不大，这种千载难逢的场景这辈子怕是很难遇上，万一遇上了，知道有这么回事就差不多了，剩下的交给硅基人。

封面图：Twitter 心臓弱眞君 @xinzoruo