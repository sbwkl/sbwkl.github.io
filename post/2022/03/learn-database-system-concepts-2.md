# 数据库查询和查询优化

这篇是《数据库系统概念》第 12，13 章学习笔记，看到这里发现了个坑爹的事，这本书已经有第七版了，然而我看的是第六版，尴尬啊。

数据库的最基本用法之一就是查询，也就是通过 SQL 查询需要的数据。SQL 是一种声明式编程语言（declarative programming language）这种语言只描述「做什么」而不管怎么做。与之相对的是命令式编程语言（Imperative programming language）不仅要描述「做什么」还要描述「怎么做」，比如 C 语言。

由于 SQL 只描述「做什么」剩下的工作全部由数据库完成，数据库执行 SQL 可以粗略的分三步

1. SQL 解析和转换，转成关系代数（relational algebra）
2. 优化，从众多执行计划中挑一个少花时间的
3. 执行

先说解析和转换，这一步把不能运算的 SQL 语言转化成可以运算的代数。

代数大意是研究数学符号和处理这些符号的规则，这个词来自穆罕默德写的一本书的标题。这个默罕默德和那个宣称自己是最后一任先知的默罕默德应该不是同一个人。

关系（relation）在数学概念上是有序对的集合，类似 {(12121, Wu, Finance, 90000), (15151, Mozart, Music, 40000)} 这样的结构，集合里的每个元素叫做 4-元组（4-tuple），4 表示元组里面的元素数量。

有序对的元素分别来自各自的集合，比如 12121 和 15151 来自同一个集合，可以叫它 ID 集合，这个集合也叫作域（domain），类似的还有 name 集合，department 集合，salary 集合。我们说 12121, Wu, Finance, 90000 有关系就是指他们构成的元组在关系的集合里。这和数据库的表很像了，后面有时用「表」来指代关系，用「行」来指代元组，用「字段」指代域。

有意思的是函数也是一种关系，比如函数 f(x) = x + 1 可以看做是 {..., (0, 1), (1, 2), ...} 的集合，也就是元组 (x, f(x)) 的集合。

初等代数操作数是自然数，操作符是加减乘除，关系代数也一样，只不过操作数是关系，操作符也不太一样。

$$
\def\arraystretch{2}
\begin{array}{c:l}
操作名 & 符号 \\
\hline
\text{选择操作} & \sigma_{dept_name="Physics"}(instructor) \\
\hdashline
\text{投影操作} & \Pi_{ID, name, salary/100}(instructor) \\
\hdashline
\text{笛卡尔积} & instructor \times teaches \\
\hdashline
\text{join} & instructor \Join_\theta teaches \equiv \sigma_\theta(instructor \times teaches) \\
\hdashline
\text{left join} & instructor ⟕ teaches \text{ 右、全关联同理} \\
\hdashline
\text{赋值} & course\_Fall\_2017 \leftarrow \Pi_{course\_id}(\sigma_{semester = "Fall" \wedge year = "2017"} (course)) \\
\hdashline
\text{重命名} & \rho_{x(A_1, A_2, ..., A_n)}(E) \\
\hdashline
\text{复合操作} & \Pi_{name}(\sigma_{dept_name="Physics"}(instructor)) \\
\hdashline
\text{集合} & \text{交并差和普通集合一样} \\
\hdashline
...
\end{array}
$$

关系代数和 SQL 有点像，但又不完全一样，比如 where 子句对应选择操作，select 子句对应投影操作。

然后是一些等价规则，图片右边有等式成立的额外条件，不感兴趣直接用绯红之王看。

$$
\def\arraystretch{2}
\begin{array}{rl:l}
% \begin{aligned}
\text{等价规则} & &\text{额外条件} \\
\hline
\sigma_{\theta_1 \wedge \theta_2}(E) &\equiv \sigma_{\theta_1}(\sigma_{\theta_2}(E)) \\
\hdashline
\sigma_{\theta_1}(\sigma_{\theta_2}(E)) &\equiv \sigma_{\theta_2}(\sigma_{\theta_1}(E)) \\
\hdashline
\Pi_{L_1}(\Pi_{L_2}(...(\Pi_{L_n}(E))...)) &\equiv \Pi_{L_1}(E) & L_1 \subseteq L_2 \subseteq ... \subseteq L_n \\
\hdashline
\sigma_\theta(E_1 \times E_2) &\equiv E_1 \Join_\theta E_2 \\
\hdashline
\sigma_{\theta_1}(E_1 \Join_{\theta_2} E_2) &\equiv E_1 \Join_{\theta_1 \wedge \theta_2} E_2 \\
\hdashline
E_1 \Join_\theta E_2 &\equiv E_2 \Join_\theta E_1 \\
\hdashline
(E_1 \Join E_2) \Join E_3 &\equiv E_1 \Join (E_2 \Join E_3) \\
\hdashline
(E_1 \Join_{\theta_1} E_2) \Join_{\theta_2 \wedge \theta_3} E_3 &\equiv E_1 \Join_{\theta_1 \wedge \theta_3} (E_2 \Join_{\theta_2} E_3) & \theta_2 \text{只涉及} E_1, E_2 \text{的属性}\\
\hdashline
\sigma_{\theta_1}(E_1 \Join_\theta E_2) &\equiv (\sigma_{\theta_1} (E_1) \Join_\theta E_2) & \theta_1 \text{只涉及} E_1 \text{的属性}\\
\hdashline
\sigma_{\theta_1 \wedge \theta_2} (E_1 \Join_\theta E_2) &\equiv (\sigma_{\theta_1} (E_1) \Join_\theta (\sigma_{\theta_2}(E_2)) & \theta_1 \text{只涉及} E_1 \text{，} \theta_2 \text{只涉及} E_2 \\
\hdashline
\Pi_{L_1 \cup L_2} (E_1 \Join_\theta E_2) &\equiv (\Pi_{L_1}(E_1)) \Join_\theta (\Pi_{L_2} (E_2)) & L_1 是 E_1 的属性，L_2 是 E_2 的属性 \\
\hdashline
\sigma_\theta(E_1 \cap E_2) &\equiv \sigma_\theta (E_1) - E_1 \\
\hdashline
\Pi_L (E_1 \cup E_2) &\equiv (\Pi_L (E_1)) \cup (\Pi_L (E_2)) \\
\hdashline
\sigma_\theta(_G \gamma_A (E)) &\equiv _G \gamma_A (\sigma_\theta E) \\
\hdashline
E_1 ⟗ \enspace E_2 &\equiv E_2 ⟗ \enspace E_1 \\
\hdashline
E_1 ⟕ \; E_2 &\equiv E_2 ⟖ \; E_1 \\
\hdashline
\sigma_{\theta_1} (E_1 ⟕\;_\theta E_2) &\equiv (\sigma_{\theta_1} (E_1))  ⟕\;_\theta E_2 \\
\hdashline
... 
% \end{aligned}
\end{array}
$$


有了这些操作符和等价规则，一条 SQL 就可以被解析为代数表达式的集合，每条表达式都是等价的。每条表达式都是一个执行计划。

比如
```
select name, title from instructor 
natural join teaches 
natural join (select course_id, title from course) 
where instructor.dept_name = 'Music';

-- natural join 意思是两张表相同名字的字段值相等。
```

可以被解析为​​

$$
\Pi_{name, title} (\sigma_{dept_name = "Music"} (instructor \Join (teaches, \Join \Pi_{course_id, title} (course))))
$$

然后根据等价规则可以转化为

$$
\Pi_{name, title} ((\sigma_{dept_name = "Music"} (instructor) \Join (teaches, \Join \Pi_{course_id, title} (course))))
$$

![](https://files.mdnice.com/user/18103/cb3a5608-7c08-43b6-aaa9-fec7e1662b90.jpg)

这种语法解析貌似都喜欢用树来表示。

根据等价规则变换出的表达式数量是非常夸张的，n 张表的自然连接有 (2(n - 1))! / (n - 1)! 种链接顺序。这个数字怎么算的可以搜关键词 Catalan numbers，或者看《离散数学》第 8 版 8.1.2 章节例题 5，给这帮数学大佬跪了。

然后有了优化过程，为了挑选合适的执行计划就需要评估执行计划，直接评估时间不现实，转而评估其他指标，比如可能涉及的行数。

评估需要一些额外的信息，保存在数据目录（catalog）里，常用的是 

+ n, 表行数量
+ b, 表保存的「块」数量
+ l, 每一行的大小
+ f, 每「块」里面有几行
+ V(A, r), 表 r 的字段 A 有多少个不同的数值

一般来说 b = ⌈ n / f ⌉，有些数据库为了估计更准还会保存直方图，也就是字段一定范围内的行数。没有直方图的时候通常就假设字段值是均匀分布的。这些数据通常不会很精准，估算够用就成。

下面是摘抄的估算公式

$$
\def\arraystretch{2}
\begin{array}{c:c:c}
   关系代数 & 估算公式 & 备注 \\ \hline
   \sigma_{A = a}(r)  & \frac{n}{V(A, r)} \\
   \hdashline
   \sigma_{A < v}(r) & n * \frac{(v - min(A, r))}{(max(A, r) - min(A, r))} \\
   \hdashline
   \sigma_{\theta_1 \wedge \theta_2 \wedge ... \wedge \theta_n} (r) & n * \frac{(s_1 * s_2 * ... * s_n)}{n^n} & s_i 表示 \sigma_{\theta_i} (r) 的数量\\
   \hdashline
   r \times s & n_r * n_s & \\
   \hdashline
   r \Join s & min (\frac{n_r * n_s}{V(A, r)}, \frac{n_r * n_s}{V(A, s)}) & \\
   \hdashline
   \Pi_A(r) & V(A, r) & \\
   \hdashline
   _G\gamma_A(r) & V(A, r) & \\
   \hdashline
   r ⟕ \; s & r \Join s + n_r & \\
   \hdashline
   ...

\end{array}
$$

因为等价表达式众多，一个个都估算一遍不现实，不然查询费不了多长时间，时间全花在选执行计划了。数据库系统会用类似动态规划这样的算法来减少计算量

![](https://files.mdnice.com/user/18103/4b93eb56-1964-4bf5-a79a-f7b1e1d41910.png)

优化过程也会加入启发式（Heuristics）规则，这个有点像经验规则。比如 

+ 尽早执行选择操作，大概率能减少行数
+ 尽早执行投射操作，大概率减少元组大小

还有更多别的规则，每个数据库各自关各自的，八仙过海各显神通了。

最后是执行计划，选择合适的算法，不同的操作符对应一系列不同的算法，选择操作根据是否主索引、是否辅助索引等有十几个算法可以选择，每种算法各自的消耗也不一样。

选择算法有最普通的线性查询，和链表的搜索是一个算法 O(n) 的复杂度。也有基于索引的复杂算法。

排序根据内存是否能放下整个排序内容选择算法，当能全部数据能加载到内存时选择标准的排序算法就好，当不能加载全部数据时用一种外部排序归并算法。这个算法排序先一部分数据然后协会磁盘，然后继续下一块

![](https://files.mdnice.com/user/18103/93d65fdf-1031-4a7d-a9f1-98327f90b949.png)
![](https://files.mdnice.com/user/18103/39a90cc9-29f5-4597-ba75-a4b03c33b845.png)

连接操作有最普通的双重 for 算法，循环遍历两张表，缺点是 IO 访问比较多，有一种优化是先按块遍历，再遍历块中的记录，可以减少 IO 访问。

![](https://files.mdnice.com/user/18103/50c091cd-e77f-473b-b64f-0df759740c48.png)
![](https://files.mdnice.com/user/18103/de30ac87-07e5-4416-bb61-c0ce322828b6.png)

其他还有 merge-join 算法、hash-join 算法，各自都有各自的优点。

其他操作也各自都有一系列算法，数据库系统会挑选合适的算法用于计算。

表达式计算有两种方式，一种是计算表达式然后结果保存到临时表，供后续表达式计算使用，这种方式叫物化（Materialization）。另一种方法是流水线（pipelining）这种方式把表达式计算串起来，计算出结果后直接交给下个表达式用于运算。

流水线又有两种实现，一种是需求驱动的流水线（demand-driven pipeline），一种是生产者驱动的流水线（producer-driven pipeline）。

需求驱动的流水线有点像迭代器，从根往叶子执行，表达式不断向子表达式请求需要的数据。生产者驱动的流水线刚好反过来，从叶子往根执行。子表达式不停的产生数据，直到用于保存中间数据的 buffer 满了，然后等待 buffer 有空位再执行，类似 producer-consumer 模型。

粗略来看数据库操作很像多个链表之间的操作，只是这个数据量变得非常大，又需要保持很好的性能，因此增加了亿点点细节。

推荐感兴趣的小伙伴看原书，具体又详细，能解不少以前的疑惑。注意下版本要看第七版 2019 年的。

这个网站 https://db-book.com/university-lab-dir/sqljs.html 可以里有预先录入的数据，可以直接执行 sql，其实这个网站是为了这本书建立的。

封面图：Photo by Emiliano Arano from Pexels