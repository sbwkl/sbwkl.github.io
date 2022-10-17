# 《编译原理》 day 32

今天是读《编译原理》的逻辑第 32 天，内容比较轻松，总结第 4 章内容。

得亏完结了，回顾整个第 4 章内容，从中途开始逆风，到后半几近崩盘，这要再多几节就真撑不住了。

+ Parsers: 负责把 Token 流转成分析树
+ Context-Free Grammars: 四个组成部分：终结符、非终结符、开始符号、产生式。我回去瞄了眼《离散数学》这个是 type 3 文法，它有三个兄弟，type 1，2，4 更复杂
+ Derivations: 自开始符号起，不断用产生式替换非终结符的过程，有两个特殊的存在，最左/最后推导
+ Parse Trees: 推导的最终结果
+ Ambiguity: 至少有两棵分析树
+ Top-Down and Bottom-Up Parsing: 两种方向相反的分析技术，一个用最左推导，一个用逆向最右推导
+ Design of Grammars: 自顶向下要求多，又是不能有左递归，又是不能有相同前缀，还是自底向上对设计友好
+ Recursive-Descent Parsers: 自顶向下递归版本，有概率发生回溯
+ LL(1) Parsers: 自顶向下分析表版本，我感觉是给后面 LR 练手用的
+ Shift-Reduce Parsing: 自底向上分析技术的基础，要么移入，要么归约
+ Viable Prefixes: 某个最右句型的前缀，栈里装的一定是可行前缀，看不太懂
+ Valid Items: 看不懂
+ LR Parsers: 先计算 item 集合构成的状态，再计算分析表，然后根据分析表决定移入/归约
+ Simple LR Parsers: LR(0) 构成状态条目是 [A -> α.β]
+ Canonical-LR Parsers: LR(1) 构成状态的条目是 [A -> α.β, a]
+ Lookahead-LR Parsers: 更加牛逼的算法，空间占用更少，看不懂
+ Bottom-Up Parsing of Ambiguous Grammars: 使用带有二义性的文法，通过某种手段（结合性、优先级等）规避冲突，二义性语法通常更简单
+ Yacc: 一个牛逼的工具，生成 LALR 语法分析器。

又收获不少关键字，感觉经验条又涨了。

文法这个东西可以追溯到 2000 多年前的学者 Pāṇini（肯……肯德基早餐？？？），他用一种等价的语法符号描述梵文的文法，因吹斯汀。

Knuth 引入 LR 分析器，这个老爷子有点印象，很多离谱的书都是他写的，是个巨佬，但能被这本书引用的估计都是巨佬。

封面图：Twitter 心臓弱眞君 @xinzoruo