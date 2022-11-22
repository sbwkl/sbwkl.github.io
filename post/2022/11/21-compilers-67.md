# 《编译原理》 day 67

今天是读《编译原理》的逻辑第 67 天，学习 peephole optimization（窥孔优化）。

一些编译器先直接生成原始代码，然后通过优化提高代码质量，窥孔优化是其中一种。

窥孔优化的项目和基本块优化差不多，也有死代码消除，代数化简这些。

窥孔是程序上一个小的滑动窗口，不要求窗口中的代码连续，然后优化其中的代码。

消除冗余指令，窥孔发现指令序列

```
LD R0, a
ST a, R0
```

如果两个指令在一个基本块，消除 ST 指令。

消除不可达代码，窥孔发现指令序列

```
    if debug == 1 goto L1
    goto L2
L1: print debugging information
L2: 
```

消除 `goto L2` 指令

```
    if debug != 1 goto L2
    print debugging information
L2: 
```

控制流优化，窥孔发现指令序列

```
    goto L1
    ...
L1: goto L2
```

L1 立即跳转 L2，那么越过 L1 直接跳转 L2

```
    goto L2
    ...
L1: goto L2
```

代数化简和之前一样，利用恒等式和各种律化简

使用机器特有的指令，一些机器有 `INCR` 指令，那么在生成 `x = x + 1` 指令时可以使用 `INCR`。

这节看下来有点迷，感觉不得劲。

封面图：Twitter 心臓弱眞君 @xinzoruo