# Breadth First Search

广度优先搜索是一种图的搜索算法，图是一种抽象的数据结构分为有向图和无向图，其中无向图可以简单理解为互相指向对方的有向循环图


## 应用场景

1. 在好友以及好友的好友中寻找关系最近医生
2. 找到两个点之间最近的距离（无权重）    

## 图的表示

图由顶点和边构成， 顶点指向的顶点称为这个顶点的邻居，可以用映射表维护顶点和邻居的关系，如上图所示可以描述成这样的结构

```
graph = {}
graph['start'] = ['A', 'B']
graph['A'] = ['C', 'D']
graph['C'] = ['fin']
graph['D'] = ['fin']
graph['fin'] = None
```

因为搜索的是关系最近或者距离最短的点所以需要按顺序先遍历起始点的邻居节点，检查是否满足条件，不满足则按顺序遍历邻居节点的邻居节点，以此类推直到遍历完整张图。邻居节点是按照顺序遍历的所以可以使用队列来存储。为了防止图中存在环而导致无限循环使用一个数组记录已经访问过的顶点。

```
def BSF(graph, start, target):
    search_queue = Queue()
    search_queue.put(start);
    searched = []
    while not search_queue.empty():
        node = search_queue.get()
        if node not in searched:
            searched.append(node)
            if is_target(node, target):
                return True
            else 
                search_queue += graph[node]
    return False
    
def is_target(node, target):
    return node == target
        
```

上面这段代码能够找到符合条件的最近距离的顶点，不过不会记录到达这个顶点的路径，如果想要知道具体的路径就需要使用 Dijkstra 算法


<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">05/03/2019</p>