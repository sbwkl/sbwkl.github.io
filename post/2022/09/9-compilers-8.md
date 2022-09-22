# 《编译原理》 day 8

今天是读《编译原理》的逻辑第 8 天，学习 Lexical Analysis（词法分析）。根据之前的知识，词法分析主要工作是读取输入的字符，组成有意义的单元 token。

在此之前操作符也好，操作数也好都只包含一个字符，有了它就可以突破这个限制，能够支持 31 + 28 + 59 这样的表达式，它会被表示为这样的形式

```
<num, 31> <+> <num, 28> <+> <num, 59>
```

如果把尖括号看做一个整体 a，那么这个表达式简化为 `a + a + a`，唔唔唔……这个形式看着有点眼熟。

这种忽略细节当做整体的思想，在数学和计算机科学的书里随处可见，每次见到都直呼 666。

词法分析工作内容

1. 移除空格和注释
2. 预读字符确定哪类 Token
3. 识别常量 Token，像数字 31 这样的
4. 识别关键词和标识符，关键字是预留的固定字符串 for, if 这样的，标识符是变量名、函数名这些

Token 的定义，字段 tag 区分是哪种 Token。

```
public class Token {
    public final int tag;
}
```

用键值对 words 识别关键字和标识符，关键字是固定的，标识符可以无限增加。关键词预先塞入 words 中，如果用关键字作为变量名，那么词法分析会识别为关键字而不是标识符。

```
// s 是词法分析识别的字符串
Word w = words.get(s)
if (w != null) {
    return w;
}
w = new Word(Tag.ID, s)
words.put(s, w);
reutrn w;
```

最重要的 scan 方法，处理数字、关键字、标识符和各种操作符，扩展其他类型的 token 也在这里

```
Token scan() {
    skip white space & comment;
    handle number;
    handle keyword & identifers;
    Token t = new Token(peek);
    peek = ' ';
    return t;
}
```

完整版的代码书里有，这里就不贴了，蛮有意思的，还解决了前几天代码里的一个问题，用 `System.in.read()` 读下一个字符比 `charAt` 好使多了。

封面图：Twiter 心臓弱眞君 @xinzoruo