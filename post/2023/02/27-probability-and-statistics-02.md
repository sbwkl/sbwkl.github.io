# 《概率统计》 day 2

今天是读《概率统计》的逻辑第 2 天，惯例想下本中文版用用，搜了一圈发现一个恐怖的事实，这本书好像没有中文版。

这咋整，完了啊，机械工业出版社出的书怎么会没有中文版。

见鬼，这下硬过头了，看一本书，学两门课。

问了 ChatGPT，它说有，但我觉得它在坑我，要么就是提问姿势不对。

![](https://files.mdnice.com/user/18103/f1f7b199-6491-4637-9d71-b1b9d7418d89.png)

另外这 AI 还挺有节操，就是不知道训练它的数据有没有授权。

今天看集合论，大部分都还熟悉，比较神奇的是可数集（countable）。这玩意儿以前也见过，当时跳过了，以为再也不会遇到，没想到还是遇上了。

集合有个 cardinality 属性，记作 |A|，简单理解就是集合元素的个数，到这没啥问题。然后画风一转，问无限集有没有 cardinality，有的话自然数集 N 和整数集 Z 谁大谁小。

直觉看肯定整数集大啊，整数包含自然数，还多出一大截负数，都快两倍大了。

然而数学不是这么算的，数学定义：如果两个集合 A, B 之间存在双射函数，那么两个集合 cardinality 相等。

双射的意思是对于任何 x 唯一存在 y 满足 f(x) = y 并且任何 y 唯一存在 x 满足 y = f(x)。

自然数 N 和整数 Z 之间还真有双射函数

$$
f(n) = \begin{cases}
(n - 1) / 2 &\text{n 是奇数}\\
-n / 2 &\text{n 是偶数}
\end{cases}
$$

所以 |N| = |Z|

不要纠结 f(0) 和 f(1) 都等于零，我发现有些文献不把 0 算做自然数，如果非要纠结，(n - 1) / 2 换成 (n + 1) / 2。

是不是很诡异，没卵用的知识增加了。

可数集包含两部分，一部分是有限集，另一部分是 cardinality 与自然数集相等的无限集。

实数集是不可数集，用 Cantor's diagonal argument 证明<sup>[1]</sup>，这也是个神奇的方法。

大概的意思是假设实数集可数，那么存在双射函数 f。

这时候把 [0, 1) 所有实数排列整齐，大概是下面这个样子

```
f(1) = 0.6230713...
f(2) = 0.1982100...
f(3) = 0.2736011...
...
```

不要纠结为什么第一个实数是 0.6230713... 随便写的。

然后构建一个新的实数 b = 0.b<sub>1</sub>b<sub>2</sub>b<sub>3</sub>...

b 的第 n 位 b<sub>n</sub> 和上面第 n 行的 n 位数不同，第一位不是 6，第二位不是 9，第三位不是 3，依次类推。

根据构建实数 b 的过程可以知道 b 一定不在表里面（每行总有一位数字不一样），但根据假设这张表包含所有 [0, 1) 实数，so 冲突了，假设不成立。

总觉得哪里不对劲，但又说不上来，知乎老哥<sup>[2]</sup>解释得更清晰。

数学就这样，看上去很邪门的证明，它说是对的，看上去很靠谱的证明，它说是错的。

+ [1] Cantor's diagonal argument: *https://en.wikipedia.org/wiki/Cantor%27s_diagonal_argument*
+ [2] 知乎: *https://www.zhihu.com/question/21212165*

封面图：Twitter 心臓弱眞君 @xinzoruo