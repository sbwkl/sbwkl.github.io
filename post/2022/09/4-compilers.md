# 《编译原理》 day 3

今天是阅读《编译原理》的逻辑第 3 天，看到一个叫产生式的东西，以 Java 的 if 语句为例，大概长这个样子

```
stmt -> if ( expr ) stmt else stmt
```

代表的意思是左边的 stmt 可以用右边的表达式来表示。这里面的三个 stmt 虽然拼写一样，但表达的是不同的内容，可以把它们想象成 Stmt 类的三个对象，有时会用下标以示区别。

在这个式子里，stmt 叫做非终结符号，if ( ) else 叫做终结符号。这俩的区别就是能不能用表达式来表示，能-非终结，不能-终结。

一段程序经过解析最终由一大堆终结符组成。

举个例子

```
list -> list + digit | list - digit | digit
digit -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
```

竖线表示「或」的关系，这里有 12 个终结符，0~9,+,-

这两个（或者说 13 个）能够表示所有 10 以内的加减表达式。


看了语法的定义。



<!-- 第二章（A Simple Syntax-Directed Translator） -->

在第一章中介绍了 Lexical, Syntax, Semantic，分别翻译成词法，语法，语义，越来越大。

Syntax 描述程序的正确形式，Semantic 描述程序的含义。使用 semantic 来描述语言难度太大，于是选择用 syntax 来描述，用 context-free grammars 描述，这个翻译叫上下文无关文法。

context-free grammer 由四部分组成

1. 终结符号集合
2. 非终结符号集合
3. 产生式集合
4. 指定一个非终结符当做开始

以 Java 为例，比如 if-else 语法，一般这么写（省略了花括号）， if ( expr ) stmt else stmt，if-else 语句本身又是句子

if, else 是终结符号，stmt 是非终结符号，产生式 

