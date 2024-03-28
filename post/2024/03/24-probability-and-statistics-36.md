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
I(\theta) = Var_\theta[\lambda'(X|\theta)] = - E_\theta[\lambda''(X|\theta)]
$$

根据定义算了下几个学过的分布

<!-- 这里把计算过程列出来，$\lambda'$ 后面要用 -->

伯努利分布

$$
\begin{aligned}
\lambda(x|p) &= xlogp + (1-x)log(1-p) \\
\lambda'(x|p) &= \frac{x}{p} - \frac{1-x}{1-p} \\
\lambda''(x|p) &= -\frac{x}{p^2} - \frac{1-x}{(1-p)^2} \\
I(p) &= \frac{E(X)}{p^2} + \frac{1 - E(X)}{(1-p)^2} = \frac{1}{p(1-p)}
\end{aligned}
$$

方差的倒数

二项式，n 固定

$$
\begin{aligned}
\lambda(x|p) &= log[\binom{n}{x}] + xlogp + (n-x) log(1-p) \\
\lambda'(x|p) &= \frac{x}{p} - \frac{n-x}{1-p} \\
\lambda''(x|p) &= -\frac{x}{p^2} - \frac{n-x}{(1-p)^2} \\
I(p) &=  \frac{E(X)}{p^2} + \frac{n - E(X)}{(1-p)^2} = \frac{n}{p(1-p)}
\end{aligned}
$$

伯努利的 n 倍

泊松分布

$$
\begin{aligned}
\lambda(x|\theta) &= -\theta + x log \theta - log (x!)\\
\lambda'(x|\theta) &= \frac{x}{\theta} - 1 \\
\lambda''(x|\theta) &= -\frac{x}{\theta^2} \\
I(\theta) &= -\frac{E(X)}{\theta^2} = \frac{1}{\theta}
\end{aligned}

$$

方差的倒数

负二项式分布

$E(X) = r(1-p)/p^2$

$$
\begin{aligned}
\lambda(x|p) &= log[\binom{r+x-1}{x}] + rlogp + x log(1-p) \\
\lambda'(x|p) &= \frac{r}{p} - \frac{x}{1-p} \\
\lambda''(x|p) &= - \frac{r}{p^2} - \frac{x}{(1-p)^2} \\ 
I(p) &= \frac{r}{p^2} + \frac{E(X)}{(1-p)^2} = \frac{r}{p^2(1-p)}
\end{aligned}

$$

正态分布

$\mu$ 已知

$$
\begin{aligned}
\lambda(x|\sigma) &= -log(\sqrt{2\pi}) - log\sigma - \frac{(x-\mu)^2}{2\sigma^2} \\
\lambda'(x|\sigma) &= -\frac{1}{\sigma} + \frac{(x-\mu)^2}{\sigma^3} \\
\lambda''(x|\sigma) &= \frac{1}{\sigma^2} - \frac{3(x-\mu)^2}{\sigma^4} \\
I(\sigma) &= -\frac{1}{\sigma} + \frac{3E(X-\mu)^2}{\sigma^4} = -\frac{1}{\sigma} + \frac{3Var(X)}{\sigma^4} = \frac{2}{\sigma^2}
\end{aligned}
$$

$\sigma$ 已知

$$
\begin{aligned}
\lambda(x|\mu) &= -log(\sqrt{2\pi}\sigma) - \frac{(x-\mu)^2}{2\sigma^2} \\
\lambda'(x|\mu) &= \frac{x-\mu}{\sigma^2} \\
\lambda''(x|\mu) &= - \frac{1}{\sigma^2} \\
I(\mu) &= \frac{1}{\sigma^2}
\end{aligned}
$$

不管哪个已知，咋最后都和 $\sigma$ 有关，好神奇。至于 $\mu, \sigma$ 都未知，这个不会。

<!-- 伽马分布，$\alpha$ 固定

$$
I(\beta) = \frac{\alpha}{\beta^2}
$$ -->

费舍尔信息对随机样本同样有效

$$
I_n(\theta) = nI(\theta)
$$

Cram´er-Rao Inequality 说的统计的方差有个下限

$$
Var_\theta(T) \ge \frac{[m'(\theta)]^2}{nI(\theta)}
$$

等号成立的等价条件是

$$
T = u(\theta)\lambda_n'(\vec{X}|\theta) + v(\theta)
$$

用上面的分布验证一下

伯努利分布 $E(X)=p, Var(X) = p(1-p)$

$$
\frac{[m'(p)]^2}{I(p)} = \frac{1}{p(1-p)}
$$

刚好等于下限，按照定理 $X$ 应该能表示成 $u(p)\lambda'(x|p) + v(p)$

$$
\lambda'(x|p) = \frac{x}{p} - \frac{1-x}{1-p} = \frac{x}{p(1-p)} - \frac{1}{1-p}
$$

$$
X = p(1-p)\lambda'(x|p) + p
$$

$$
u(p) = p(1-p), v(p) = p
$$

确实可以

其他几个类似

二项式分布 $E(X) = np$

$$
Var(X) = np(1-p) \ge n^2 * \frac{p(1-p)}{n} = np(1-p)
$$

也是等于 $X = p(1-p)\lambda' + np$

泊松分布

也是等于 $X = \theta \lambda' + \theta$

注：上面几个是我手算的，我相信定理，但不相信自己，可能有算错的。

Efficient Estimator 有效估计量，数了下，这应该是第 4 个出现的估计量了。

满足 Cram´er-Rao Inequality 等号要求的那个估计量叫做有效估计量，那应该是方差最小的估计量吧

