# 《概率统计》 day 13

今天是读《概率统计》的逻辑第 13 天，学习多变量分布（multivariate distributions）。

嗯，三个以上随机变量。

按照套路，新概念，从头再来一遍，这次出场的新概念是随机向量。

$$
f(\vec{x}) = f(x_1, x_2, ..., x_n)
$$

这么做的好处是公式统一，形式上和之前学的一模一样。

边缘分布

但凡叫边缘的都是求和/积分：向量 **y** **z** 组成 **x**

$$
f_1(\vec{y}) = \underbrace{\int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty}}_{n - k} f(\vec{x})d\vec{z}$$

条件分布

$$
g_1(\vec{y}|\vec{z}) = \frac{f(\vec{y}, \vec{z})}{f_2(\vec{z})}
$$

独立

$$
f(\vec{x}) = \prod_{i=1}^{n}f_i(x_i)
$$

条件独立

$$
g(\vec{x}|\vec{z}) = \prod_{i=1}^{n}g_i(x_i|\vec{z})
$$

全概率定理

$$
f_1(\vec{y}) = \underbrace{\int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty}}_{n-k} g_1(\vec{y}|\vec{z})f_2(\vec{z})d\vec{z}
$$

条件版本全概率定理

$$
f_1(\vec{y}|\vec{w}) = \underbrace{\int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty}}_{n-k} g_1(\vec{y}|\vec{z}, \vec{w}) f_2(\vec{z}|\vec{w}) d\vec{z}
$$

贝叶斯定理

$$
g_2(\vec{z}|\vec{y}) = \frac{g_1(\vec{y}|\vec{z})f_2(\vec{z})}{f_1(\vec{y})}
$$

条件版本贝叶斯定理

$$
g_2(\vec{z}|\vec{y}, \vec{w}) = \frac{g_1(\vec{y}|\vec{z}, \vec{w}) f_2(\vec{z}|\vec{w})}{f_1(\vec{y}|\vec{w})}
$$

新增一个东西 i.i.d. 全称 independent and identically distributed 指一种特殊的多变量分布，随机变量分布相同且独立。

丢硬币就是，每次丢硬币独立，分布相同，都是

$$
f(x) = \begin{cases}
0.5   &\text{x = 1 正面} \\
0.5   &\text{x = 0 反面}
\end{cases}
$$

如果丢出正面概率换成变量 p 那么它就不再是 i.i.d. 丢四次硬币,用多变量分布的视角看待，它有 5 个随机变量，函数 f 是

$$
f(\vec{x}, p) = p^{x_1 + \dots + x_4}(1-p)^{4 - x_1 - \dots - x_4}
$$

基于这个函数计算前两次刚好丢出一次正面的概率，即 P(X<sub>1</sub> + X<sub>2</sub> = 1)。

代入函数

$$
f(\vec{x}, p) = p^{1+x_3+x_4}(1-p)^{3-x_3-x_4}
$$

对 x<sub>3</sub>, x<sub>4</sub> 求和，对 p 求积分

$$
\int_0^1\sum_{x_3}\sum_{x_4}p^{1+x_3+x_4}(1-p)^{3-x_3-x_4} dp = \frac{1}{6}
$$

又因为

$$
x_1 + x_2 = 1
$$

有两个解，所以 P(X<sub>1</sub> + X<sub>2</sub> = 1) = 1 / 3

说实话，有种它随手涂鸦，然后告诉我这就是答案的感觉，它这个 p 要是固定值还好理解一点。

不过这种解法倒是蛮新奇的，有种通解的感觉。

书上还有更丰富的例子，也更复杂，感兴趣的小伙伴可以上去看看，保证赤鸡。

现在我很怀疑后面还有没有随机矩阵，随机张量。

封面图：Twitter 心臓弱眞君 @xinzoruo