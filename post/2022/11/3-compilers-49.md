# 《编译原理》 day 49

今天是读《编译原理》的逻辑第 49 天，第 6 章小结。

+ Pick an intermediate representation: 语法树和三地址代码是常用的中间表示
+ Translate expressions: 根据中间表示可能创建语法树节点，可能生成三地址代码
+ Check types: 类型由操作符和子表达式确定，隐式转换和显式转换
+ Use a symbol table to implement declarations: 声明指定一个新类型，它的宽度表示存放这个类型需要的空间，使用符号表保存这些信息
+ Flatten arrays: 数组扁平化，第一次见到这个词是 Stream 的 flatMap 方法，当时就觉得这个方法很别扭，现在慢慢接受了
+ Generate jumping code for boolean expressions: 布尔表达式被翻译为跳转代码，继承属性 true 和 false 标记对应的出口
+ Implement statements using control flow: 使用 next 属性配合上一条实现翻译
+ Alternatively, use backpatching: 一趟搞定的可选技术
+ Implement records: 和声明差不多东西

这样，上半就读完了，主要介绍前端编译器，更贴近源代码，接下来的后端编译器更贴近机器。

上半一共用了逻辑 49 天，物理 51 天，断了两天。蛮意外的，没想到真能坚持下来，开始只是抱着试试看的心态。

这段时间有好有坏，好的一面更加有节奏，坏的一面几乎不能十点前睡觉，而且挤占了原来刷文章的时间。

仔细算下来一天 24 小时，12 小时在公司和路上，8 小时睡觉，能支配的也就不到 4 小时，我感觉 B 站都快戒掉了，去年 B 站我可是全勤的。

再多苟几年，苟到乞丐版自由就能放飞自我了。

封面图：Twitter 心臓弱眞君 @xinzoruo