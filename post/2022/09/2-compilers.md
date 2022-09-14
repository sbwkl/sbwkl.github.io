# 《编译原理》day 1

这本书的大名上大学那会儿就听过，是程序员必读的经典之一，然而那时候哪有思想觉悟，沉迷魔兽无法自拔。时隔多年，还是要为当初的年少轻狂买单，补一补这本经典。

这本书是计算机科学的拼图之一，高级语言和低级语言的桥梁。

编译系统的工作简单说就是把一种语言转化成另一种语言（机器语言）。

编译型语言和解释型语言的区别：编译型语言首先把源程序编译成目标程序，根据输入得到输出。解释型语言输入混合源程序得到输出。

Java 语言特别有意思，源程序编译成中间程序，没热身前是解释型语言，热身后热点程序编译成目标程序，又成了编译型语言。

一般来说编译型语言性能好一点，为此 Java 内置了好几个编译器。

编译系统分成几个部分：Lexical Analyzer, Syntax Analyzer, Semantic Analyzer, Intermediate Code Generator, Machine-Independent Code Optimizer, Code Generator, Machine-Dependent Code Optimizer。

术语还是英文直观，有些翻译总觉得怪怪的，比如文法这个翻译，可能我语文太差，理解不能。

总体思想就是先把源代码（字符串）拆小，然后再合并生成代码，有点像归并算法。

1. Lexical Analysis(scanning): 把字符流拆成叫做 lexeme 的最小单元，一个 lexeme 对应一个 token
2. Syntax Analysis(parsing): 用树形结构表示 token 流
3. Semantic Analsis: 检查源程序是否语义一致，比如类型检查
4. Intermediate Code Generator: 把源程序翻译成一个或多个中间表示，语法树就是其中一种，后面还有 three-address code
5. Code Optimization: 如字面意思，改进中间表示，力图生成更好的目标代码
6. Code Generator: 把中间表示映射成目标语言，比如映射成汇编语言，最终汇编成机器码

优化阶段本来是可选的步骤，却演化成系统里最复杂的组件，成为编译系统核心竞争力，甚至能影响硬件的设计。

编译器使用符号表记录各种信息，符号表贯穿整个编译过程，需要啥信息都可以考虑去符号表查一查

今天就看这么多了，但目前为止都还好理解，不过这种书崩溃就在一两节之间，希望这一天来的晚一点。

封面图：Twiter 心臓弱眞君 @xinzoruo