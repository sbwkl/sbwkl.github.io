# 《编译原理》 day 7

今天是读《编译原理》的逻辑第 7 天，昨天还说以后有机会再试试分析中缀表达式，万万没想到今天的内容就是把中缀表达式转化为后缀表达式，缘，妙不可言。

它使用的翻译方案是嵌入语义动作，不知道咋滴，我更喜欢关联属性的方案。

根据前几天的知识，带语义动作的中缀表达式文法是这样的

```
expr -> expr + term { print('+') }
      | expr - term { print('-') }
      | term

term -> 0 { print('0') }
      | 1 { print('1') }
      ...
      | 9 { print('9') }
```

这是左递归文法，首要任务是消除左递归，然后它不知道从哪里掏出来了一个等价方案，说是产生式

```
A -> Aα | Aβ | γ
```

等价于

```
A -> γR
R -> αR | βR | ε
```

这哪遭的住啊，都不知道哪来的规则，昨天掏出来一个，今天又掏出来一个，这玩意儿怕不是某个数学分支。

先不管了，等价后的文法是这样的，term 的产生式不变

```
expr -> term rest
rest -> + term { print('+') } rest
      | - term { print('-') } rest
      | ε
```

按照非终结符对应方法，终结符对应调用 `match` 方法，写出来的伪代码长这样。

```
void expr() {
    term(); rest();
}

void rest() {
    if (lookahead == '+')  {
        match('+'); 
        term(); 
        print('+'); 
        rest();
    } else if (lookahead == '-') {
        match('-'); 
        term(); 
        print('-'); 
        rest();
    } else {
        // 处理 ε 产生式，其实就是啥也不干
    }
}

void term() {
    if (lookahead is a digit) {
        t = lookahead; 
        match(lookahead); 
        print(t);
    } else {
        report("syntax error"); 
    }
}
```

然后意外收获来了，书里演示了一把递归转迭代。

这个技巧以前在数学书上见过，没想到在这里能遇到。

对于一个递归方法，如果最后一句调用自己，这种情况叫做 tail recursive（尾递归），尾递归可以改为跳转到方法开头。

讲真没怎么看懂，但是收获一个关键词，搜索找到一篇更加详细的说明。

> https://www.baeldung.com/cs/convert-recursion-to-iteration

rest 方法体的 + - 两个分支最后一句都是调用 rest，于是 rest 改写为

```
void rest() {
    while (true) {
        if (lookahead == '+') {
            match('+'); 
            term(); 
            print('+'); 
            continue;
        } else if (lookahead == '-') {
            match('-'); 
            term();
            print('-'); 
            continue;
        }
        break;
    }
}
```

改写 rest 后，只有方法 expr 调用 rest，那么可以直接内联到 expr，所谓内联就是把被内联到方法里的代码拷贝到调用它的方法里，然后删掉被内联到方法。

```
public class Infix2PostfixTranslator {

    public static void main(String[] args) {
        Parser parser = new Parser("9 - 5 + 2");
        parser.expr();
        System.out.println();
    }

    static class Parser {
        int lookahead;
        int lookaheadIndex;
        String input;
        Parser(String input) {
            this.input = input;
            lookaheadIndex = 0;
            lookahead = input.charAt(lookaheadIndex);
        }

        void expr() {
            term();
            while(true) {
                if (lookahead == '+') {
                    match('+');
                    term();
                    System.out.print('+');
                } else if (lookahead == '-') {
                    match('-');
                    term();
                    System.out.print('-');
                } else {
                    return;
                }
            }
        }

        void term() {
            if (Character.isDigit((char) lookahead)) {
                char t = (char) lookahead;
                match(lookahead);
                System.out.print(t);
            } else {
                throw new RuntimeException("syntax error");
            }
        }
        // ... 省略部分代码
    }
}
```

唔唔唔……果然看着都挺简单的，昨天自己写卡了半天，这也许就是软件开发的魅力吧。

封面图：Twiter 心臓弱眞君 @xinzoruo