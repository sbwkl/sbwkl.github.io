# 《编译原理》 day 16

今天是读《编译原理》的逻辑第 16 天，内容比较简单，介绍词法分析器生成工具 Lex。

我用的是 ubuntu 20.04 系统，没找到 lex 用了 flex 代替，应该差不多。

使用这个工具分三步

第一步创建配置文件，含了绝大多数工作，直接看例子

```text
%option noyywrap

%{
#define LT 0
#define LE 1
... 省略类似代码

int yylval = 0;
int installID();
int installNum();
%}

delim   [ \t\n ]
ws      {delim}+
letter  [A-Za-z]
digit   [0-9]
id      {letter}({letter}|{digit})*
number  {digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%
{ws}        {}
if          {return(IF);}
... 省略类似代码
{id}        {yylval = (int) installID(); return(ID);}
{number}    {yylval = (int) installNum(); return(NUMBER);}
"<"         {yylval = LT; return(RELOP);}
... 省略类似代码
%%

int installID() {
    printf("id is %s with size %d and ", yytext, yyleng);
    return yyleng;
}

int installNum() {
    printf("num is %s with size %d and ", yytext, yyleng);
    return yyleng;
}

#include <stdio.h>

int main() {
    extern int yylval;
    while(1) {
        yylval = -1;
        int r = yylex();
        printf("token is %d\n", r);
    }
}
```

整个文件分三段，用两个 `%%` 分隔，第一段配置声明，定义各种正则表达式

第一句为了解决一个错误 StackOverflow 找的。

定义在 `%{ ... %}` 中的内容原封不动的拷贝到输出文件，当 C 语言写就完了。这里定义了一些常量，声明两个函数，不声明也没事，多两个警告，无伤大雅。

第二段定义转换规则，格式为 Pattern { Action }，注意 Pattern 前面不要留空格。这里定义了几个关键字，标识符，数字和六个操作符。

第三段定义辅助函数，这部分也会原封不动拷贝到输出文件。这里定义两个函数和 main 函数，正常情况下 Lex 搭配 Yacc 使用，不需要 main 函数，这里为了看看几个变量。

两个函数体内容都是瞎写的，还是为了看看几个变量长啥样。

准备好配置文件后开始生成词法分析器，安装 Flex 命令

```
sudo apt-get install flex
```

用 flex 命令生成 .c 文件，默认为 lex.yy.c

```
flex lex.s.l
```

用 gcc 生成可执行文件，默认为 a.out

```
gcc lex.yy.c
```

执行 ./a.out，输入字符串 `if 1 > 12 print false` 得到执行结果

```
token is 6
num is 1 with size 1 and token is 10
token is 11
num is 12 with size 2 and token is 10
id is print with size 5 and token is 9
id is false with size 5 and token is 9
```

已经把 Token 都分析好了，唔唔唔……因吹斯汀。

封面图：Twiter 心臓弱眞君 @xinzoruo