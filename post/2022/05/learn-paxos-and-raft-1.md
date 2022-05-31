# Paxos & Raft 开荒

事情缘由是同事给我发了连篇论文 GFS 和 MapReduce。这两篇论文的大名大概 6，7 年前就听过了，不过当时比较菜，论文下载后愣是第一章都看不完。一方面是当时和英文还没有亲和力，一方面是那时候根本不知道分布式是啥。

这么多年过去了，我又想挑战一下我的软肋，然后就开始看了。神奇的是不考虑细节的情况下，我居然能看懂论文在讲什么了。刷完后膨胀了，想着还有一篇 BigTable 也一并读了把。然而显示给了我一记头槌，BigTable 这篇一堆的生词，然后从 Chubby 到 Paxos Made Simple 到 The Part-Time Parliament 到 Raft，这里把 Paxos 和 Raft 的笔记记一下。

整理了下查到的结果

关键字

+ Consensus: 一组服务器就某一个值达成一致
+ Consistency model: 本来想搜 Consistency 但是搜不到，共识和一致之间似乎些许差异
+ Paxos: 一种共识算法，有很多变种 Multi-Paxos、Fast-Paxos
+ Raft: 另一种共识算法
+ Leslie Lamport: 发明 Paxos 的巨佬，LaTeX 也是他弄出来的
+ cassandra: 一个开源 KV 库，据说用的是 Paxos 协议
+ State Machine: 一个抽象概念，用来描述计算的，看起来我们写的代码都是确定性有限状态机范畴
+ Majority: 大多数节点，还有 Quorums 也是一样的意思。

关键结果


Lamport 巨佬的作品库
https://lamport.azurewebsites.net/pubs/pubs.html

Lamport 关于 Paxos 的几篇论文
当数学公式出现的瞬间，我就知道这论文不是我现在该读的 https://lamport.azurewebsites.net/pubs/lamport-paxos.pdf
应该是目前最通俗易懂的 Paxos 介绍了，不过只重点介绍了单一实例的情况 https://lamport.azurewebsites.net/pubs/paxos-simple.pdf
Paxos 增加了 commit 阶段的介绍 https://lamport.azurewebsites.net/video/consensus-on-transaction-commit.pdf

Martin fowler 关于 Paxos 的介绍，
https://martinfowler.com/articles/patterns-of-distributed-systems/paxos.html

其他一些关于 Paxos 的文章

Paxos Wiki 非常详细
https://en.wikipedia.org/wiki/Paxos_(computer_science)
https://stackoverflow.com/questions/26589137/why-is-multi-paxos-called-multi-paxos
https://stackoverflow.com/questions/64753009/does-anyone-have-any-recommendatation-for-multi-paxos/64759874#64759874


Paxos 的一些实现
https://github.com/cocagne/paxos
https://github.com/Tencent/phxpaxos

Paxos & Raft 介绍视频
https://www.youtube.com/watch?v=JEpsBg0AO6o&t=0s
https://www.youtube.com/watch?v=YbZ3zDzDnrw&t=3035s


Raft 论文和网站
https://raft.github.io/raft.pdf
https://raft.github.io/

https://en.wikipedia.org/wiki/Consistency_model
https://en.wikipedia.org/wiki/Finite-state_machine




从总体来说 Raft 比 Paxos 好理解很多，好理解也是 Raft 的第一设计目标，作者在论文里也反复强调。

我对 Paxos 一直有误解，我一直以为 Paxos 是一个算法，最终会像区块链一样生成一个又一个的节点，这个误解费了我不少时间。实际上认知升级后我现在觉得 Paxso 是一系列算法，这其中最简单的算法是对一个值达成公式，也就是 Single-Decree Synod。我现在能理解的也只有这一个，Paxos Made Simple 的 1，2 章主要介绍了这个算法，第 3 章不一样。

我查到的资料里，入门 Paxos 最好的是 Martin fowler 的这篇 https://martinfowler.com/articles/patterns-of-distributed-systems/paxos.html，事实上我读完这篇才发现有误解。解开这个误解后 Paxos Made Simple 的前两章就变得好理解了。

Paxos 把参与者分成三个角色 proposer，acceptor，learner，一个节点可以三个角色全要。这里的 learner 最没参与感，基本没它什么事。

Paxos 分成两个阶段 prepare 和 accept。这么分的原因在论文里有讲，我看不太懂，但我大受震撼。

prepare 阶段要求所有收到请求的 Acceptor 不在接提案号小于 n 的提案，如果 Acceptor 已经接受过提案，那么把最近接受的提案返回。

proposer 收到大多数 prepare 返回，如果有节点返回 v 那提案是 v 否则由 proposer 决定。

accept 阶段要求所有收到请求的 Acceptor 接受 v 值，Acceptor 必须接受，除非它曾经通过 prepare 阶段承诺过比 n 值更高的提案。

之前卡在 Paxos Made Simple P2<sub>a</sub> : 如果一个值为 v 的提案被选中，那么任何一个被 Acceptor 接受的、编号更高的提案值为 v。我之前把提案号理解为指令的顺序编号，认为一个提案对应着一个 Paxos 实例。其实不是这样的，整个协议是一个 Paxos 实例，在这一个实例里面可以有很多个提案号，协议过后最终所有的服务器会选中唯一一个值。

只唯一选中一个值的协议用处感觉不大，所以后面 Paxos 还有一堆，比如 Multi-Paxos 就是对应多值的，不过这些协议我都没看，我觉得还不到时候。

在 KV 存储中，可以为每个 key 开启一个 Paxos 实例，这样每个 key 会唯一对应一个值，保证所有节点的数据是一致的。

再进一步扩展，把 KV 存储的 key 换成递增的序号 1, 2, 3, ... 然后 value 存储对应的命令，比如 set('foo', 1) 这样的，就能实现每个副本状态一致。因为对于我们常用的软件，如 mysql、redis 等，用相同的顺序执行相同的指令，一定能得到相同结果，这是确定性有限状态机的特点。

搜索 Paxos 的过程中知道了 Raft，这是为容易理解而生的共识算法。它的论文（https://raft.github.io/raft.pdf）在多出都强调容易理解（Understandable）也强调容易理解对算法来说是多门的重要，整份读下来，感觉它对 Paxos 怨念颇深。

不得不说 Raft 确实好理解很多，最难理解的是 joint consensus 用于变更集群的配置。

Raft 每个节点有 3 种状态 leader，follower，candidate。

Raft 的那个超时机制很开眼界。每个节点会设置一个时钟，随机时间，然后开始倒计时，如果倒计时成功结束，那么节点认为 Leader 十有八九是遭遇不测了，自己申请上位。同时 Leader 会定期向每个节点发送心跳，告诉他们我还行着，收到 Leader 心跳的节点，倒计时增加一个随机时间。



Raft 把协议分成几个子问题：Leader 选举，日志复制。Raft 运行期间一定有且仅有一个 Leader。

![](./terms-1.jpg)

Raft 把时间分成 terms 每个 term 从选举 leader 开始，每进行一次选举就自增，这个编号在后面复制日志和选举都有用。

Leader 选举，当节点发生 election timeout 它向所有节点发送 RequestVote RPC 请求，节点收到请求，检查 Leader 是否是集群节点，比较自己和它的日志谁更新（通过 term 编号和日志编号），如果它的更新且自己还没投过票，就投票同意，得到大多数投票则选举成功。因为是大多数投票所以不会产生两个 leader 这样的尴尬事。

Raft 通过维护一致的日志来保证节点一致。Leader 通过 AppendEntries RPC 请求把日志分发给所有 follower，在当前 term 下 Leader 把日志同步给大多数 follower 那么这条日志及之前的日志都被算作已提交。至于为什么要当前 term 下，论文里有个例子，描述了前一个 term 的日志同步给大多数 follower 是有被覆盖的风险的。

有个 Leader 选举和日志复制两个机制，Raft 可以保证所有的节点最终的状态是一致的。

系统配置变更：Raft 收到配置变更请求进入 joint consensus 阶段

1. 新旧配置合并作为一条日志记录，然后扩散给所有节点。与普通日志不同的是节点收到日志后立即使用，不需要等到日志提交。
2. 新配置作为一条日志记录写入，扩散给所有节点。
3. 新配置记录提交后，集群完成切换






读了这些论文后，发现老外的那些论文也不全是晦涩难懂。有些设计、介绍可能还是读论文更好，毕竟这些算是作者的一手知识，总不会有人比作者还懂吧，又不是懂王。