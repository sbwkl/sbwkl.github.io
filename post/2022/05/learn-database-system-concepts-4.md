# 数据库并发控制·补充

上一份笔记总结了并发控制的协议，其中有一些协议是通过锁来实现的，用了锁或多或少就要处理死锁问题。

有两种办法处理死锁问题，一种是死锁预防，另一种是死锁检测和恢复。

树形协议是死锁预防的一种实现。

