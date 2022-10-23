# 《编译原理》 day 37

今天是读《编译原理》的逻辑第 37 天，学习使用 Recursive-Descent Parsing（递归下降分析）实现 SDT。

学了 LL 和 LR 之后我还以为再也不会用到递归下降了，这里居然又出现了，难不成这些方法之间不是递进关系。

函数大体没变，多了出入参，入参是继承属性，出参是综合属性。

以昨天的文法为例

```
S -> while( {
                L1 = new(); 
                L2 = new (); 
                C.true = S.next;
                C.false = L2;
            }
         C) {
                S1.next = L1;
            }
         S1 {
                S.code = label || L1 
                    || C.code 
                    || label || L2 
                    || S1.code
            }
```

非终结符的继承属性有 S.next，C.true，C.false，对应 S 有一个入参，C 有两个入参

```
String S(label next) {
    String S1_code, C_code;
    label L1, L2;
    if (lookahead == token while) {
        // match 函数往后移动一格 lookahead
        match(token while);
        match('(');
        L1 = new();
        L2 = new();
        C_code = C(next, L2);
        match(')');
        S1_code = S(L1);
        return (label || L1 || C_code || label || L2 || S1_code)
    } else {
        ...
    }
}
```

这种方式写代码有种当编译器的感觉，把 SDT 表示转化为代码表示，都不用思考，按照规则写就行了，奇妙的感觉。

上面这种实现有个问题，每次 S 调用都会产生很长的 code 属性，而且越来越长，不仅长还重复。

于是有了另一种叫做 On-The-Fly Code Generation 的技术。

On-The-Fly 怎么理解就千人千面了，根据不同的情况我理解为不落库，不落盘，一边读一边处理，也许有点像流式处理。

实现这个技术需要额外一些要素

1. 非终结符有主属性，比如 S.code，C.code
2. 主属性是综合属性
3. 主属性求值符合规则
   1. 通过连接产生式非终结符的主属性获得，可额外连接其他元素
   2. 连接主属性的顺序与产生式非终结符一致

好像说了什么，又好像什么也没说，看代码最直观


```diff
+ void S(label next) {
- String S(label next) {
-   String S1_code, C_code;
    label L1, L2;
    if (lookahead == token while) {
        match(token while);
        match('(');
        L1 = new();
        L2 = new();
+       print("label", L1);
+       C(next, L2);
-       C_code = C(next, L2);
        match(')');
+       print("label", L2);
+       S(L1);
-       S1_code = S(L1);
-       return (label || L1 || C_code || label || L2 || S1_code)
    } else {
        ...
    }
}
```

刚加的出参，一转眼又没了。

封面图：Twitter 心臓弱眞君 @xinzoruo