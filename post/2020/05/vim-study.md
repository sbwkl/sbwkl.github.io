u   撤销
ctrl + r 收回撤销
w   移动到下一个单词开头
e   移动到单词结尾处
i   光标处开始编辑
a   光标下一个单词处开始编辑
I   当前行开头开始编辑
A   当前行结尾开始编辑
$   移动到当前行结尾
^   移动到当前行开头
gg  移动到文档开头
GG  移动到文档结尾
/<word>     搜索文本
  n         下一处
  N         上一处
ctrl + w    连续两次切换窗口
:%s/foo/bar/g   全文 foo 替换为 bar
:%s/foo/bar/gc  询问是否替换
:6,10s/foo/bar/g  6 - 10 行 foo 替换为 bar
v       切换到选中模式
V       选中一行
ctrl + v   选中 block 
y       复制
yy or Y copy current line
y$      copy to the end of current line
yiw     copy the current word
yaw     copy the current word
yt[x]   copy to x not include x
yf[x]   copy to x include x
p       paste after cursor
P       paste before cursor
d       cut
ctrl + f    find a file
:edit <file path> edit file
:new <file path>  add file
:r <file path>    copy all content to current file
