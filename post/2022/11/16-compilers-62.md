# 《编译原理》 day 62

今天是读《编译原理》的逻辑第 62 天，学习静态分配和栈分配，紧张刺激的算地址环节。

静态分配编译时确定，以函数调用为例，主要关注四条三地址代码

1. call callee: 跳转到 callee 首条指令
2. return: 返还控制
3. halt: 特殊的 return，相当于第一个函数的 return，返还控制给操作系统
4. action: 代表其他三地址代码

```c
// call 语句
ST callee.staticArea, #here + 20
BR callee.codeArea

// return 语句
BR *callee.staticArea
```

Talk is cheap，两个函数 c 和 p 的三地址代码

```c
// 函数 c
action1
call p
action2
halt

// 函数 p
action3
return
```

假设

1. 指令和地址占 4 byte
2. 每个 action 占 20 byte
3. 函数 c 首条指令在地址 100
4. 函数 p 首条指令在地址 200
5. 活动记录保存在 300，364

生成的指令可能是这样的

```c
100: ACTION1
120: ST 364, #140   // ST 指令占 3 * 4 = 12 byte，下一条指令地址在 132
132: BR 200         // BR 指令栈 2 * 4 = 8 byte，下一条指令在 140
140: ACTION2
160: HALT
...
200: ACTION 2
220: BR *364        // 地址 364 保存返回地址 #140
...
300:                // c 的活动记录
304:
...
364:                // p 的活动记录
368:
```

栈分配更加复杂，使用栈指针跟踪

```c
// 函数 m
action 1
call q
action 2
halt

// 函数 p
action 3
return

// 函数 q
action 4
call p
action 5
call q
action 6
call q
return
```

额外假设

1. 函数 m 的活动记录长度 msize
2. 函数 p 的活动记录长度 psize
3. 函数 q 的活动记录长度 qsize
4. 栈从 600 开始

```c
100: LD SP, #600        // 初始化栈，寄存器 SP 不占空间，下一条指令在 108
108: ACTION 1   
128: ADD SP, SP, #msize // 栈指针指向 q 活动记录
136: ST 0(SP), #152     // 填充返回地址 #152
144: BR 300             // 调用 q 函数
152: SUB SP, SP, #msize // 栈指针指回 m 活动记录
160: ACTION 2
180: HALT
...
200: ACTION 3
220: BR *0(SP)          // 取出地址，返回 caller
...
300: ACTION 4
320: ADD SP, SP, #qsize
328: ST 0(SP), #344
336: BR 200
344: SUB SP, SP, #qsize
352: ACTION 5
372: ADD SP, SP, #qsize
380: ST 0(SP), #396
388: BR 300
396: SUB SP, SP, #qsize
404: ACTION 6
424: ADD SP, SP, #qsize
432: ST 0(SP), #440
440: BR 300
448: SUB SP, SP, #qsize
456: BR *0(SP)
...
600                     // 栈初始地址
```

这个过程中，随着递归调用，栈不断增长，函数返回，栈收缩，自始至终 SP 都在跟踪活动记录。

算地址有个恶心的地方，只要中途有一个地址算错，后面全错，要是没全错那更恐怖。

封面图：Twitter 心臓弱眞君 @xinzoruo