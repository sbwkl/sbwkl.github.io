# 《编译原理》 day 59

今天是读《编译原理》的逻辑第 59 天，第 7 张小结。

+ Run-Time Organization: 代码区、静态区、堆、栈
+ Control Stack: 管理函数调用和返回
+ Stack Allocation: 存放活动记录
+ Access to Nonlocal Data on the Stack: 访问链
+ Heap Management: 管理生命周期不确定的对象
+ Exploiting Locality: 空间局部性、时间局部性
+ Reducing Fragmentation: 合适的对象放置策略，合并相邻空闲块
+ Manual Deallocation: 内存泄漏、悬空指针引用
+ Reachability: 从根集/记忆集出发，存在到达对象的路径
+ Reference-counting Collectors: 维护被引用的次数
+ Trace-Based Collectors: 周期性跟踪对象可达性
+ Mark-and-Sweep Collectors: 标记可达对象，清理不可达对象
+ Mark-and-Compact Collectors: 标记并重定位可达对象
+ Copying Collectors: 倒腾两个半空间
+ Incremental Collectors: GC 和增变者并发运行
+ Partital Collections: 分代回收、列车算法

大半的内容都和堆管理有关，有点小失望，本来期待着它能整点花活出来。

但后面想想，运行时环境主要的工作是 name 到 address 的映射，似乎确实没有施展空间，再一个这块不同语言之间差别极大，它能讲的也只有通用的思想和概念，真要看细节还得去看特定语言的实现。

封面图：Twitter 心臓弱眞君 @xinzoruo