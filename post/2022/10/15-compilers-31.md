# 《编译原理》 day 31

今天是读《编译原理》的逻辑第 31 天，学习语法分析器生成工具 Yacc。

Yacc 全称 yet another compiler-compiler，大意是编译器的编译器。我使用的 Ubuntu 20.04 系统没有 yacc 软件包，使用 bison 代替。

```
sudo apt-get install bison
```

Yacc 的配置文件和 Lex 非常类似，用 `$$` 分成三段，第一段声明，第二段翻译规则，第三段辅助函数，文法写在第二段。

举个例子

```yacc
%{
#include <ctype.h>
#include <stdio.h>

int yylex();
void yyerror(char *s);
%}

%token DIGIT

%%
lines   : lines expr '\n'   {printf("%d\n", $2);}
        | lines '\n'
        | 
        ;
expr    : expr '+' term     {$$ = $1 + $3;}
        | term
        ;
term    : term '*' factor   {$$ = $1 * $3;}
        | factor
        ;
factor  : '(' expr ')'      {$$ = $2;}
        | DIGIT
        ;
%%
int yylex(){
    int c;
    c = getchar();
    if (isdigit(c)) {
        yylval = c - '0';
        return DIGIT;
    }
    return c;
}

void yyerror(char *s) {
    printf("error: %s\n", s);
}

int main() {
    return yyparse();
}
```

这个文件定义算数表达式文法，第二段花括号的内容是嵌入的语义动作，`$$` 表示产生式左边的属性值，`$1`，`$3` 表示产生式右边第 1，3 符号的属性值，第二个符号是 +。没有语义动作的产生式使用默认语义动作 `$$ = $1` 即拷贝属性值。

编译生成可执行文件

```
yacc figure-4.58.y
gcc y.tab.c
```

执行 `./a.out` 输入 1 + 1 得到结果 2，现在的表达式不能有空格

```
1+1
2
```

结合 Lex 词法分析器

```
%option noyywrap
%{
%}
number      [0-9]+\.?|[0-9]*\.[0-9]+
%%
[ ]         {}
{number}    {sscanf(yytext, "%lf", &yylval); 
            return NUMBER;}
\n|.        {return yytext[0];}
%%
```

C 语言苦手，这段看懂个大概，yytext 是词法分析的结果数字 ＋* 这些，通过 yytext 计算 yylval。NUMBER 应该 yacc 已经定义了，我自定义 NUMBER=257 提示重定义。

用 `man sscanf` 查了下，这个函数应该是把 yytext 解析成 yylval，我刚开始理解反了。yylval 应该就是 yacc 语义动作中的 `$1` `$3` 这些。

对应的 yacc 的文件需要调整下

```diff
+ #define YYSTYPE double
// ...省略
- %token DIGIT
+ %token NUMBER
// ...省略
- int yylex(){
-     int c;
-     c = getchar();
-     if (isdigit(c)) {
-         yylval = c - '0';
-         return DIGIT;
-     }
-     return c;
- }
+ #include "lex.yy.c"
// ... 省略
```

修改不多，去掉自定义的 yylex 方法，换成 Lex 生成的代码，另一个就是 DIGIT 换成 NUMBER 支持多位数字,根据正则描述应该还支持 .2 或者 2. 这样的数字。

然后编译生成可执行文件，lex.yy.c 不用单独编译，它被包含到 y.tab.c 文件了

```
flex figure-4.58.l
yacc figure-4.58.y
gcc y.tab.c
```

这节还有其他一些内容，看不懂都跳了，都是些神奇的思路。

比如使用二义性文法，这文法还能用我是没想到的，前面一直强调不要有二义性。

比如错误恢复，说到错误恢复，恐慌模式一定不缺席。实际应用中，错误恢复程序会加到分析表。

这些新奇的玩意儿 yacc 都支持，真强，看看自己的 CURD 代码，好嫌弃啊。

封面图：Twitter 心臓弱眞君 @xinzoruo