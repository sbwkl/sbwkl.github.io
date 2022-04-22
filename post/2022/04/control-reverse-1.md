# 我对控制反转的理解

REPL (read eval print loop)

caller --> callee

系统系统 BIOS --> BOOT --> OS

OS 经过一槽子操作，也就是开始时日常看到的画面，最后显示桌面等到用户输入（windows）或者打开 shell 等待用户输入（Linux）

OS 刘备借荆州有借没还

while (true) {
    cmd = read()
    if (cmd == "关机") {
        break
    }
    out = eval(cmd)
    print(out)
}

控制从 caller 传给 callee


观察者模式

从观察者模式衍生到 GUI 编程，GUI 编程更好理解 MVC 模式，至少比 web 编程容易理解。

MVC 模式中 M 最重要，它不仅仅是 POJO 就是那个只有一堆属性和 get set 方法的类，从 java 语言来说，把它理解为 service 更加合适


框架和工具库的区别

jquery, apache common 是工具库

spring, vue 是框架

这里 spring 反转了什么？

spring 反转了 new 对象的控制，正常来说要创建对象，需要程序员显式的 new XxxObject() 对象，但是 spring 反转了这个过程，改成了 context.getBean('xxxObject') 然后程序员只要按照 spring 规定的格式配置即可。这个是我理解的 spring 控制反转。
