# 《编译原理》 day 39

今天是读《编译原理》的逻辑第 39 天，第 5 章小结。

惯例整理关键词，这些都是 google 时的宝藏。

+ Inherited and Synthesized Attributes: 两种属性，综合属性通过子节点计算，继承属性通过父节点和兄弟结点计算
+ Dependency Graphs: 描述属性之间依赖关系的图
+ Cyclic Definitions: 上面那个图，有环
+ S-Attributed Definitions: 所有属性都是综合属性
+ L-Attributed Definitions: 继承属性只依赖父节点和它左边的兄弟结点，原来只是继承属性从左到右，那我之前错怪那张图了
+ Syntax trees: 本体是操作符，子节点是操作数，本体和子节点合起来又是它父节点的操作数
+ Implementing S-Attributed SDD's: 最简单的 SDD 实现，在产生式最右侧嵌入语义动作计算综合属性
+ Eliminating Left Recursion From SDT's: 把语义动作当做终结符，然后消除左递归
+ Implementing L-Attributed SDD's by Recursion-Descent Parsing: 在原版的基础上增加出入参，入参是继承属性，出参是综合属性，不过出参没活过一节，就被消除了
+ Implementing L-Attributed SDD's on an LL Grammar: LL 文法的 L 属性 SDD，使用栈实现
+ Implementing L-Attributed SDD's on an LL Grammar, Bottom-Up: LL 文法的 L 属性 SDD 转成 LR 再用栈实现，它到最后都没告诉我为啥要这么干

这章感觉没有前几章惊艳，看下来缺个主线，平铺的形式介绍各种算法，也许结合后面的章节才能展现它真正的威力。

词法、语法、语义概念上一个比一个大，语义没法形式化表示，词法能表达的概念又太小。

用词法表示会显得冗长，就好像汇编非常灵活，但实现高级语言特性就很啰嗦，一句赋值语句就要 mov 来 mov 去的。

折中选择语法作为转化的基础，过了这么多年总算对这些术语有些概念了。

封面图：Twitter 心臓弱眞君 @xinzoruo