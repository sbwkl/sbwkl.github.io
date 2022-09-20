# 《编译原理》 day 6

今天是读《编译原理》的逻辑第 6 天，它要来回答第 3 天的疑问（如何生成分析树）了，问题能不能解就看今天能不能看懂了。

语法分析方法有很多，我学到的是 Top-Down Parsing 下的 Predictive Parsing，翻译过来叫做自顶向下分析方法中的预测分析法，不过说实在我没看出哪里预测了。

使用它需要满足条件，根据第一个终结符可以唯一确定产生式（wiki 上说条件可以放宽到前几个），在前缀、中缀、后缀表达式中，只有前缀表达式能满足这个条件，于是我准备尝试下。

简单起见，终结符只包含 0 ~ 4 + -，一个产生式，空格直接跳过。

```
S -> + S S | - S S | 0 | 1 | 2 | 3 | 4
```

```
public class Parser {

    private char lookahead;
    private int lookaheadIndex = 0;
    private final String input = "- 2 + 1 + - 0 3 4";

    public static void main(String[] args) {
        new Parser().parse();
    }

    public void parse() {
        lookahead = input.charAt(lookaheadIndex);
        s();
    }

    public void s() {
        switch (lookahead) {
            case '+':
                match('+');
                s();
                s();
                break;
            case '-':
                match('-');
                s();
                s();
                break;
            case '0':
                match('0');
                break;
            // ... 省略格式差不多的代码
            case '\0':
                break;
            default:
                throw new RuntimeException("Syntax error");
        }
    }

    public void match(char terminal) {
        if (Objects.equals(lookahead, terminal)) {
            lookahead = nextTerminal();
        } else {
            throw new RuntimeException("Syntax error");
        }
    }

    public char nextTerminal() {
        char t = ' ';
        while (Objects.equals(t, ' ')) {
            lookaheadIndex++;
            if (lookaheadIndex >= input.length()) {
                t = '\0';
                break;
            }
            t = input.charAt(lookaheadIndex);
        }
        return t;
    }
}

```

根据书中的解释，维护 lookahead 对象指向当前的终结符。每个非终结符对应一个方法，比如 S。方法体的实现根据产生式右边确定，比如产生式 `S -> + S S` 那么方法体就是 `match('+'); s(); s();`，而产生式 `S -> 0` 对应的方法体是 `match('0');`，match 方法每次往后移动 lookahead。

这段代码从概念上已经构造了分析树，只是没有物理意义上的构造出来，这样太抽象，我准备结合昨天的内容加点代码，把前缀表达式转化成中缀表达式。

```
public class Translation {

    private char lookahead;
    private int lookaheadIndex = 0;
    private final String input = "- 2 + 1 + - 0 3 4";

    public static void main(String[] args) {
        new Translation().parse();
    }

    public void parse() {
        lookahead = input.charAt(lookaheadIndex);
        Node root = s();
        System.out.printf("infix expr: %s\neval value: %s\n", root.t, root.v);
    }

    public Node s() {
        Node node = new Node();
        Node s1, s2;
        switch (lookahead) {
            case '+':
                match('+');
                s1 = s();
                s2 = s();
                node.t = String.format("(%s + %s)", s1.t, s2.t);
                node.v = s1.v + s2.v;
                break;
            case '-':
                match('-');
                s1 = s();
                s2 = s();
                node.t = String.format("(%s - %s)", s1.t, s2.t);
                node.v = s1.v - s2.v;
                break;
            case '0':
                match('0');
                node.t = "0";
                node.v = 0;
                break;

            // ... 省略代码
        }
        return node;
    }

    // ... 省略代码

    public static class Node {
        public String t;
        public int v;
    }
}
```

运行输出

```
infix expr: (2 - (1 + ((0 - 3) + 4)))
eval value: 0
```

其实我多这段代码还是很怀疑的，我不确定它做了什么，但是它似乎真的在工作，这也许就是软件开发的魅力吧。


