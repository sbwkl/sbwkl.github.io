# 《概率统计》 day 32

今天是读《概率统计》的逻辑第 32 天，学习抽样分布。

说实话这几节有点迷，不知道干啥用。

根据之前的知识，随机变量的统计也是随机变量，叫做抽样分布。

样本均值 $\overline{X}_n$ 就是一种抽样分布，正态分布 $(\mu, \sigma^2)$ 的样本均值是 $(\mu, \sigma^2 / n)$ 的正态分布。

$\chi^2$ 分布，一种特殊的伽马分布，$\alpha = m/2$，$\beta$ 固定 1/2。

它有伽马分布的所有特性，自然 $\chi^2$ 的和也是 $\chi^2$ 分布。

额外有个很牛逼的特性，$m=1$ 的 $\chi^2$ 分布是标准正态分布的平方，这个就很厉害了，能和方差扯上关系了。

在 $\mu$ 已知的情况下（真的会有这种情况么）$\sigma^2$ 的 M.L.E.

$$
\hat{\sigma^2} = \frac{1}{n}\sum_{i=1}^n(X_i-\mu)^2
$$

稍微整理下

$$
\frac{n}{\sigma^2} \hat{\sigma^2} = \sum_{i=1}^n(\frac{X_i-\mu}{\sigma})^2 = \sum_{i=1}^n Z_i^2
$$

$\sum_{i=1}^nZ_i^2$ 是参数为 n 的 $\chi^2$ 分布，这个式子可以用来计算 $n\hat{\sigma^2}/\sigma^2$ 的概率，估算 $\hat{\sigma}$ 有多偏离 $\sigma$。

在 $\mu$ 未知的情况下，$\sigma^2$ 的 M.L.E.

$$
\hat{\sigma^2} = \frac{1}{n}\sum_{i=1}^n(X_i-\overline{X}_n)^2
$$

稍微整理下

$$
\frac{n}{\sigma^2} \hat{\sigma^2} = \sum_{i=1}^n(\frac{X_i-\overline{X}_n}{\sigma})^2
$$

它的右部也是 $\chi^2$ 分布，参数是 n - 1，这个证明过程巨复杂，感兴趣的可以翻翻原书 476 页。

额外多说一句，这个 $\chi$ 和 $x$ 好像，手写的方式也一样（至少我数学老师是这么教的），好奇搜了下，好家伙，搜到阵营九宫格

![](https://files.mdnice.com/user/18103/83076a7d-e2b9-4d50-ac90-cf39ad1ebe38.jpg)

最后还有个 t 分布，$Z$ 是标准正态分布，$Y$ 是参数为 m 的 $\chi^2$ 分布，随机变量

$$
\frac{Z}{(\frac{Y}{m})^{1/2}}
$$

叫做 t 分布，它由一个笔名叫 Student 的大佬发布。

随机变量 $\sqrt{n}(\overline{X}_n - \mu)/\sigma'$ 当

$$
\sigma'=\sqrt{\frac{\sum_{i=1}^n(X_i-\overline{X}_n)^2}{n-1}}
$$

时是 t 分布，然后就没有了。

封面图：Twitter 心臓弱眞君 @xinzoruo