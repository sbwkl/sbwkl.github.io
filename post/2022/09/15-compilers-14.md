# 《编译原理》 day 14

今天是读《编译原理》的逻辑第 14 天，又到了练习时间，我有个预感，这练习不做后面章节可能看不懂。

练习：正则表达式转语言

$$
\begin{aligned}
\text{1. } &a(a|b)^*a  \\
\text{2. } &((ε|a)b^*)^*  \\
\text{3. } &(a|b)^*a(a|b)(a|b) \\
\text{4. } &a^*ba^*ba^*ba^* \\
\text{!!5. } &(aa|bb)^*((ab|ba)(aa|bb)^*(ab|ba)(aa|bb)^*)^*
\end{aligned}
$$

解：

1. a 开头，a 结尾只包含 a b 的字符串
2. 包含 a b 的字符串
3. 包含 a b 且以 aaa, aab, aba, abb 结尾的字符串
4. 包含 a b 且有 3 个 b 的字符串
5. 放弃

练习：长度为 n 的字符串，有多少个

```
 a) 前缀
 b) 后缀
 c) 真前缀
!d) 子串
!e) 子序列
```

解：

```
a) n + 1 个
b) n + 1 个
c) n - 1 个，少了本体和空串
d) C(n + 1, 2) + 1，额外的 1 是空串。
   好像是《离散数学》计数章节的例题，
   n 的长度有 n + 1 个间隔，含头尾，
   取两个间隔得到一个子串
e) 2^n 
```

练习：语言转正则表达式

1. 包含元音的小写字母串，元音按顺序出现
2. 所有按字典顺序出现的小写字母组成的串
3. 注释，被 /* */ 包围，且不能出现 */ 除非用双引号包住
4. 所有不重复数字的串
5. 所有最多有一位重复数字的串
6. 所有由偶数个 a 和奇数个 b 构成的串
7. 以非正式方式表示的国际象棋的步法的集合，如 p-k4 或 kbp * qn
8. 所有由 a b 组成且不包含子串 abb 的串
9. 所有由 a b 组成且不包含子序列 abb 的串

```text
1. other -> [^aeiou] // 这个 ^ 是补操作，不是开头的意思
   string -> other*a(other|a)*
   e(other|e)*i(other|i)*
   o(other|o)*u(other|u)* 

2. a*b*c*...z*

3. ex_1 -> [^*"]
   ex_2 -> [^/]
   body -> (ex_1)*|".*"|(ex_2)*
   comment -> \/\*body*\*\/
   感觉有点不对劲

4. 不会

5. 更不会

6. 不会

7. 不懂象棋

8. 不会

9. 不会
```

崩了呀，一眼望过去全是不会，这还怎么玩，直接可以扁鹊三连了。

有没有天使可以救一下。

封面图：Twiter 心臓弱眞君 @xinzoruo