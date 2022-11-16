# 《编译原理》 day 61

今天是读《编译原理》的逻辑第 61 天，学习目标语言，与其叫目标语言，不如直接说是目标机指令集。

简单的目标机通常支持的操作指令，操作数一般是地址

+ Load operations: LD dst, addr，加载 addr 的值到目标地址 dst，赋值操作
+ Store operations: ST x, r，保存寄存器 r 的值到目标地址 x，还是赋值操作
+ Computation operations: OP dst, src<sub>1</sub>, src<sub>2</sub>，OP 对应加减乘除这些，运算 src<sub>1</sub>, src<sub>2</sub>，保存结果到 dst
+ Unconditional jumps: BR L，无条件跳转到标号为 L 的指令，L 一般是指令地址
+ Conditional jumps: Bcond L，有条件跳转

支持的寻址模型，x，a 是变量，r 是寄存器

+ `x`: 变量 x 所在的地址，x 的左值，LD R<sub>1</sub>, x 代表 R<sub>1</sub> = x
+ `a(r)`: 变量 a 地址偏移 r 的地址，LD R<sub>1</sub>, a(R<sub>2</sub>) 代表 R<sub>1</sub> = contents(a + contents(R<sub>2</sub>))
+ `100(r)`: 同上，LD R<sub>1</sub>, 100(R<sub>2</sub>) 代表 R<sub>1</sub> = contents(100 + contents(R<sub>2</sub>))
+ `*100(r)`: 间接寻址，100(r) 是地址，它保存的值也是地址。LD R<sub>1</sub>, *100(R<sub>2</sub>) 代表 R<sub>1</sub> = contents(contents(100 + contents(R<sub>2</sub>)))
+ `#100`: 常量，LD R<sub>1</sub>, #100 代表 R<sub>1</sub> = 100，这个应该就是立即数吧

它或许会迟到，但一定不缺席，看到这些寻址方式，头又开始痛了，表面看这是寻址方式，实际上是 dot，每秒都在造成伤害。

```c
// x = y - z
LD  R1, y
LD  R2, z
SUB R1, R1, R2
ST  x, R1

// b = a[i] 假设数组的元素占 8 byte
LD  R1, i
MUL R1, R1, 8
LD  R2, a(R1)
ST  b, R2

// a[j] = c
LD  R1, c
LD  R2, j
MUL R2, R2, 8
ST  a(R2), R1


// x = *p
LD R1, p
LD R2, 0(R1)
ST x, R2

// *p = y
LD R1, p
LD R2, y
ST 0(R1), R2

// if x < y goto L
LD   R1, x
LD   R2, y
SUB  R1, R1, R2
BLTZ R1, L          // BLTZ = B LT Z，LT = 小于, Z = zero
```

这东西吧，看看勉强能看懂，写写就寄了。

封面图：Twitter 心臓弱眞君 @xinzoruo