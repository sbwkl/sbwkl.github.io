# 《编译原理》 day 22

今天是读《编译原理》的逻辑第 22 天，这次是真的完结了。

内容相对轻松，对第三章的总结，稍微休息下也挺好。

+ Tokens: 词法分析器的输出
+ Lexemes: 一组连续的输入字符
+ Buffering: 程序片段的内存缓存，提高性能且支持后退
+ Patterns: 描述什么字符可以组成 Token 的 lexemes
+ Regular Expressions: 描述 patterns
+ Regular Definitions: 描述 regular expressions
+ Extended Regular-Expression Notation: 使正则表达式更容易书写
+ Transition Diagrams: 二维数组，描述状态和输入字符的关系
+ Finite Automata: 转换图的形式化表示
+ Deterministic Finite Automata: 特殊的 FA，唯一确定转出状态，没有空串转换
+ Nondeterministic Finite Automata: 没特殊要求的 FA
+ Conversion Among Pattern Representations: 正则、NFA、DFA 互转
+ Lex: 一个生成词法分析器的工具
+ Minimization of Finite Automata: 对于每个 DFA 有且只有一个状态最少的等价的 DFA

稍微整整，概念还挺多，最大的收获是知道了正则表达式的实现，但也因此多了更多的疑问，比如前几天那三个魔法。

Kleene 从 1950 年开始研究正则表达式，算算到现在也有 70 来年了，经久不衰，好像从什么神经活动那边演化过来的，很难想象这两者之间有关联。

书里还介绍很多参考资料，应该是论文啥的，随便翻了几篇之后果断弃了，显然不是我现在该看的。

封面图：Twitter 心臓弱眞君 @xinzoruo