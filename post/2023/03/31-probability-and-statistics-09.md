# 《概率统计》 day 9

今天是读《概率统计》的逻辑第 9 天，学习随机变量和分布。

随机变量理解起来有点别扭，严格来说它并不是变量而是函数。

随机变量的定义

> Let S be the sample space for an experiment. A real-valued function that is defined on S is called a random variable.

分布的定义

> Let X be a random variable. The distribution of X is the collection of all probabilities of the form Pr(X ∈ C) for all sets C of real numbers such that {X ∈ C} is an event.

看起来一个结果对应一个实数，一组实数对应一个事件。

离散分布，随机变量的值有限，用概率函数 （p.f.）描述，概率函数的值就是随机变量 X = x 的概率。

几种光听名字就知道长啥样的分布

Bernoulli random variable with parameter p

$$
f(x) =
\begin{cases}
p &\text{if x = 1} \\
1 - p &\text{if x = 0} \\
0 &\text{otherwise}
\end{cases}
$$

P(X = 1) = f(1) = p

Uniform distribution on the integers a, ... ,b

$$
f(x) =
\begin{cases}
\frac{1}{b - a + 1} &\text{for x = a, ..., b} \\
0 &\text{otherwise}
\end{cases}
$$

Binomial distribution with parameters n and p

$$
f(x) =
\begin{cases}
\binom{n}{x}p^x(1-p)^{n-x} &\text{for x = 0, 1, ..., n} \\
0 &\text{otherwise}
\end{cases}
$$

正态分布呢，不配拥有名字么。

连续分布，光听名字就感觉不对劲，往下一看果然是积分。

概念上和离散分布差不多，换了个函数名，叫概率密度函数（p.d.f.）贴心的多准备点背诵内容。

同样有几种有名有姓的分布

Uniform Distribution p.d.f.

$$
f(x) =
\begin{cases}
\frac{1}{b-a} &\text{for a ≤ x ≤ b} \\
0 &\text{otherwise}
\end{cases}
$$

Incompletely Speciﬁed p.d.f.

$$
f(x)=
\begin{cases}
cx &\text{for a < x < b} \\
0 &\text{otherwise}
\end{cases}
$$

和离散分布不一样的是连续分布的 f(x) 不是概率，叫概率密度，它的积分才是概率。

$$
P(a \le X \le b) = \int_{a}^{b} f(x)dx
$$

而且从 f(x) 的定义看，它的值有可能大于 1，只要 b - a ＜ 1。

另外还有个很奇怪的设定，连续分布某个点的概率固定为 0，即 P(X = x) = 0，只有区间才有概率。

还是没见着正态分布，过分。

这两节全是概念，除了积分其他都还好理解，最后

随机变量是函数

随机变量是函数

随机变量是函数

封面图：Twitter 心臓弱眞君 @xinzoruo