Theorem 1.4.1

$$
Let A, B, and C be events. \\
Then A \subset S. \\
if A \subset B and B \subset A, then A = B \\
if A \subset B and B \subset C, then A \subset C.
$$

Theorem 1.4.2

$$
Let A be an event. Then \empty \subset A.
$$

Theorem 1.4.3

$$
(A^c)^c = A \\
\empty^c = S \\
S^c = \empty
$$

Theorem 1.4.4

$$
A \cup B = B \cup A \\
A \cup A = A \\
A \cup A^c = S \\
A \cup \empty = A \\
A \cup S = S \\
if A \subset B, then A \cup B = B
$$

Theorem 1.4.6

$$
A \cup B \cup C = (A \cup B) \cup C = A \cup (B \cup C)
$$

Theorem 1.4.7

$$
A \cap B = B \cap A \\
A \cap A = A \\
A \cap A^c = \empty \\
A \cap \empty = \empty \\
A \cap S = A \\
if A \subset B, then A \cap B = A
$$

Theorem 1.4.8

$$
A \cap B \cap C = (A \cap B) \cap C = A \cap (B \cap C)
$$

Theorem 1.4.9

$$
(A \cup B)^c = A^c \cap B^c
\\
(A \cap B)^c = A^c \cup B^c
$$

Theorem 1.4.10

$$
A \cap (B \cup C) = (A \cap B) \cup (A \cap C)
\\
A \cup (B \cap C) = (A \cup B) \cap (A \cup C)
$$

Theorem 1.4.11

$$
A = (A \cap B) \cup (A \cap B^c)
\\
A \cup B = B \cup (A \cap B^c)
$$

Theorem 1.5.1

$$
P(\empty) = 0
$$

Theorem 1.5.2

for every disjoint event
$$
P(\bigcup_{i = 1}^{n}A_i) = \sum_{i=1}^{n}P(A_i)
$$

Theorem 1.5.3

$$
P(A^c) = 1 - P(A)
$$

Theorem 1.5.4

$$
if A \subset B, then P(A) \le P(B)
$$

Theorem 1.5.5

$$
0 \le P(A) \le 1
$$

Theorem 1.5.6

$$
P(A \cap B^c) = P(A) - P(A \cap B) 
$$

Theorem 1.5.7

$$
P(A \cup B) = P(A) + P(B) - P(A \cap B)
$$

Theorem 1.5.8

$$
P(\bigcup_{i = 1}^{n}A_i) \le \sum_{i = 1}^{n}P(A_i) 
\\
\\
P(\bigcap_{i = 1}^{n}A_i) \ge 1 - \sum_{i = 1}^{n}P(A_i^c)
$$

Theorem 1.7.1

Multiplication Rule for Two-Part Experiments

S = nm


Theorem 1.7.2

Multiplication Rule

$$
S = n_1n_2...n_k
$$

Theorem 1.7.3

P_{n, k} = n(n - 1)...(n - k + 1)


Theorem 1.7.4

$$
P_{n, k} = \frac{n!}{(n - k)!}
$$


Theorem 1.7.5

$$
S_n = \frac{1}{2}log(2\pi) + (n + \frac{1}{2})log(n) - n \\
\lim\limits_{n -> \infty} |S_n - log(n!)| = 0 \\
\lim\limits_{n -> \infty}\frac{(2\pi)^{1/2}n^{n + 1/2} e^{-n}}{n!} = 1
$$


Theorem 1.8.1

$$
C_{n, k} = \frac{P_{n, k}}{k!} = \frac{n!}{k!(n - k)!}
$$


Theorem 1.8.2

$$
(x + y) = \sum{k = 0}{n}\binom{n}{k}x^ky^{n - k}
$$

Theorem 1.8.3

$$
\binom{n}{0} = \binom{n}{n} = 1 \\
\binom{n}{k} = \binom{n}{n - k}
$$

Theorem 1.9.1

$$
(x_1 + x_2 + ... + x_k)^n = \sum\binom{n}{n_1, n_2, ... , n_k}x_1^{n_1}x_2^{n_2}...x_k^{n_k}
$$

Theorem 1.10.1

$$
P(A_1 \cup A_2 \cup A_3) = P(A_1) + P(A_2) + P(A_3) \\
- [P(A_1 \cap A_2) + P(A_2 \cap A_3) + P(A_1 \cap A_3)] \\
+ P(A_1 \cap A_2 \cap A_3)
$$

Theorem 1.10.2

$$
P(\bigcup_{i = 1}^{n} A_i) = \sum_{i = 1}^{n}P(A_i) - \sum_{i <j}^{}P(A_i \cap A_j) \\
+ \sum_{i < j < k}^{}P(A_i \cap A_j \cap A_k) - ... \\
+ (-1)^{n + 1}P(A_i \cap A_2 \cap ... \cap A_n)
$$

Theorem 2.1.1

$$
P(A \cap B) = P(B) P(A | B) \\
P(A \cap B) = P(A) P(B | A)
$$

Theorem 2.1.2

$$
P(A_1 \cap A_2 \cap ... \cap A_n) = P(A_1)P(A_2 | A_1)P(A_3 | A_1 \cap A_2) ... P(A_n | A_1 \cap A_2 \cap ... \cap A_{n - 1})
$$

THeorem 2.1.3

$$
P(A_1 \cap A_2 \cap ... \cap A_n | B) = P(A_1 | B) P(A_2 | A_1 \cap B) ... P(A_n|A_1 \cap A_2 \cap ... \cap A_{n-1} \cap B)
$$

Theorem 2.1.4

B<sub>i</sub> is partition of the space S

$$
P(A) = \sum_{j=1}^{k}P(B_j \cap A)
$$

$$
P(A) = \sum_{j=1}^{k}P(B_j)P(A | B_j)
$$

$$
P(A|C) = \sum_{j=1}^{k}P(B_j|C)P(A|B_j \cap C)
$$

Theorem 2.2.1

A, B independent

$$
P(A \cap B^c) = P(A)P(B^c)
$$

Theorem 2.2.2

A<sub>i</sub> i = 1, 2, ..., k 独立，当且仅当任何两个不相交的子集满足

$$
P(A_{i_1} \cap ... \cap A_{i_m} | A_{j_1} \cap ... \cap A_{J_l}) = P(A_{i_1} \cap ... \cap A_{i_m})
$$

Theorem 2.2.3

Let n > 1 and let A<sub>1</sub>, . . . , A<sub>n</sub> be events that are mutually exclusive. The events are
also mutually independent if and only if all the events except possibly one of them
has probability 0.

Theorem 2.2.4

Suppose that A1, A2, and B are events such that Pr(A1 ∩ B) > 0. Then A1 and A2 are
conditionally independent given B if and only if Pr(A2|A1 ∩ B) = Pr(A2|B).

Theorem 2.3.1

$$
P(B_i|A) = \frac{P(B_i)P(A|B_i)}{\sum_{j=1}^{k}P(B_j)P(A|B_j)}
$$

$$
P(B_i|A \cap C) = \frac{P(B_i|C)P(A|B_i \cap C)}{\sum_{j=1}^{k}P(B_j|C)P(A|B_j \cap C)}
$$

Gambler’s Ruin problem Eq 2.4.6, Eq 2.4.7

p = 0.5

$$
a_i = \frac{i}{k}
$$

p ≠ 0.5

$$
a_i = \frac{(\frac{1-p}{p})^i - 1}{(\frac{1-p}{p})^k - 1}
$$

Cumulative Distribute Function Eq 3.3.2

$$
F(x) = P(X \le x) \text{ for -∞ < x < ∞}
$$

非递减、负无穷 0、正无穷 1

$$
F(x^{-}) = \lim_{\substack{y->x\\ y\lt x}} F(y) \\
F(x^{+}) = \lim_{\substack{y->x\\ y\gt x}} F(y)
$$

$$
F(x) = F(x^{+})
$$

Theorem 3.3.1

$$
P(X \gt x) = 1 - F(x)
$$

Theorem 3.3.2

$$
P(x_1 \lt X \le x_2) = F(x_2) - F(x_1)
$$

Theorem 3.3.3

$$
P(X \lt x) = F(x^{-})
$$

Theorem 3.3.4

$$
P(X=x) = F(x) - F(x^{-})
$$

Theorem 3.3.5

X 是连续分布

$$
F(x) = \int_{-∞}^{x}f(t)dt
$$

$$
\frac{dF(x)}{dx} = f(x)
$$

**Definition 3.3.2**

Quantiles/Percentiles. Let X be a random variable with c.d.f. F. For each p strictly between 0 and 1, define $F^{−1}(p)$ to be the smallest value x such that F (x) ≥ p. Then $F^{−1}(p)$ is called the p quantile of X or the 100p percentile of X. The function $F^{−1}$ defined here on the open interval (0, 1) is called the quantile function of X.

**Definition 3.3.3**

Median/Quartiles. The 1/2 quantile or the 50th percentile of a distribution is called its
median. The 1/4 quantile or 25th percentile is the lower quartile. The 3/4 quantile or
75th percentile is called the upper quartile

**Definition 3.4.1**

Joint/Bivariate Distribution. Let X and Y be random variables. The joint distribution
or bivariate distribution of X and Y is the collection of all probabilities of the form
Pr[(X, Y ) ∈ C]for all sets C of pairs of real numbers such that {(X, Y ) ∈ C} is an event.

**Definition 3.4.2**

Discrete Joint Distribution. Let X and Y be random variables, and consider the ordered
pair (X, Y ). If there are only finitely or at most countably many different possible
values (x, y) for the pair (X, Y ), then we say that X and Y have a discrete joint
distribution.

**Therorem 3.4.1**

Suppose that two random variables X and Y each have a discrete distribution. Then
X and Y have a discrete joint distribution.

**Definition 3.4.3**

Joint Probability Function, p.f. The joint probability function, or the joint p.f., of X and
Y is defined as the function f such that for every point (x, y) in the xy-plane,

f (x, y) = Pr(X = x and Y = y).

**Theorem 3.4.2**

Let X and Y have a discrete joint distribution. If (x, y) is not one of the possible
values of the pair (X, Y ), then f (x, y) = 0. Also,

$$
\sum_{All (x, y)}^{}f(x, y) = 1
$$

Finally, for each set C of ordered pairs,

$$
P[(X, Y) \in C] = \sum_{(x, y) \in C}^{}f(x, y)
$$

**Definition 3.4.4**

Continuous Joint Distribution/Joint p.d.f./Support. Two random variables X and Y have
a continuous joint distribution if there exists a nonnegative function f defined over
the entire xy-plane such that for every subset C of the plane,

(Eq 3.4.1)

$$
P[(X, Y) \in C] = \int_{C}^{} \int f(x, y)
$$

if the integral exists. The function f is called the joint probability density function
(abbreviated joint p.d.f.) of X and Y . The closure of the set {(x, y) : f (x, y) > 0} is
called the support of (the distribution of) (X, Y ).

**Theorem 3.4.3**

A joint p.d.f. must satisfy the following two conditions:
f (x, y) ≥ 0 for −∞ < x < ∞ and −∞ < y < ∞,
and

$$
\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}f(x, y)dx dy = 1
$$

Any function that satisfies the two displayed formulas in Theorem 3.4.3 is the joint
p.d.f. for some probability distribution.

**Theorem 3.4.4**

For every continuous joint distribution on the xy-plane, the following two statements hold:

+ i. Every individual point, and every infinite sequence of points, in the xy-plane has probability 0.
+ ii. Let f be a continuous function of one real variable defined on a (possibly unbounded) interval (a, b). The sets {(x, y) : y = f (x), a < x < b} and {(x, y) : x = f (y), a < y < b} have probability 0.

**Definition 3.4.5**

Joint p.f./p.d.f. Let X and Y be random variables such that X is discrete and Y is continuous. Suppose that there is a function f (x, y) defined on the xy-plane such that, for every pair A and B of subsets of the real numbers,

(Eq 3.4.4)

$$
P(X \in A \text{ and } Y \in B) = \int_{B} \sum_{x \in A}f(x, y)dy
$$

if the integral exists. Then the function f is called the joint p.f./p.d.f. of X and Y.

Clearly, Definition 3.4.5 can be modified in an obvious way if Y is discrete and X is continuous. Every joint p.f./p.d.f. must satisfy two conditions. If X is the discrete random variable with possible values x1, x2, . . . and Y is the continuous random variable, then f (x, y) ≥ 0 for all x, y and

(Eq 3.4.5)

$$
\int_{-\infty}^{\infty}\sum_{i=1}^{\infty}f(x_i, y) = 1
$$

Because f is nonnegative, the sum and integral in Eqs. (3.4.4) and (3.4.5) can be done in whichever order is more convenient.

**Definition 3.4.6**

Joint (Cumulative) Distribution Function/c.d.f. The joint distribution function or joint cumulative distribution function (joint c.d.f.) of two random variables X and Y is defined as the function F such that for all values of x and y (−∞ < x < ∞ and −∞ < y < ∞)

F (x, y) = Pr(X ≤ x and Y ≤ y)

It is clear from Definition 3.4.6 that F (x, y) is monotone increasing in x for each fixed y and is monotone increasing in y for each fixed x.

(Eq 3.4.6)

Pr(a < X ≤ b and c < Y ≤ d) = F(b, d) − F(a, d) − F (b, c) + F(a, c).

**Theorem 3.4.5**

Let X and Y have a joint c.d.f. F. The c.d.f. F1 of just the single random variable X can be derived from the joint c.d.f. F as F1(x) = limy→∞ F (x, y). Similarly, the c.d.f. F2 of Y equals F2(y) = limx→∞ F (x, y), for 0 < y < ∞.

**Definition 3.5.1**

Marginal c.d.f./p.f./p.d.f. Suppose that X and Y have a joint distribution. The c.d.f. of X derived by Theorem 3.4.5 is called the marginal c.d.f.of X. Similarly, the p.f. or p.d.f. of X associated with the marginal c.d.f. of X is called the marginal p.f. or marginal p.d.f. of X.

**Theorem 3.5.1**

If X and Y have a discrete joint distribution for which the joint p.f. is f , then the marginal p.f. f1 of X is

$$
f_1(x) = \sum_{All y}f(x, y)
$$

**Theorem 3.5.2**

If X and Y have a continuous joint distribution with joint p.d.f. f , then the marginal p.d.f. f1 of X is

(Eq 3.5.2)

$$
f_1(x) = \int_{-\infty}^{\infty}f(x, y)dy
$$

for −∞ < x < ∞.

**Theorem 3.5.3**

Let f be the joint p.f./p.d.f. of X and Y , with X discrete and Y continuous. Then the marginal p.f. of X is

$$
f_1(x) = P(X = x) = \int_{-\infty}^{\infty}f(x, y)dy
$$

for all x

**Definition 3.5.2**

Independent Random Variables. It is said that two random variables X and Y are independent if, for every two sets A and B of real numbers such that {X ∈ A} and {Y ∈ B} are events,

(Eq 3.5.5)

Pr(X ∈ A and Y ∈ B) = Pr(X ∈ A) Pr(Y ∈ B)

**Theorem 3.5.4**

Let the joint c.d.f. of X and Y be F, let the marginal c.d.f. of X be F1, and let the marginal c.d.f. of Y be F2. Then X and Y are independent if and only if, for all real numbers x and y, F (x, y) = F1(x)F2(y).

**Theorem 3.5.5**

Suppose that X and Y are random variables that have a joint p.f., p.d.f., or p.f./p.d.f. f. Then X and Y will be independent if and only if f can be represented in the following form for −∞ < x < ∞ and −∞ < y < ∞:

(Eq 3.5.7)

$$
f(x, y) = h_1(x)h_2(y)
$$

where h1 is a nonnegative function of x alone and h2 is a nonnegative function of y alone.

**Corollary 3.5.1**

Two random variables X and Y are independent if and only if the following factorization is satisfied for all real numbers x and y:

(Eq 3.5.9)

$$
f(x, y) = f_1(x)f_2(y)
$$

**Theorem 3.5.6**

Let X and Y have a continuous joint distribution. Suppose that {(x, y) : f (x, y) > 0} is a rectangular region R (possibly unbounded) with sides (if any) parallel to the coordinate axes. Then X and Y are independent if and only if Eq. (3.5.7) holds for all (x, y) ∈ R.

**Definition 3.6.1**

Conditional Distribution/p.f. Let X and Y have a discrete joint distribution with joint p.f. f . Let f2 denote the marginal p.f. of Y. For each y such that f2(y) > 0, define

(Eq 3.6.2)

$$
g_1(x | y) = \frac{f(x, y)}{f_2(y)}
$$

Then g1 is called the conditional p.f. of X given Y. The discrete distribution whose p.f. is g1(.\|y) is called the conditional distribution of X given that Y = y.

**Definition 3.6.2**

Conditional p.d.f. Let X and Y have a continuous joint distribution with joint p.d.f. f and respective marginals f1 and f2. Let y be a value such that f2(y) > 0. Then the conditional p.d.f. g1 of X given that Y = y is defined as follows:

(Eq 3.6.4)

$$
g_1(x | y) = \frac{f(x, y)}{f_2(y)}
$$

for −∞ < x < ∞.

For values of y such that f2(y) = 0, we are free to define g1(x\|y) however we wish, so long as g1(x\|y) is a p.d.f. as a function of x.

**Theorem 3.6.1**

For each y, g1(x\|y) defined in Definition 3.6.2 is a p.d.f. as a function of x.

**Definition 3.6.3**

Conditional p.f. or p.d.f. from Mixed Distribution. Let X be discrete and let Y be continuous with joint p.f./p.d.f. f . Then the conditional p.f. of X given Y = y is defined by Eq. (3.6.2), and the conditional p.d.f. of Y given X = x is defined by Eq. (3.6.3)

**Theorem 3.6.2**

Multiplication Rule for Distributions. Let X and Y be random variables such that X has p.f. or p.d.f. f1(x) and Y has p.f. or p.d.f. f2(y). Also, assume that the conditional p.f. or p.d.f. of X given Y = y is g1(x\|y) while the conditional p.f. or p.d.f. of Y given X = x is g2(y\|x). Then for each y such that f2(y) > 0 and each x,

(Eq 3.6.7)

$$
f(x, y) = g_1(x|y)f_2(y)
$$

where f is the joint p.f., p.d.f., or p.f./p.d.f. of X and Y. Similarly, for each x such that f1(x) > 0 and each y,

(Eq 3.6.8)

$$
f(x, y) = f_1(x)g_2(y|x)
$$

**Theorem 3.6.3**

Law of Total Probability for Random Variables. If f2(y) is the marginal p.f. or p.d.f. of a random variable Y and g1(x\|y) is the conditional p.f. or p.d.f. of X given Y = y, then the marginal p.f. or p.d.f. of X is

(Eq 3.6.11)

$$
f_1(x) = \sum_y g_1(x|y)f_2(y)
$$

if Y is discrete. If Y is continuous, the marginal p.f. or p.d.f. of X is

(Eq 3.6.12)

$$
f_1(x) = \int_{-\infty}^{\infty}g_1(x|y)f_2(y)dy
$$

**Theorem 3.6.4**

Bayes’ Theorem for Random Variables. If f2(y) is the marginal p.f. or p.d.f. of a random variable Y and g1(x\|y) is the conditional p.f. or p.d.f. of X given Y = y, then the conditional p.f. or p.d.f. of Y given X = x is

(Eq 3.6.13)

$$
g_2(y|x) = \frac{g_1(x|y)f_2(y)}{f_1(x)}
$$

where f1(x) is obtained from Eq. (3.6.11) or (3.6.12). Similarly, the conditional p.f. or p.d.f. of X given Y = y is

(Eq 3.6.14)

$$
g_1(x|y) = \frac{g_2(y|x)f_1(x)}{f_2(y)}
$$

where f2(y) is obtained from Eq. (3.6.11) or (3.6.12) with x and y switched and with the subscripts 1 and 2 switched

**Theorem 3.6.5**

Independent Random Variables. Suppose that X and Y are two random variables having a joint p.f., p.d.f., or p.f./p.d.f. f . Then X and Y are independent if and only if for every value of y such that f2(y) > 0 and every value of x,

(Eq 3.6.17)

$$
g_1(x|y) = f_1(x)
$$

**Definition 3.7.1**

Joint Distribution Function/c.d.f. The joint c.d.f. of n random variables X1, . . . , Xn is the function F whose value at every point (x1, . . . , xn) in n-dimensional space Rn is specified by the relation

(Eq 3.7.1)

$$
F(x_1, ..., x_n) = P(X_1 \le x_1, X_2 \le x_2, ..., X_n \le x_n)
$$

Every multivariate c.d.f. satisfies properties similar to those given earlier for univariate and bivariate c.d.f.’s.

**Definition 3.7.2**

Joint Discrete Distribution/p.f. It is said that n random variables X1, . . . , Xn have a discrete joint distribution if the random vector (X1, . . . , Xn) can have only a finite number or an infinite sequence of different possible values (x1, . . . , xn) in Rn. The joint p.f. of X1, . . . , Xn is then defined as the function f such that for every point (x1, . . . , xn) ∈ Rn

$$
f(x_1, ..., x_n) = P(X_1 = x_1, ..., X_n = x_n)
$$

**Theorem 3.7.1**

If X has a joint discrete distribution with joint p.f. f , then for every subset C ⊂ Rn,

$$
P(X \in C) = \sum_{X \in C} f(x)
$$

**Definition 3.7.3**

Continuous Distribution/p.d.f. It is said that n random variables X1, . . . , Xn have a continuous joint distribution if there is a nonnegative function f defined on Rn such that for every subset C ⊂ Rn,

(Eq 3.7.2)

$$
P[(X_1, ..., X_n) \in C] = \int ··· \int f(x_1, ..., x_n)dx_1···dx_n
$$

if the integral exists. The function f is called the joint p.d.f. of X1, . . . , Xn.

**Theorem 3.7.2**

If the joint distribution of X1, . . . , Xn is continuous, then the joint p.d.f. f can be derived from the joint c.d.f. F by using the relation

$$
f(x_1, ..., x_n) = \frac{∂^nF(x_1, ..., x_n)}{∂x_1···∂x_n}
$$

at all points (x1, . . . , xn) at which the derivative in this relation exists.

**Theorem 3.7.3**

Let F denote the joint c.d.f. of X1, ..., Xn, and let Fi denote the marginal univariate c.d.f. of Xi for i = 1, ..., n. The variables X1 ,..., Xn are independent if and only if,

$$
F(x_1, x_2, ..., x_n) = F_1(x_1)F_2(x_2)...F_n(x_n) \\
\text{for all points (} x_1, x_2, ..., x_n) \in R^n
$$

**Theorem 3.7.4**

If X1, ..., Xn have a continuous, discrete, or mixed joint distribution for which the joint p.d.f., joint p.f., or joint p.f./p.d.f. is f , and if fi is the marginal univariate p.d.f. or p.f. of Xi (i = 1, ..., n), then X1, ..., Xn are independent if and only if the following relation is satisﬁed at all points (x1, x2, ..., xn) ∈ Rn :

$$
f(x_1, x_2, ..., x_n) = f_1(x_1)f_2(x_2)...f_n(x_n)
$$

**Definition 3.7.6**

Random Samples/i.i.d./Sample Size

independent and identically distributed

$$
g(x_1, x_2, ..., x_n) = f(x_1)f(x_2)...f(x_n)
$$

**Definition 3.7.7**

Condition p.f., p.d.f., or p.f./p.d.f.

$$
g_1(\vec{y}|\vec{z}) = \frac{f(\vec{y}, \vec{z})}{f_2(\vec{z})}\text{ for y } \in R^k
$$

$$
f(\vec{y}, \vec{z}) = g_1(\vec{y}|\vec{z})f_2(\vec{z})
$$

**Theorem 3.7.5**

Multivariate Law of Total Probability and Bayes' Theorem

$$
f_1(\vec{y}) = \underbrace{\int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty}}_{n - k} g_1(\vec{y}|\vec{z})f_2(\vec{z})dz
$$

$$
g_2(\vec{z}|\vec{y}) = \frac{g_1(\vec{y}|\vec{z})f_2(\vec{z})}{f_1(\vec{y})}
$$

**Definition 3.7.8**

Conditionally Independent Random Variables

**X** conditionally independent given **Z**

$$
g(\vec{x}|\vec{z}) = \prod_{i=1}^{n}g_i(x_i|\vec{z})
$$

Eq 3.7.16

Conditional Version of Past and Future Theorem

$$
f_1(\vec{y}|\vec{w}) = \underbrace{\int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty}}_{n-k} g_1(\vec{y}|\vec{z}, \vec{w})f_2(\vec{z}|\vec{w})
$$

$$
g_2(\vec{z}|\vec{y}, \vec{w}) = \frac{g_1(\vec{y}|\vec{z}, \vec{w})f_2(\vec{z}|\vec{w})}{f_1(\vec{y}|\vec{w})}
$$

**Theorem 3.8.1**

Function of a Discrete Random Variable

$$
g(y) = P(Y=y) = P(r(X) = y) = \sum_{x:r(x) = y} f(x)
$$

**Theorem 3.8.2**

Linear Function

Y = aX + b (a ≠ 0)

$$
g(y) = \frac{1}{|a|}f(\frac{y-b}{a})
$$

**Theorem 3.8.3**

Probability Intergal Transformation

if Y = F(x)

then Y is the uniform distribution on the interval [0, 1]

**Corollary 3.8.1**

if Y uniform distribution on the interval [0, 1], quantile funtion F<sup>-1</sub>

then X = F<sup>-1</sup>(Y) has c.d.f. F

**Theorem 3.8.4**

if X has p.d.f. f and P(a < X < b) = 1, Y = r(X), r(x) is differentiable and one-to-one, (α, β) is image of interval (a, b), s(y) be the inverse function of r(x)

then p.d.f. of Y is

$$
g(y) = f[s(y)]|\frac{ds(y)}{dy}|
$$

**Theorem 3.9.1**

Functions of Discrete Random Variables

$$
Y_m = r_m(X_1, ..., X_m)
$$

$$
g(y_1, ..., y_m) = \sum_{x_1, ..., x_n \in A}f(x_1, ..., x_n)
$$

**Theorem 3.9.2**

Binomial and Bernoulli Distributions

if X are i.i.d. bernoulli distribution

Y = X_1 + ... + X_n

then Y is binomial distribution

**Theorem 3.9.3**

Brute-Force Distributions of a Function

**X** = (X_1, ..., X_n)

Y = r(**X**)

A_y = {**x**: r(**x**) ≤ y}

$$
G(y) = \int_{A_y} \dots \int f(\vec{x}) d\vec{x}
$$

**Theorem 3.9.4**

Linear Function of Two Random Variable

if

$$
Y = a_1X_1 + a_2X_2 + b
$$

then

$$
g(y) = \int_{-\infty}^{\infty}f(\frac{y - b - a_2x_2}{a_1}, x_2)\frac{1}{|a|}dx_2
$$

**Definition 3.9.1**

Convolution

Y = X<sub>1</sub> + X<sub>2</sub>

$$
g(y) = f_1(y - z)f_2(z)dz
$$

$$
g(y) = f_1(z)f_2(y - z)dz
$$

Eq 3.9.8

Y<sub>n</sub> = max{X<sub>1</sub>, ..., X<sub>n</sub>}

Y<sub>1</sub> = min{X<sub>1</sub>, ..., X<sub>n</sub>}

$$
G_n(y) = [F(y)]^n
$$

$$
g_n(y) = n[F(y)]^{n-1}f(y)
$$

$$
G_1(y) = 1 - [1 - F(y)]^n
$$

$$
g_1(y) = n[1 - F(y)]^{n-1}f(y)
$$

$$
G(y_1, y_n) = [F(y_n)]^n - [F(y_n) - F(y_1)]^n
$$

**Theorem 3.9.6**

if

$$
\boldsymbol{Y} = \boldsymbol{A}\boldsymbol{X}
$$

then

$$
g(\boldsymbol{y}) = \frac{1}{|det \boldsymbol{A}|}f(\boldsymbol{A}^{-1}\boldsymbol{y})
$$

**Theorem 3.10.1**

$$
P(X_1 = x_1, ..., X_n = x_n) \\
= P(X_1 = x_1)P(X_2 = x_2|X_1 = x_1)...P(X_n = x_n|X_{n-1} = x_{x - 1})
$$

$$
P(X_{n+1} = x_{n+1}, ..., X_{n+m} = x_{n+m}|X_n = x_n) \\
= P(X_{n+1} = x_{n+1}|X_n=x_n)P(X_{n+2} = x_{n+2}|X_{n+1} = x_{n+1})...P(X_{n+m} = x_{n+m}|X_{n+m-1} = x_{x+m-1})
$$

**Definition 3.10.3**

$$
P(X_{n+1} = j|X_n = i) = p_{ij}
$$

$$
g(j|i) = p_{ij}
$$

**Theorem 3.10.4**

If there exists m such that every element of $\vec{P}^m$ is strictly positive, then

+ the Markov chain has a unique stationary distribution $\vec{v}$,
+ $\lim_{n→\infty} P$ n is a matrix with all rows equal to $\vec{v}$, and
+ no matter with what distribution the Markov chain starts, its istribution after n steps converges to v as n → ∞.

**Theorem 4.1.1**

$$
E[r(x)] = \int_{-\infty}^\infty r(x)f(x)dx
$$

$$
E[r(x)] = \sum_{all \ x} r(x)f(x)
$$

**Theorem 4.1.2**

$Y = r(X_1, ..., X_n)$

$$
E(Y) = \int \dots \int r(x_1, ..., x_n)f(x_1, ..., x_n)dx_1\dots dx_n
$$

$$
E(Y) = \sum_{All \ x_1, ..., x_n} r(x_1, ..., x_n)f(x_1, ..., x_n)
$$

**Theorem 4.2.1**

if $Y = aX + b$ then $E(Y) = aE(x) + b$

**Theorem 4.2.2**

If there exists a constant such that Pr(X ≥ a) = 1, then E(X) ≥ a. If there exists a constant b such that Pr(X ≤ b) = 1, then E(X) ≤ b.

**Theorem 4.2.3**

Suppose that E(X) = a and that either Pr(X ≥ a) = 1 or Pr(X ≤ a) = 1. Then Pr(X = a) = 1.

**Theorem 4.2.4**

If $X_1, . . . , X_n$ are n random variables such that each expectation $E(X_i)$ is finite (i = 1, . . . , n), then

$$
E(X_1 + ... + X_n) = E(X_1) + ... + E(X_n)
$$

**Corollary 4.2.2**

Assume that $E(X_i)$ is finite for i = 1, . . . , n. For all constants $a_1, . . . , a_n$ and b,

$$
E(a_1X_1 + . . . + a_nX_n + b) = a_1E(X_1) + . . . + a_nE(X_n) + b
$$

**Definition 4.2.1**

Convex Functions. A function g of a vector argument is convex if, for very α ∈ (0, 1), and every x and y, 

g[αx + (1 − α)y] ≤ αg(x) + (1 − α)g(y).

**Theorem 4.2.5**

Jensen’s Inequality. Let g be a convex function, and let X be a random vector with finite mean. Then E[g(X)] ≥ g(E(X)).

**Theorem 4.2.6**

If $X_1, . . . , X_n$ are n independent random variables such that each expectation $E(X_i)$ is finite (i = 1, . . . , n), then

$$
E(\prod_{i=1}^{n}X_i)=\prod_{i=1}^{n}E(X_i)
$$

**Theorem 4.2.7**

Integer-Valued Random Variables. Let X be a random variable that can take only the values 0, 1, 2, . . . . Then

$$
E(X) = \sum_{i=1}^nP(X \ge n)
$$

**Theorem 4.2.8**

General Nonnegative Random Variable. Let X be a nonnegative random variable with c.d.f. F. Then

$$
E(X) = \int_{0}^\infty[1-F(x)]dx
$$

**Theorem 4.3.1**

Alternative Method for Calculating the Variance. For every random variable X, $Var(X) = E(X^2) − [E(X)]^2$

**Theorem 4.3.3**

Var(X) = 0 if and only if there exists a constant c such that Pr(X = c) = 1

**Theorem 4.3.4**

For constants a and b, let $Y = aX + b$. Then $Var(Y) = a^2 Var(X)$,
and $σ_Y = |a|σ_X$

**Theorem 4.3.5**

If $X_1, . . . , X_n$ are independent random variables with finite means, then $Var(X_1 + . . . + X_n) = Var(X_1) + . . . + Var(X_n)$.

**Corollary 4.3.1**

If $X_1, . . . , X_n$ are independent random variables with finite means, and if $a_1, . . . , a_n$ and b are arbitrary constants, then $Var(a_1X_1 + . . . + a_nX_n + b) = a_1^2 Var(X_1) + . . . + a_n^2 Var(X_n)$.

**Theorem 4.4.1**

If $E(|X|^k) \lt \infty$ for some positive integer k, then $E(|X|^j) \lt \infty$ for every positive integer j such that j < k

**Definition 4.4.2**

Moment Generating Function. Let X be a random variable. For each real number t, define

$$
\psi(t) = E(e^{tX})
$$

**Theorem 4.4.2**

Let X be a random variables whose m.g.f. ψ(t) is finite for all values of t in some open interval around the point t = 0. Then, for each integer n > 0, the nth moment of X, $E(X^n)$ is finite and equals the nth derivative $\psi^{(n)}(t)$ at t = 0. That is, $E(X^n) = \psi^{(n)}(0)$ for n = 1, 2, ...

**Theorem 4.4.3**

Let X be a random variable for which the m.g.f. is $\psi_1$; let Y = aX + b, where a and b are given constants; and let $\psi_2$ denote the m.g.f. of Y. Then for every value of t such that $\psi_1(at)$ is finite,

$$
\psi_2(t) = e^{bt}\psi_1(at)
$$

**Theorem 4.4.4**

Suppose that $X_1, . . . , X_n$ are n independent random variables; and for i = 1, ..., n, let $\psi_i$ denote the m.g.f. of $X_i$. Let $Y = X_1 + . . . + X_n$, and let the m.g.f. of Y be denoted by $\psi$. Then for every value of t such that $\psi_i(t)$ is finite for i = 1, ..., n

$$
\psi(t) = \prod_{i=1}^{n}\psi_i(t)
$$

**Theorem 4.4.5**

If the m.g.f.’s of two random variables $X_1$ and $X_2$ are ﬁnite and identical for all values of t in an open interval around the point t = 0, then the probability distributions of $X_1$ and $X_2$ must be identical.

**Theorem 4.4.6**

If $X_1$ and $X_2$ are independent random variables, and if $X_i$ has the binomial distribution with parameters $n_i$ and $p(i = 1, 2)$, then $X_1 + X_2 has$ the binomial distribution with parameters $n_1 + n_2$ and p.

**Definition 4.5.1**

Median

Let $X$ be a random variable. Every number $m$ with the following property is called a median of the distribution of X: $Pr(X ≤ m) ≥ 1/2$ and $Pr(X ≥ m) ≥ 1/2$.

**Theorem 4.5.1**

One-to-One Function

Let $X$ be a random variable that takes values in an interval I of real numbers. Let r be a one-to-one function deﬁned on the interval I. If m is a median of X, then r(m) is a median of r(X).

**Definition 4.5.2**

Mean Squared Error/M.S.E.

The number $E[(X − d)^2 ]$ is called the mean squared error (M.S.E.) of the prediction d.

**Theorem 4.5.2**

Let $X$ be a random variable with ﬁnite variance $σ^2$, and let $μ = E(X)$. For every number d

Eq(4.5.1)

$$E[(X − μ)^2 ] ≤ E[(X − d)^2]$$.

Furthermore, there will be equality in the relation (4.5.1) if and only if d = μ.

**Definition 4.5.3**

Mean Absolute Error/M.A.E.

The number $E(|X − d|)$ is called the mean absolute error (M.A.E.) of the prediction d.

**Theorem 4.5.3**

Let X be a random variable with ﬁnite mean, and let m be a median of the distribution of X. For every number d,

Eq(4.5.4)
$$E(|X − m|) ≤ E(|X − d|)$$

Furthermore, there will be equality in the relation (4.5.4) if and only if d is also a median of the distribution of X.

**Definition 4.6.1**

Covariance

Let X and Y be random variables having ﬁnite means. Let $E(X) = μ_X$ and $E(Y) = μ_Y$ The covariance of X and Y , which is denoted by Cov(X, Y), is deﬁned as

Eq.(4.6.1)

$$
Cov(X, Y) = E[(X − μ_X)(Y − μ_Y)]
$$

if the expectation in Eq.(4.6.1) exists

**Theorem 4.6.1**

For all random variables X and Y such that $σ_X^2 < ∞$ and $σ_Y^2 < ∞$,

Eq.(4.6.2)

$$
Cov(X, Y) = E(XY) − E(X)E(Y).
$$

**Definition 4.6.2**

Correlation

Let X and Y be random variables with ﬁnite variances $σ_X^2$ and $σ_Y^2$, respectively. Then the correlation of X and Y, which is denoted by ρ(X, Y), is deﬁned as follows:

Eq.(4.6.3)

$$
\rho(X, Y) = \frac{Cov(X, Y)}{\sigma_X\sigma_Y}
$$

**Theorem 4.6.2**

Schwarz Inequality

For all random variables U and V such that E(U V) exists,

Eq.(4.6.4)

$$
[E(U V)]^2 ≤ E(U^2)E(V^2).
$$

**Theorem 4.6.3**

Cauchy-Schwarz Inequality

Let X and Y be random variables with ﬁnite variance. Then

Eq.(4.6.9)

$$
[Cov(X, Y)]^2 ≤ σ_X^2 σ_Y^2
$$

Eq.(4.6.10)

$$
−1 ≤ ρ(X, Y ) ≤ 1
$$

**Definition 4.6.3**

Positively/Negatively Correlated/Uncorrelated

It is said that X and Y are positively correlated if ρ(X, Y) > 0, that X and Y are negatively correlated if ρ(X, Y) < 0, and that X and Y are uncorrelated if ρ(X, Y ) = 0.

**Theorem 4.6.4**

If X and Y are independent random variables with $0 < σ_X^2 < ∞$ and $0 < σ_Y^2 < ∞$, then

$$Cov(X, Y ) = ρ(X, Y ) = 0$$

**Theorem 4.6.5**

Suppose that X is a random variable such that $0 < σ_X^2 < ∞$, and $Y = aX + b$ for some constants a and b, where a = 0. If a > 0, then ρ(X, Y) = 1. If a < 0, then ρ(X, Y) = −1.

**Theorem 4.6.6**

If X and Y are random variables such that $Var(X) < ∞$ and $Var(Y) < ∞$, then

Eq.(4.6.11)

$$Var(X + Y) = Var(X) + Var(Y) + 2 Cov(X, Y)$$

**Corollary 4.6.1**

Let a, b, and c be constants. Under the conditions of Theorem 4.6.6,

Eq.(4.6.12)

$$
Var(aX + bY + c) = a^2 Var(X) + b^2 Var(Y) + 2ab Cov(X, Y).
$$

**Theorem 4.6.7**

If $X_1 , ... , X_n$ are random variables such that $Var(X_i) < ∞$ for i = 1, ..., n, then

Eq.(4.6.14)

$$
Var(\sum_{i=1}^{n}X_i) = \sum_{i=1}^{n}Var(X_i) + 2\sum_{i<}\sum_j Cov(X_i, X_j).
$$

**Corollary 4.6.2**

If $X_1, ..., X_n$ are uncorrelated random variables (that is, if $X_i$ and $X_j$ are uncorrelated whenever $i \ne j$), then

Eq.(4.6.15)

$$
Var(\sum_{i=1}^nX_i) = \sum_{i=1}^nVar(X_i).
$$

**Definition 4.7.1**

Conditional Expectation/Mean

Let X and Y be random variables such that the mean of Y exists and is ﬁnite. The conditional expectation (or conditional mean) of Y given X = x is denoted by E(Y|x) and is deﬁned to be the expectation of the conditional distribution of Y given X = x.

**Definition 4.7.2**

Conditional Means as Random Variables

Let $h(x)$ stand for the function of x that is denoted $E(Y|x)$ in either (4.7.1) or (4.7.2). Deﬁne the symbol $E(Y|X)$ to mean $h(X)$ and call it the conditional mean of Y given X.

**Theorem 4.7.1**

Law of Total Probability for Expectations

Let $X$ and $Y$ be random variables such that $Y$ has ﬁnite mean. Then

Eq.(4.7.3)

$$E[E(Y |X)] = E(Y )$$

**Theorem 4.7.2**

Let $X$ and $Y$ be random variables, and let $Z = r(X, Y)$ for some function $r$. The conditional distribution of $Z$ given $X = x$ is the same as the conditional distribution of $r(x, Y)$ given $X = x$.

**Definition 4.7.3**

Conditional Variance

For every given value $x$, let $Var(Y|x)$ denote the variance of the conditional distribution of $Y$ given that $X = x$. That is,

Eq.(4.7.5)

$$Var(Y|x) = E\{[Y − E(Y|x)]^2|x\}$$

We call $Var(Y|x)$ the conditional variance of $Y$ given $X = x$.

**Theorem 4.7.3**

The prediction $d(X)$ that minimizes $E\{[Y − d(X)]^2\}$ is $d(X) = E(Y|X)$



//上面还有很多漏了

**Theorem 5.3.4**

Closeness of Binomial and Hypergeometric Distributions

Let 0 < p < 1, and let n be a positive integer. Let Y have the binomial distribution with parameters n and p. For each positive integer T , let $A_T$ and $B_T$ be integers such that $\lim_{T→∞} A_T = ∞$, $\lim_{T→∞} B_T = ∞$, and $\lim_{T→∞} A_T /(A_T + B_T) = p$. Let $X_T$ have the hypergeometric distribution with parameters $A_T, B_T$, and n. For each ﬁxed n and each x = 0, ..., n,

Eq.(5.3.9)

$$
\lim_{T→∞}\frac{Pr(Y = x)}{Pr(X_T = x)} = 1
$$

//上面还有很多漏了

**Theorem 5.4.5**

Closeness of Binomial and Poisson Distributions

For each integer n and each 0 < p < 1, let $f (x|n, p)$ denote the p.f. of the binomial distribution with parameters n and p. Let $f (x|λ)$ denote the p.f. of the Poisson distribution with mean λ. Let ${p_n}_{n=1}^∞$ be a sequence of numbers between 0 and 1 such that $\lim_{n→∞} np_n = λ$. Then

$$
\lim_{n→∞}f(x|n, p_n) = f(x|λ),
$$

for all x = 0, 1, ...

**Theorem 5.4.6**

Closeness of Hypergeometric and Poisson Distributions

Let λ > 0. Let Y have the Poisson distribution with mean λ. For each positive integer $T$, let $A_T, B_T$, and $n_T$ be integers such that $\lim_{T→∞} A_T = ∞$, $\lim_{T→∞} B_T = ∞$, $\lim_{T→∞} n_T = ∞$, and $\lim_{T→∞} n_T A_T/(A_T + B_T ) = λ$. Let $X_T$ have the hypergeometric distribution with parameters $A_T, B_T$, and $n_T$. For each ﬁxed x = 0, 1, ...,

$$
\lim_{T→∞}\frac{Pr(Y = x)}{Pr(X_T = x)} = 1.
$$

//上面还有很多漏了

**Definition 5.7.2**

Gamma Distributions

$$
f(x|α, β) = \frac{β^α}{Γ(α)}x^{α-1}e^{-βx}
$$

**Theorem 5.7.5**

$$
E(X^k) = \frac{Γ(α + k)}{β^kΓ(α)} = \frac{α(α+1)...(α+k-1)}{β^k}
$$

$$
E(X) = \frac{α}{β}
$$

$$
Var(X) = \frac{α}{β^2}
$$

**Theorem 5.7.6**

$$
\psi(t) = (\frac{β}{β - t})^α
$$

**Theorem 5.7.7**

$X_i$ gamma distribution with $α_i$, $β$ and independent, then the sum of $X_1 + X_2 + ... + X_k$ is gamma distribution with $α_1 + α_2 + ... + α_k$, $β$

**Definition 5.7.3**

Exponential Distributions

$$
f(x|β) = f(x|1, β) = βe^{-βx}
$$

**Theorem 5.7.9**

Memoryless Property of Exponential Distributions

$$
E(X \ge t+h|X\ge t) = E(X\ge h)
$$

**Theorem 5.7.10**

$X_i$ exponential distribution with β then $Y_1 = min(X_1, ..., X_n)$ is exponential distribution with nβ

**Theorem 5.7.11**

$X_i$ exponential distribution with β and $Z_1 \le Z_2 \le ... \le Z_n$ small to large of $X_i$. For each k = 2, 3, ..., n, $Y_k = Z_k - Z_{k-1}$ then $Y_k$ is exponential distribution with $(n + 1 - k)β$

**Theorem 5.7.12**

Times between Arrivals in a Poisson Process. Suppose that arrivals occur according to a Poisson process with rate β. Let $Z_k$ be the time until the k-th arrival for k = 1, 2, .... Deﬁne $Y_1 = Z_1$ and $Y_k = Z_k − Z_{k−1}$ for k ≥ 2. Then $Y_1, Y_2$, ... are i.i.d. and they each have the exponential distribution with parameter β.

**Corollary 5.7.1**

Time until k th Arrival. In the situation of Theorem 5.7.12, the distribution of $Z_k$ is the gamma distribution with parameters k and β.

**Definition 5.8.1**

The Beta Function

Pisitive α, β

$$
B(α, β) = \int_0^1 x^{α - 1}(1-x)^{β - 1}dp
$$

**Therorem 5.8.1**

$$
B(α, β) = \frac{Γ(α)Γ(β)}{Γ(α + β)}
$$

**Definition 5.8.2**

Beta Distribution

$$
f(x|α, β) = \frac{Γ(α + β)}{Γ(α)Γ(β)}x^{α - 1}(1-x)^{β-1}
$$

**Theorem 5.8.2**

P has beta distribution $α, β$ and the condition distribution of X given P = p is binomial distribution with n and p. Then the condition distribution of P give X = x is the beta distribution with $α + x, β + n - x$.

**Theorem 5.8.3**

Moments of beta distribution

$$
E(X^k) = \frac{α(α+1)...(α + k - 1)}{(α + β)(α + β + 1)...(α + β + k - 1)}
$$

**Definition 5.9.1**

$$
f(\vec{x}|n, \vec{p}) = \binom{n}{x_1, ..., x_k}p_1^{x_1}...p_k^{x_k}
$$

$x_1 + x_2 + ... + x_k = n$

**Theorem 5.9.1**

$\vec{X} = (X_1, X_2)$ has the multinomial distribution with n and $\vec{p}=(p_1, p_2)$. Then $X_1$ has the binomial distribution with n and $p_1$, and $X_2 = n - X_1$

**Corollary 5.9.1**

$\vec{X} = (X_1, ..., X_k)$ has the multinomial distribution with n and $\vec{p}=(p_1, ..., p_k)$. Then $X_i$ has the binomial distribution with n and $p_i$.

**Corollary 5.9.2**

$\vec{X} = (X_1, ..., X_k)$ has the multinomial distribution with n and $\vec{p}=(p_1, ..., p_k)$ with $k>2$. Let $l < k$, and let $i_1, ..., i_l$ be distinct elements of the set {1, ..., k}. The distribution of $Y=X_{i_1} + ... + X_{i_l}$ is the binomial distribution with parameters n and $p_{i_1} + ... p_{i_l}$.

**Theorem 5.9.2**

$\vec{X}$ have the multinomial distribution with n and $\vec{p}$. Then

$$
E(X_i) = np_i \\
Var(X_i) = np_i(1-p_i) \\
Cov(X_i, X_j) = -np_ip_j
$$

**Theorem 5.10.1**

$Z_1, Z_2$ standard normal distribution, $\mu_1, \mu_2, \sigma_1, \sigma_2, \rho$ constants such that $-\infty \lt \mu_i \lt \infty, \sigma_i \gt 0, -1 \lt \rho \lt 1$, define two random variables

(Eq 5.10.1)

$$
X_1 = \sigma_1Z_1 + \mu_1
$$
$$
X_2 = \sigma_2(\rho Z_1 + (1 - \rho^2)^{1/2}Z_2) + \mu_2
$$

The joint p.d.f. is

(Eq 5.10.2)

$$
f(x_1, x_2) = \frac{1}{2\pi(1-\rho^2)^{1/2}\sigma_1 \sigma_2}exp(-\frac{1}{2(1-\rho^2)}[(\frac{x_1-\mu_1}{\sigma_1})^2-2\rho(\frac{x_1-\mu_1}{\sigma_1})(\frac{x_2-\mu_2}{\sigma_2}) + (\frac{x_2-\mu_2}{\sigma_2})^2])
$$

**Theorem 5.10.2**

Inverse of Theorem 5.10.1

$X_1, X_2$ has joint distribution 5.10.1, then exist $Z_1, Z_2$, $X_i$ has $\mu_i$ and $\sigma_i$ and correlation $\rho$.

**Definition 5.10.1**

Bivariate Normal Distributions

When joint p.d.f. of two random variables $X_1, X_2$ is of the form in Eq. (5.10.2), it is said that $X_1, X_2$ have the bivariate normal distribution with means $\mu_i$, variances $\sigma_i^2$, and correlation $\rho$.

**Theorem 5.10.4**

$X_1, X_2$ have the bivariate normal distribution. The conditional distribution of $X_2$ given that $X_1 = x_1$ is the normal distribution with mean and variance given by

$$
E(X_2|x_1) = \mu_2 + \rho\sigma_2(\frac{x_1-\mu_1}{\sigma_1})
$$

$$
Var(X_2|x_1) = (1-\rho^2)\sigma_2^2
$$

**Theorem 5.10.5**

Linear Combination of Bivariate Normals

$X_1, X_2$ have bivariate normal distribution. Let $Y = a_1X_1 + a_2X_2 + b$, where $a_1, a_2, b$ are arbitrary given constants. Then $Y$ has the normal distribution with mean $a_1\mu_1 + a_2\mu_2 + b$ and variance $a_1^2\sigma_1^2 + a_2^2\sigma_2^2 + 2a_1a_2\rho\sigma_1\sigma_2$

**Theorem 6.2.1**

Markov Inequality

$P(X\ge0)$, then for any $t \gt 0$

$$
P(X\ge t) \le \frac{E(X)}{t}
$$

**Theorem 6.2.2**

Chebyshev Inequality

Let X be a random variable that Var(X) exists. Then for every number $t \gt 0$

$$
P(|X - E(X)| \ge t) \le \frac{Var(X)}{t^2}
$$

**Theorem 6.2.3**

$X_i$ random sample with mean $\mu$ and variance $\sigma^2$. Let $\bar{X_n}$ be the sample mean. Then $E(\bar{X_n}) = \mu$ and $Var(\bar{X_n}) = \sigma^2/n$

**Definition 6.2.1**

Convergence in Probability

A sequence $Z_1, Z_2, ...$ of random variables converges to $b$ in probability if for every number $\epsilon \gt 0$

$$
\lim_{n->\infty} P(|Z_n -b| \lt \epsilon) = 1
$$

This property is denoted by

$$
Z_n \xrightarrow{p} b
$$

and is sometimes stated simply as $Z_n$ converges to b in probability.

**Theorem 6.2.4**

Law of Large Numbers

Suppose that $X_1, ..., X_n$ form a random sample from a distribution for which the mean is $\mu$ and for which the variance is finite. Let $\bar{X_n}$ denote the sample mean. Then

$$
\bar{X}_n \xrightarrow{p} \mu
$$

**Theorem 6.2.5**

Continues Functions of Random Variables

if $Z_n \xrightarrow{p} b$, and if $g(z)$ is a function that is continues at $z = b$, then $g(Z_n) \xrightarrow{p}g(b)$.

**Theorem 6.2.6**

Histograms

Let $X_1, X_2, ...$ be a sequence of i.i.d. random variables. Let $c_1 \lt c_2$ be two constants. Define $Y_i = 1$ if $c_1 \le Y_i \lt c_2$ and $Y_i = 0$ if not. Then $\bar{Y_n} = \frac{1}{n}\sum_{i=1}^{n}Y_i$ is proportion of $X_1, X_2, ...$ that lie in the interval $[c_1, c_2)$, and $\bar{Y_n} \xrightarrow{p}P(c_1 \le X_i \lt c_2)$.

**Theorem 6.2.7**

Chernoff Bounds

Let X be a random variable with moment generating function $\psi$. Then, for every real t,

$$
P(X \ge t) \le \min_{s \gt 0}exp(-st)\psi(t)
$$

**Theorem 6.3.1**

Centeral Limit Theorem

If the random variable $X_1, ..., X_n$ form a random sample of size n from a given distribution with mean $\mu$ and variance $\sigma^2 (0 \lt \sigma^2 \lt \infty)$, then for each fixed number x

$$
\lim_{n->\infty} p[\frac{\bar{X}_n - \mu}{\sigma/\sqrt{n}} \le x] = \Phi(x)
$$

**Definition 6.3.1**

Convergence in Distribution/Asymptotic Distribution

Let $X_1, X_2, ...$ be a sequence of random variables, and for n = 1, 2, ..., Let $F_n$ denote the c.d.f. of $X_n$. Also let $F^*$ be a c.d.f. Then it is said that the sequence $X_1, X_2, ...$ converages in probability to $F^*$ if

$$
\lim_{n->\infty} F_n(x) = F^*(x)
$$

for all x at which $F^*(x)$ is continuous.

**Theorem 6.3.2**

Delta method

Let $Y_1, Y_2, ...$ be a sequence of random variables and let $F^*$ be a continuous c.d.f. Let $\theta$ be a real number, and let $a_1, a_2, ...$ be a sequence of positive numbers that increase to $\infty$. Supporse that $a_n(Y_n-\theta)$ converages in distribution to $F^*$. Let $\alpha$ be a function with continuous derivative such that $\alpha^{'}(\theta) \ne 0$. Then $a_n[\alpha(Y_n)-\alpha(\theta)]/\alpha^{'}(\theta)$ converges in distribution to $F^*$.

**Corollary 6.3.1**

Delta Method for Average of a Random Sample

Let $X_1, X_2, ...$ be a sequence of i.i.d. random variables from a distribution with mean μ and ﬁnite variance $σ^2$. Let α be a function with continuous derivative such that $α^{'}(μ) \ne 0$. Then the asymptotic distribution of

$$
\frac{\sqrt{n}}{σ α^{'}(μ)}[α(\bar{X}_n) − α(μ)]
$$

is the standard normal distribution.

Eq.(6.3.8)

$$
Y_n=\frac{\sum_{i=1}^nX_i - \sum_{i=1}^n\mu_i}{(\sum_{i=1}^n\sigma_i^2)^{1/2}}
$$

**Theorem 6.3.3**

Suppose that the random variables $X_1, X_2, ...$ are independent and that $E(|X_i − μ_i|^3 ) < ∞$ for i = 1, 2, . . . Also, suppose that

Eq.(6.3.9)

$$
\lim_{n->\infty} \frac{\sum_{i=1}^nE(|X_i - \mu_i|^3)}{(\sum_{i=1}^n\sigma_i^2)^{3/2}} = 0
$$

Finally, Let the random variable $Y_n$ be as defined in Eq.(6.3.8). Then, for each fixed number x

Eq.(6.3.10)

$$
\lim_{n->\infty} P(Y_n \le x) = \Phi(x)
$$

**Theorem 6.3.4**

Suppose that the random variables $X_1, ..., X_n$ are independent and $X_i$ has the Bernoulli distribution with parameter $p_i$ (i = 1, 2, ...). Suppose also that the inﬁnite series $\sum_{i=1}^∞ p_i(1 − p_i )$ is divergent, and let

Eq.(6.3.11)

$$
Y_n = \frac{\sum_{i=1}^nX_i - \sum_{i=1}^n p_i}{(\sum_{i=1}^n p_i(1-p_i))^{1/2}}
$$

Then for every fixed number x

$$
\lim_{n->\infty}P(Y_n \le x) = \Phi(x)
$$

**Theorem 6.3.5**

The sequence of c.d.f.’s $F_1, F_2, ...$ must converge to the c.d.f. $F^∗$ if the corresponding sequence of m.g.f.’s $ψ_1, ψ_2, ...$ converges to the m.g.f. $ψ^∗$.

**Definition 7.1.1**

Statistical Model

A statistical model consists of an identiﬁcation of random variables of interest (both observable and only hypothetically observable), a speciﬁcation of a joint distribution or a family of possible joint distributions for the observable random variables, the identiﬁcation of any parameters of those distributions that are assumed unknown and possibly hypothetically observable, and (if desired) a speciﬁcation for a (joint) distribution for the unknown parameter(s). When we treat the unknown parameter(s) θ as random, then the joint distribution of the observable random variables indexed by θ is understood as the conditional distribution of the observable random variables given θ.

**Definition 7.1.2**

Statistical Inference

A statistical inference is a procedure that produces a probabilistic statement about some or all parts of a statistical model.

**Definition 7.1.3**

Parameter/Parameter space

In a problem of statistical inference, a characteristic or combination of characteristics that determine the joint distribution for the random variables of interest is called a parameter of the distribution. The set $\Omega$ of all possible values of a parameter $θ$ or of a vector of parameters $(θ_1, ...,θ_k)$ is called the parameter space.

**Definition 7.1.4**

Statistic

Suppose that the observable random variables of interest are $X_1, ...,X_n$. Let r be an arbitrary real-valued function of n real variables. Then the random variable $T = r(X_1, ..., X_n)$ is called a statistic.

**Definition 7.2.1**

Prior Distribution/p.f./p.d.f

Suppose that one has a statistical model with parameter θ. If one treats θ as random, then the distribution that one assigns to θ before observing the other random variables of interest is called its prior distribution. If the parameter space is at most countable, then the prior distribution is discrete and its p.f. is called the prior p.f. of θ. If the prior distribution is a continuous distribution, then its p.d.f. is called the prior p.d.f. of θ. We shall commonly use the symbol ξ(θ) to denote the
prior p.f. or p.d.f. as a function of θ.

**Definition 7.2.2**

Posterior Distribution/p.f./p.d.f.

Consider a statistical inference problem with parameter $θ$ and random variables $X_1, ..., X_n$ to be observed. The conditional distribution of $θ$ given $X_1, ... , X_n$ is called the posterior distribution of $θ$. The conditional p.f. or p.d.f. of $θ$ given $X_1 = x_1, ..., X_n = x_n$ is called the posterior p.f. or posterior p.d.f. of $θ$ and is typically denoted $ξ(θ|x_1, ..., x_n)$.

**Theorem 7.2.1**

Suppose that the n random variables $X_1, ..., X_n$ form a random sample from a distribution for which the p.d.f. or the p.f. is $f(x|θ)$. Suppose also that the value of the parameter $θ$ is unknown and the prior p.d.f. or p.f. of $θ$ is $ξ(θ)$. Then the posterior p.d.f. or p.f. of $θ$ is

$$
ξ(θ|\vec{x}) = \frac{f(x_1|θ) ... f(x_n|θ)ξ(θ)}{g_n(\vec{x})}
$$
for $θ ∈ \Omega$, where $g_n$ is the marginal joint p.d.f. or p.f. of $X_1, ..., X_n$.

**Definition 7.2.3**

Likelihood Function

When the joint p.d.f. or the joint p.f. $f_n(x|θ)$ of the observations in a random sample is regarded as a function of $θ$ for given values of $x_1, ..., x_n$, it is called the likelihood function.

**Theorem 7.3.1**

Suppose that $X_1, ..., X_n$ form a random sample from the Bernoulli distribution with parameter θ, which is unknown (0 < θ < 1). Suppose also that the prior distribution of θ is the beta distribution with parameters α > 0 and β > 0. Then the posterior distribution of θ given that $X_i = x_i (i = 1, ..., n)$ is the beta distribution with parameters $α + \sum_{i=1}^n x_i$ and $β + n − \sum_{i=1}^n x_i$.

**Definition 7.3.1**

Conjugate Family/Hyperparameters

Let $X_1, X_2, ...$ be conditionally i.i.d. given θ with common p.f. or p.d.f. $f(x|θ)$. Let $\Psi$ be a family of possible distributions over the parameter space $\Omega$. Suppose that, no matter which prior distribution ξ we choose from $\Psi$, no matter how many observations $X = (X_1, ..., X_n)$ we observe, and no matter what are their observed values $x = (x_1, ..., x_n)$, the posterior distribution $ξ(θ|x)$ is a member of $\Psi$. Then $\Psi$ is called a conjugate family of prior distributions for samples from the distributions $f(x|θ)$. It is also said that the family $\Psi$ is closed under sampling from the distributions $f(x|θ)$. Finally, if the distributions in $\Psi$ are parametrized by further parameters, then the associated parameters for the prior distribution are called the prior hyperparameters and the associated parameters of the posterior distribution are called the posterior hyperparameters.

**Theorem 7.3.2**

Suppose that $X_1, ..., X_n$ form a random sample from the Poisson distribution with mean θ > 0, and θ is unknown. Suppose also that the prior distribution of θ is the gamma distribution with parameters α > 0 and β > 0. Then the posterior distribution of θ, given that $X_i = x_i (i = 1, ..., n)$, is the gamma distribution with parameters $α + \sum_{i=1}^n x_i$ and $β + n$.

**Theorem 7.3.3**

Suppose that $X_1, ..., X_n$ form a random sample from a normal distribution for which the value of the mean $θ$ is unknown and the value of the variance $σ^2 > 0$ is known. Suppose also that the prior distribution of $θ$ is the normal distribution with mean $μ_0$ and variance $v_0^2$. Then the posterior distribution of $θ$ given that $X_i = x_i (i = 1, ..., n)$ is the normal distribution with mean $μ_1$ and variance $v_1^2$ where

$$
\mu_1 = \frac{\sigma^2\mu_0 + n v_0^2 \bar{x}_n}{\sigma^2 + nv_0^2}
$$

and

$$
v_1^2 = \frac{\sigma^2 v_0^2}{\sigma^2 + nv_0^2}
$$

**Theorem 7.3.4**

Suppose that $X_1, ..., X_n$ form a random sample from the exponential distribution with parameter $θ > 0$ that is unknown. Suppose also that the prior distribution of $θ$ is the gamma distribution with parameters $α > 0$ and $β > 0$. Then the posterior distribution of $θ$ given that $X_i = x_i(i = 1, ..., n)$ is the gamma distribution with parameters $α + n$ and $β + \sum_{i=1}^n x_i$.

**Definition 7.3.2**

Improper Prior

Let $ξ$ be a nonnegative function whose domain includes the parameter space of a statistical model. Suppose that $ξ(θ)dθ = ∞$. If we pretend as if $ξ(θ)$ is the prior p.d.f. of $θ$, then we are using an improper prior for $θ$.

**Definition 7.4.1**

Estimator/Estimate

Let $X_1, ..., X_n$ be observable data whose joint distribution is indexed by a parameter $θ$ taking values in a subset $\Omega$ of the real line. An estimator of the parameter $θ$ is a real-valued function $δ(X_1, ..., X_n)$. If $X_1 = x_1, ..., X_n = x_n$ are observed, then $δ(x_1, ..., x_n)$ is called the estimate of $θ$.

**Definition 7.4.2**

Loss Function

A loss function is a real-valued function of two variables, $L(θ, a)$,where $θ ∈ \Omega$ and $a$ is a real number. The interpretation is that the statistician loses $L(θ, a)$ if the parameter equals $θ$ and the estimate equals $a$.

**Definition 7.4.3**

Bayes Estimator/Estimate

Let $L(θ, a)$ be a loss function. For each possible value $x$ of $X$, let $δ^∗(x)$ be a value of a such that $E[L(θ, a)|x]$ is minimized. Then $δ^∗$ is called a Bayes estimator of $θ$. Once $X = x$ is observed, $δ^∗(x)$ is called a Bayes estimate of $θ$.

**Definition 7.4.4**

Squared Error Loss Function

The loss function 

Eq.(7.4.4)

$$L(θ, a) = (θ − a)^2$$

is called squared error loss.

**Corollary 7.4.1**

Let $θ$ be a real-valued parameter. Suppose that the squared error loss function (7.4.4) is used and that the posterior mean of $θ$, $E(θ |X)$, is ﬁnite. Then, a Bayes estimator of $θ$ is $δ^∗(X) = E(θ|X)$.

**Definition 7.4.5**

Absolute Error Loss Function

The loss function

Eq.(7.4.7)

$$L(θ, a) = |θ − a|$$

is called absolute error loss.

**Corollary 7.4.2**

When the absolute error loss function (7.4.7) is used, a Bayes estimator of a real-valued parameter is $δ^∗(X)$ equal to a median of the posterior distribution of $θ$.

**Definition 7.4.6**

Consistent Estimator

A sequence of estimators that converges in probability to the unknown value of the parameter being estimated, as $n → ∞$, is called a consistent sequence of estimators.

**Definition 7.4.7**

Estimator/Estimate

Let $X_1, ..., X_n$ be observable data whose joint distribution is indexed by a parameter $θ$ taking values in a subset $\Omega$ of k-dimensional space. Let $h$ be a function from $\Omega$ into d-dimensional space. Deﬁne $ψ = h(θ)$. An estimator of $ψ$ is a function $δ(X_1, ..., X_n)$ that takes values in d-dimensional space. If $X_1 = x_1, ..., X_n = x_n$ are observed, then $δ(x_1, ..., x_n)$ is called the estimate of $ψ$.

**Definition 7.5.1**

Likelihood Function

When the joint p.d.f. or the joint p.f. $f_n(x|θ)$ of the observations in a random sample is regarded as a function of $θ$ for given values of $x_1, ..., x_n$, it is called the likelihood function.

**Definition 7.5.2**

Maximum Likelihood Estimator/Estimate

For each possible observed vector $x$, let $δ(x) ∈ \Omega$ denote a value of $θ ∈ \Omega$ for which the likelihood function $f_n(x|θ)$ is a maximum, and let $\hat{θ̂} = δ(X)$ be the estimator of $θ$ deﬁned in this way. The estimator $\hat{θ̂}$ is called a maximum likelihood estimator of $θ$. After $X = x$ is observed, the value $δ(x)$ is called a maximum likelihood estimate of $θ$.

**Theorem 7.6.1**

Invariance Property of M.L.E.’s

If $\hat{θ̂}$ is the maximum likelihood estimator of $θ$ and if $g$ is a one-to-one function, then $g(\hat{\theta)}$ is the maximum likelihood estimator of $g(θ)$

**Definition 7.6.1**

M.L.E. of a Function

Let $g(θ)$ be an arbitrary function of the parameter, and let $G$ be the image of $\Omega$ under the function $g$. For each $t ∈ G$, deﬁne $G_t = {θ : g(θ) = t}$ and deﬁne 

$$L^∗(t) = \max_{θ∈G_t} log f_n(\vec{x}|θ)$$

Finally, deﬁne the M.L.E. of $g(θ)$ to be $\hat{t}$ where

Eq.(7.6.1)

$$L^∗(\hat{t}) = \max_{t∈G} L^∗(t)$$

**Theorem 7.6.2**

Let $\hat{θ}$ be an M.L.E. of $θ$, and let $g(θ)$ be a function of $θ$. Then an M.L.E. of $g(θ)$ is $g(\hat{θ})$.

**Definition 7.6.2**

Newton’s Method

Let $f(θ)$ be a real-valued function of a real variable, and suppose that we wish to solve the equation $f(θ) = 0$. Let $θ_0$ be an initial guess at the solution. Newton’s method replaces the initial guess with the updated guess

$$θ_1 = θ_0 − \frac{f(θ_0)}{f^{'}(θ_0)}$$

**Definition 7.6.3**

Method of Moments

Assume that $X_1, ..., X_n$ form a random sample from a distribution that is indexed by a k-dimensional parameter $θ$ and that has at least $k$ ﬁnite moments. For $j = 1, ..., k$, let $μ_j(θ) = E(X_1^j|θ)$. Suppose that the function $μ(θ) = (μ_1(θ), ..., μ_k(θ))$ is a one-to-one function of $θ$. Let $M(μ_1,... ,μ_k)$ denote the inverse function, that is, for all $θ$, 

$$θ = M(μ_1(θ), ..., μ_k(θ))$$

Deﬁne the sample moments by $m_j = \frac{1}{n}\sum_{i=1}^n X_i^j$ for $j = 1, ..., k$. The method of moments estimator of $θ$ is $M(m_1, ..., m_j)$.

**Theorem 7.6.3**

Suppose that $X_1, X_2, ...$ are i.i.d. with a distribution indexed by a k-dimensional parameter vector $θ$. Suppose that the ﬁrst $k$ moments of that distribution exist and are ﬁnite for all $θ$. Suppose also that the inverse function M in Deﬁnition 7.6.3 is continuous. Then the sequence of method of moments estimators based on $X_1, ..., X_n$ is a consistent sequence of estimators of $θ$.

**Definition 7.7.1**

Sufficient Statistic

Let $X_1, ..., X_n$ be a random sample from a distribution indexed by a parameter $θ$. Let $T$ be a statistic. Suppose that, for every $θ$ and every possible value $t$ of $T$, the conditional joint distribution of $X_1, ..., X_n$ given that $T = t$ (and $θ$) depends only on $t$ but not on $θ$. That is, for each $t$, the conditional distribution of $X_1, ..., X_n$ given $T = t$ and $θ$ is the same for all $θ$. Then we say that $T$ is a sufficient statistic for the parameter $θ$.

**Theorem 7.7.1**

Factorization Criterion

Let $X_1, ..., X_n$ form a random sample from either a continuous distribution or a discrete distribution for which the p.d.f. or the p.f. is $f(x|θ)$, where the value of $θ$ is unknown and belongs to a given parameter space $\Omega$. A statistic $T = r(X_1, ..., X_n)$ is a sufficient statistic for $θ$ if and only if the joint p.d.f. or the joint p.f. $f_n(\vec{x}|θ)$ of $X_1, ..., X_n$ can be factored as follows for all values of $\vec{x} = (x_1, ..., x_n) ∈ R^n$ and all values of $θ ∈ \Omega$

Eq.(7.7.1)

$$f_n(\vec{x}|θ) = u(\vec{x})v[r(\vec{x}), θ]$$

**Corollary 7.7.1**

A statistic $T = r(X)$ is sufﬁcient if and only if, no matter what prior distribution we use, the posterior distribution of $θ$ depends on the data only through the value of $T$.
