# 《编译原理》 day 56

今天是读《编译原理》的逻辑第 56 天，继续 GC 算法。

两个减少 the world 时间的思路

1. Incremental collection: GC 和增变者交替运行
2. Partial collection: 分割地址空间，每次 GC 回收部分空间

增变者在 GC 期间的操作导致可达集合变化，分配新对象，集合扩大，失去引用，集合缩小。

New 表示新分配的对象，Lost 表示丢失引用变得不可达的对象，那么最终的对象集合在 (R U New) - Lost 和 R U New 之间，没有被回收的垃圾称作 floating garbage（漂浮垃圾），理论上漂浮垃圾越少越好。

昨天的 GC 算法如果不做处理，会有问题，比如对于 Scanned 对象 o<sub>1</sub>，如果增变者设置 o<sub>1</sub>.r = o，因为 o<sub>1</sub> 已经被扫描，GC 不会再扫一次，那么 o 可能被当垃圾处理，有三种方法

+ Write Barriers: 截获 o<sub>1</sub>.r = o 这样的写操作，这里的 o<sub>1</sub> 是 Scanned 对象，o 是 Unreached 对象，把 o 或者 o<sub>1</sub> 放入 Unscanned 重新扫描
+ Read Barriers: 截获 o<sub>1</sub>.r 这样的读操作，这里的 o<sub>1</sub> 是 Unreached 或 Unscanned 对象，把 o<sub>1</sub>.r 指向的对象放入 Unscanned
+ Transfer Barriers: 这个没怎么看明白，应该是类似写操作，只是 o<sub>1</sub> 是 Unreached 或 Unscanned 对象，放入 Unscanned 的是引用，不过不重要，这个方法没啥竞争力

通常增变者读多写少，算下来写屏障最有效，有两种实现方式

1. 用一个表记录 o<sub>1</sub>.r = o 中赋值后的 r
2. 记录发生写操作的位置，准确的位置不重要，于是又有三个变种
   1. 记录包含被写字段的对象，这样多个字段被改也只记录一次
   2. 将空间分成固定大小的块，叫做 card（卡片），用 1 bit 表示是否被写过，这样 card 内的多个对象被改也只记录一次
   3. 包含了 Scanned 的页设置保护状态，这样尝试写入会出发异常控制流，一页一次

三个变种方法都是用多扫描几个对象，换取更少的存储占用。

结合标记-复制算法还要额外多些操作，标记-复制算法有两个半空间，意味着某个时刻，同一个对象可能有两个地址。

一种办法是增变者在 From 空间完成运算，GC 结束时更新所有指针，拷贝内容。另一种办法是直接在 To 空间操作，当增变者尝试访问 From 空间的指针，GC 把它翻译成 To 空间的指针。

这玩意儿发展到后面应该就是初始标记和最终标记吧。

封面图：Twitter 心臓弱眞君 @xinzoruo