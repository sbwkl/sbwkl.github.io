# 我对控制反转的理解

在计算机系统里控制（或者控制流）是独立语句、指令或者函数调用的顺序。

语句比较简单，从上往下执行，控制从上往下传递。

函数调用涉及两个角色，调用者 (caller) 和被调用者 (callee)，这个时候可以说 caller 控制 callee，控制从 caller 传递给 callee 然后不断重复。

作为一个 java 开发，最早的控制来自 main 函数，无论外面怎么变化，只要 java 进程正常启动，控制最终都会传递到 main 函数，然后由开发来编写逻辑。

控制反转就是反转了调用者和被调用，用观察者模式举例。

一个 model-view 场景，通常认为是 view 调用 model 取得数据，然后展示，代码大概长这样。

```java
public static void main(String[] args) {
    View v1 = new View1();
    v1.display();
}

public static interface View {
    void display();
    void display(Object o);
}

public static class View1 implements View {

    @Override
    public void display() {
        Model model = new Model();
        display(model.getData());
    }

    @Override
    public void display(Object o) {
        System.out.println("View1 : " + o);
    }
}

public static class Model {

    public Object getData() {
        return "model msg";
    }
}
```

控制从 main 传递到 View1 的 display 方法，这个方法控制 Model 完成数据展示。

然后用观察者模式改造下，JDK 内置了观察者模式，用到两个类 `Observer`, `Observable` 前者代表观察者，如例子中的 View，后者是被观察对象，如例子中的 Model。

```diff
public static void main(String[] args) {
-    View v1 = new View1();
-    v1.display();
+    Model model = new Model();
+    model.addObserver(new View1());
+    model.changeData();
}

public static interface View {
    void display();
    void display(Object o);
}

-public static class View1 implements View {
+public static class View1 
+    implements View, Observer {

    @Override
    public void display() {
        Model model = new Model();
        display(model.getData());
    }

    @Override
    public void display(Object o) {
        System.out.println("View1 : " + o);
    }

+    @Override
+    public void update(Observable o, Object arg) {
+        display(arg);
+    }
}

-public static class Model {
+public static class Model extends Observable {

    public Object getData() {
        return "model msg";
    }

+    public void changeData() {
+        Object o = getData();
+        setChanged();
+        notifyObservers(o);
+    }
}
```

改造后控制从 main 传递到 Model 的 addObserver 方法，这个方法控制 View1 添加到观察者列表，返还控制给 main。然后 main 再传递给 changeData 方法，这个方法遍历观察者列表，控制 View1 调用 update 方法。

这两个例子，第一个怎么做由 View1 说了算，第二个怎么做由 Model 说了算，所以说控制发生了反转，当然反转是一个相对概念，也可以说第一个例子反转了第二个例子。


控制可以用来区分框架 (framework) 和工具库 (library)。一般来说框架有控制反转特性，工具库则没有，这里的控制也可以理解是不是由开发说了算。

JQuery, Apache commons 是工具库，用什么方法，什么时候用都是开发说了算。

Spring, Vue 是框架，怎么用，什么时候用全是它说了算，入口被它们霸占了，开发写的代码只有等着被调用的份。

以我用的最多的 Spring 为例，它反转创建对象的控制。正常来说要创建对象，需要开发显式的 new XxxObject()，但是 Spring 反转了这个过程，改成了 context.getBean('xxxObject') 获取，开发需要做的是按照框架约定来配置。Spring 实现控制反转的技术是依赖注入 (DI)。

观察者模式、策略模式、复合模式组成了以前面试常常问的 MVC 模式，我觉得用 GUI 编程要比 web 编程更容易理解。

MVC 模式中 M 最重要，它不仅仅是 POJO 就是那个只有一堆属性和 get set 方法的类，还包括封装应用状态，响应查询和更新，暴露应用功能，从 java 来说，把它理解为 service 更加合适。

V 其次，负责渲染 M 的数据，发送用户输入和其他事件给 C。

C 没啥用，负责定义应用行为，映射用户操作到 M 的查询和更新，所以后来 MVVM 模式把 C 裁掉了。

MVC 的控制反转和观察者模式的控制反转是一样的，都是原来由 view 控制 model 反转成 model 控制 view。

比较典型的一个例子是，给页面提供一个「添加一行」的功能，放在 JQuery 时代，想法是通过选择器选取父节点，然后加一个子节点。

放在 Vue 时代，想法就不一样了，先定义一个 List 代表这个视图的 viewmodel 然后用 v-for 渲染视图，那么「添加一行」的功能就转化成往 List 里面添加一条记录。

虽然功能没变，但是两种思想差别蛮大的。

看完 main 之后的控制再看看 main 收到控制之前发生了什么。

计算机从通电后就一直在传递控制，从最初的 BIOS 传递给 BOOT 引导程序，再传递给操作系统，操作系统做一些处理，最后等待用户输入，键盘行为、鼠标行为这些都算输入。桌面系统会显示桌面，服务器系统会打开 shell。

操作系统拿到控制后就没准备还，直到用户输入关机命令才把控制还回去。

用伪代码表示就是在方法体里写了个 while true 循环

```
public class BIOS {
    public void execute() {
        BOOT boot = new BOOT();
        boot.execute();
    }
}

public class BOOT {
    public void execute() {
        OS os = new OS();
        os.execute();
    }
}

public class OS {
    public void execute() {
        while (true) {
            cmd = read()
            if (cmd == "关机") {
                break
            }
            out = eval(cmd)
            print(out)
        }
    }
}
```

所以只要不关机，不崩溃或者拔电源，计算机就能一直运行。


看到这里也许有人会想，既然操作系统可以写个 while true 循环独占了 CPU 那么我们是不是也可以写一个 while true 循环全权把操作系统的能力接管过来。

可以是可以，server 进程差不多就是这个逻辑，但是吧操作系统毕竟玩的早，我们能想到的它早想到了。它设置了一个上下文切换特性，会让控制在各个进程之间飘来飘去，飘到的进程才能占用 CPU 运行，其他进程只能等待临幸。

从计算机的视角来看，它就是个无情的指令执行机器，永远在寻找和执行下一条指令，这样控制也可以理解为执行下一条指令，方法调用本质也是指令跳转。

最初只有一个入口，就是第一条执行的指令，随着系统不断创建进程，入口越来越多，一个进程就对应一个入口，为了便于管理就产生了上下文切换这个特性。它本质是一个 interrupt，和它类似的还有 failt, abort 和 trap，都可以乱序传递控制。

扯远了，总的来说控制反转是相对的，在讨论局部的控制传递时才有意义，至于它的作用，可能是让代码扩展起来舒服点吧。

封面图：Photo by Josh Sorenson from Pexels