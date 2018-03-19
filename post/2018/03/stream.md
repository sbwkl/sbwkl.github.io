# Stream

## Key types

### Stream

[Stream](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html) 是元素的序列，支持顺序和并行的操作，类似的有 IntStream，LongStream 等

### Optional

[Optional](https://docs.oracle.com/javase/8/docs/api/java/util/Optional.html) 是特殊的 Stream 包含 0 个或 1 个元素

## Create a stream

### Stream.of

of 方法创建一个包含 1 个或者多个的数值的 Stream

```
Stream.of(1)
    .forEach(System.out::println);
System.out.println("#");
Stream.of(1, 2, 3)
    .forEach(System.out::println);
```

Output

```
1
#
1
2
3

```

### Stream.empty

empty 方法创建一个 Stream 但是不含有任何一个值

```
Stream.empty()
    .forEach(System.out::println);
System.out.println("#");
```

Output

```
#

```

### Stream.builder

创建一个 builder 通过 add 或者 accept 添加到待构建列表，然后通过 build 方法创建一个 Stream

```
Stream.builder.add(1).add(2).add(3).build()
    .forEach(System.out::println);
```

Output

```
1
2
3

```

### Stream.generate

generate 方法创建一个无限的 Stream 每个元素由 Supplier 提供，常用于创建一个常量 Stream 或者 随机 Stream

```
Stream.generate(() -> ThreadLocalRandom.current().nextInt(0, 9))
    .limit(5)
    .forEach(System.out::println);
```

Output

```
6
1
1
0
4

```

### Stream.iterate

iterate 方法创建一个无限的 Stream 每个元素的产生规则为 f(n + 1) = f(f(n)) f(1) = 初始值

```
Stream.iterate(1, p -> p * 2)
    .limit(5)
    .forEach(System.out::println);
```

Output

```
1
2
4
8
16

```

### IntStream.range

创建一个顺序的整型 Stream

```
IntStream.range(0, 4)
    .forEach(System.out::println);
```

Output

```
0
1
2
3

```

## Reducing a stream

### filter

filter 方法通过 Predicate 返回的值来判断是否需要过滤这个值，如果返回值为 false 这个值将被省略

```
Stream.of(1, 2, 3, 9, 10, 3)
    .filter(p -> p % 2 == 0)
    .forEach(System.out::println);
```

Output

```
2
10

```

### distinct

distinct 方法会过滤掉所有相同的元素

```
Stream.of(1, 2, 3, 9, 10, 3)
    .distinct()
    .forEach(System.out::println);
```

Output

```
1
2
3
9
10

```

### skip

skip 方法用来过滤掉前 n 个元素

```
Stream.of(1, 2, 3, 9, 10, 3)
    .skip(2)
    .forEach(System.out::println);
```

Output

```
3
9
10
3

```

### limit

limit 方法和 skip 方法刚好相反，只获取前 n 个元素

```
Stream.of(1, 2, 3, 9, 10, 3)
    .limit(2)
    .forEach(System.out::println);
```

Output

```
1
2

```

### collect

collect 方法有 2 个重载方法，通过提供的 accumulator 收集数据到 supplier 中，可以把 Stream 转化成 List，Set，Map

```
<R> R collect(Supplier<R> supplier,
                  BiConsumer<R, ? super T> accumulator,
                  BiConsumer<R, R> combiner);
<R, A> R collect(Collector<? super T, A, R> collector);
```

```
Stream.of(1, 2, 3, 9, 10, 3)
    .collect(Collectors.toList())
    .forEach(System.out::println);
```

Output

```
1
2
3
9
10
3

```

## Inspection

### allMatch

allMatch 返回一个 boolean 值，是否所有元素都匹配提供的 Predicate 

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .allMatch(p -> p % 2 == 0)
);
```

Output

```
false

```

### anyMatch

anyMatch 返回一个 boolean 值，是否任何元素都匹配提供的 Predicate 

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .anyMatch(p -> p % 2 == 0)
);
```

Output

```
true

```

### noneMatch

noneMatch 返回一个 boolean 值，是否没有元素都匹配提供的 Predicate 

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .noneMatch(p -> p % 2 == 0)
);
```

Output

```
false

```

## Aggregation

### count

count 方法返回 stream 包含的元素个数

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .count()
);
```

Output

```
6

```

### min

min 方法根据提供的 Comparator 返回最小的元素

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .min((o1, o2) -> o1 - o2)
        .get()
);
```

Output

```
1

```

### max

max 方法根据提供的 Comparator 返回最大的元素

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .max((o1, o2) -> o1 - o2)
        .get()
);
```

Output

```
10

```

### findFirst

findFirst 方法返回 stream 的第一个元素

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .findFirst()
        .get()
);
```

Output

```
1

```

### findAny

findAny 方法返回 stream 某个元素，在 stream 不是 parallel 的情况下基本等同 findFirst 在是 parallel 的情况下不同

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .findAny()
        .get()
);

System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3).parallel()
        .findAny()
        .get()
);
```

Output

```
1
9

```

### reduce

reduce 方法返回一个元素，相当于计算 f(n) = f(f(n - 1), f(n - 2)) reduce 有 3 个重载方法

```
T reduce(T identity, BinaryOperator<T> accumulator);
Optional<T> reduce(BinaryOperator<T> accumulator);
<U> U reduce(U identity,
     BiFunction<U, ? super T, U> accumulator,
     BinaryOperator<U> combiner);
```

```
System.out.println(
    Stream.of(1, 2, 3, 9, 10, 3)
        .reduce((o1, o2) -> o1 + o2)
        .get()
);
```

Output

```
28

```

## Transformation of stream

### map

map 方法返回一个 stream 每个元素通过提供的 Function 做一次变换

```
Stream.of(1, 2, 3, 9, 10, 3)
    .map(p -> p + 1)
    .forEach(System.out::println);
```

Output

```
2
3
4
10
11
4

```

### mapToDouble

mapToDouble 方法返回一个 DoubleStream 每个元素通过提供的 Function 做一次变换，mapToInt mapToLong 同理

```
Stream.of(1, 2, 3, 9, 10, 3)
    .mapToDouble(p -> p + 1)
    .forEach(System.out::println);
```

Output

```
2.0
3.0
4.0
10.0
11.0
4.0

```

### flatMap

flatMap 根据提供的 Function 将个元素变换为 Stream

```
Stream.of(Arrays.asList(1, 2), Arrays.asList(3, 9), Arrays.asList(10, 3))
    .flatMap(p -> p.stream())
    .forEach(System.out::println);
```

Output

```
1
2
3
9
10
3

```

### flatMapToDouble

flatMap 根据提供的 Function 将个元素变换为 DoubleStream，flatMapToInt，flatMapToLong 同理

```
Stream.of(Arrays.asList(1, 2), Arrays.asList(3, 9), Arrays.asList(10, 3))
    .flatMap(p -> p.stream().mapToDouble(q -> q.doubleValue()))
    .forEach(System.out::println);
```

Output

```
1.0
2.0
3.0
9.0
10.0
3.0

```
## 参考链接

+ [Stream](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html)
+ [Intro To RxJava](https://github.com/Froussios/Intro-To-RxJava)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">19/03/2018</p>