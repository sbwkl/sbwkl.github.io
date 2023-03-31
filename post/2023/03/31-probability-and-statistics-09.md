

这两个概念上学也学过，借着复习下。

随机变量是个别扭的概念，严格来说它并不是变量，而是函数

要么套在 js 代码，对 js 来说，函数可以是变量

随机变量的定义

> Let S be the sample space for an experiment. A real-valued function that is defined on S is called a random variable.

简单理解就是结果和实数的映射，一个结果对应一个实数。

分布的定义

>  Let X be a random variable. The distribution of X is the collection of all probabilities of the form Pr(X ∈ C) for all sets C of real numbers such that {X ∈ C} is an event.


离散分布

随机变量 X 的值有限

概率函数 p.f.

f(x) = P(X = x)

几种光听名字就知道长啥样的分布

Bernoulli random variable with parameter p

$$
f(x) = 
$$

uniform distribution on the integers a, . . . , b

$$
f(x) = \frac{1}{b - a + 1}
$$

binomial distribution with parameters n and p

$$
f(x) = \binom{n}{x}p^x(1-p)^{n-x}
$$

我正态分布，不配有名字么。

连续分布

光听名字就有点不对劲，往下一看果然和积分有关系

概念上和离散分布差不多，换了个函数名，叫概率密度函数 p.d.f. 这是嫌考试背的内容不够多么。

几种有名字的分布

uniform distribution on an interval [a, b]

$$
f(x) = \frac{1}{b-a}
$$

有区别的是连续分布 f(x) 计算得到的值并不是概率，因为 f(x) 的值可能大于 1。

这两节全是概念
