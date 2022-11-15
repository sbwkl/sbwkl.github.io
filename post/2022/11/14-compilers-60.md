# 《编译原理》 day 60

今天是读《编译原理》的逻辑第 60 天，学习代码生成器。

设计目标

1. 正确性，代码生成器特殊情况特别多
2. 易实现、易测试、易维护

嘶……感觉说了，又感觉啥也没说。

代码生成器把 IR（中间表示）转化成高效目标程序，有三个主要任务：instraction selection（指令选择）、register allocation and assignment（寄存器分配和指派）、instruction ordering（指令排序）。

输入 IR 和符号表，输出目标程序，IR 有多种形式，四元式、三元式、间接三元式、语法树、DAG。前端编译生成的 IR 可能会经过多个优化器，转化为更靠近机器的 IR，目标机器常见的架构有三种 CISC、RISC、stack based。

+ RISC: 相对简单的指令集，简单的寻址方式，寄存器多，三地址指令
+ CISC: 指令集丰富，多种寻址方式，多种类型寄存器，两地址指令
+ Stack based: 操作数保存在栈，需要频繁移动数据

Stack based 差点跪了，全靠 jvm 救一手。

指令选择的复杂性因子

1. IR 的层次：层次越高越难生成高效的代码
2. 指令集架构：不同的指令集对不同的数据结构有优化，比如浮点运算
3. 生成代码的质量：生成朴实的代码很容易，生成优雅的代码很难

寄存器分配和指派

> + Register allocation, during which we select the set of variables that will reside in registers at each point in the program.
> + Register assignment, during which we pick the specific register that a variable will reside in.

这两句来来回回看了几遍，总觉得是在说一件事。

指令排序影响执行效率，调整顺序减少中间变量的保存和加载，更好的利用局部性。

封面图：Twitter 心臓弱眞君 @xinzoruo