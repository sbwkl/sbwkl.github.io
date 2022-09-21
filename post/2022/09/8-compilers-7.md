# 《编译原理》  day 7

今天是读《编译原理》的逻辑第 7 天，昨天还说以后有机会再试试分析中缀表达式，万万没想到今天的内容就是把中缀表达式转化为后缀表达式，缘，妙不可言。

它使用的翻译方案是嵌入语义动作，不知道咋滴，我更喜欢关联属性一点。

根据前几天的知识，带语义动作的中缀表达式文法是这样的

```
expr -> expr + term { print('+') }
      | expr - term { print('-') }
      | term

term -> 0 { print('0') }
      | 1 { print('1') }
      ...
      | 4 { print('4') }
```

这是左递归的，首要任务是消除左递归，然后它不知道从哪里掏出来了一个等价方案

```
A -> Aα | Aβ | γ
```

等价于

```
A -> γR
R -> αR | βR | ε
```

等价后的文法是这样的，rest 代表 R，term 的产生式不变

```
expr -> term rest
rest -> + term { print('+') } rest
      | - term { print('-') } rest
      | ε
```

这它老是掏出等价规则遭不住啊，这规则都不知道哪来的，有印象的数学书里都没见过这种等价规则。

按照非终结符写方法，终结符调用 `match` 方法的方式，写出来的伪代码长这样。

```
void expr () {
    term(); rest();
}

void rest () {
    if ( lookahead == '+' )  {
        match('+'); term(); print('+'); rest();
    } else if ( lookahead == '-' ) {
        match('-'); term(); print('-'); rest();
    } else {
        // 处理 ε 产生式，其实就是啥也不干
    }
}

void term() {
    if ( lookahead is a digit ) {
        // 这里用临时变量 t 保存 lookahead，调用 match 后 lookahead 会改变
        t = lookahead; match(lookahead); print(t);
    } else {
        report ("syntax error"); 
    }
}
```

然后意外收获又来了，对于一个递归方法，如果最后一句是调用自己，这种情况叫做 tail recursive（尾递归），对于没有入参的方法，尾递归可以改为跳转到方法开头。



更加详细的递归转迭代可以看看这篇：https://www.baeldung.com/cs/convert-recursion-to-iteration

