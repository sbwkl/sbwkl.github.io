**Theorem 1.4.1**

Let A, B, and C be events. Then $A \subset S$

if $A \subset B$ and $B \subset A$, then $A = B$

if $A \subset B$ and $B \subset C$, then $A \subset C$

**Theorem 1.4.2**

Let A be an event. Then $\empty \subset A$

**Theorem 1.4.3**

$$
(A^c)^c = A \\
\empty^c = S \\
S^c = \empty
$$

**Theorem 1.4.4**

$$
A \cup B = B \cup A \\
A \cup A = A \\
A \cup A^c = S \\
A \cup \empty = A \\
A \cup S = S \\
if A \subset B \text{, then} \ A \cup B = B
$$

**Theorem 1.4.6**

$$
A \cup B \cup C = (A \cup B) \cup C = A \cup (B \cup C)
$$

**Theorem 1.4.7**

$$
A \cap B = B \cap A \\
A \cap A = A \\
A \cap A^c = \empty \\
A \cap \empty = \empty \\
A \cap S = A \\
if A \subset B, then A \cap B = A
$$

**Theorem 1.4.8**

$$
A \cap B \cap C = (A \cap B) \cap C = A \cap (B \cap C)
$$

**Theorem 1.4.9**

$$
(A \cup B)^c = A^c \cap B^c
\\
(A \cap B)^c = A^c \cup B^c
$$

**Theorem 1.4.10**

$$
A \cap (B \cup C) = (A \cap B) \cup (A \cap C)
\\
A \cup (B \cap C) = (A \cup B) \cap (A \cup C)
$$

**Theorem 1.4.11**

$$
A = (A \cap B) \cup (A \cap B^c)
\\
A \cup B = B \cup (A \cap B^c)
$$

**Theorem 1.5.1**

$$
P(\empty) = 0
$$

**Theorem 1.5.2**

for every disjoint event

$$
P(\bigcup_{i = 1}^{n}A_i) = \sum_{i=1}^{n}P(A_i)
$$

**Theorem 1.5.3**

$$
P(A^c) = 1 - P(A)
$$

**Theorem 1.5.4**

$$
if A \subset B, then P(A) \le P(B)
$$

**Theorem 1.5.5**

$$
0 \le P(A) \le 1
$$

**Theorem 1.5.6**

$$
P(A \cap B^c) = P(A) - P(A \cap B)
$$

**Theorem 1.5.7**

$$
P(A \cup B) = P(A) + P(B) - P(A \cap B)
$$

**Theorem 1.5.8**

$$
P(\bigcup_{i = 1}^{n}A_i) \le \sum_{i = 1}^{n}P(A_i) 
\\
\\
P(\bigcap_{i = 1}^{n}A_i) \ge 1 - \sum_{i = 1}^{n}P(A_i^c)
$$

**Theorem 1.7.1**

Multiplication Rule for Two-Part Experiments

S = nm


**Theorem 1.7.2**

Multiplication Rule

$$
S = n_1n_2...n_k
$$

**Theorem 1.7.3**

$$P_{n, k} = n(n - 1)...(n - k + 1)$$

**Theorem 1.7.4**

$$
P_{n, k} = \frac{n!}{(n - k)!}
$$

**Theorem 1.7.5**

$$
S_n = \frac{1}{2}log(2\pi) + (n + \frac{1}{2})log(n) - n
$$

$$
\lim\limits_{n -> \infty} |S_n - log(n!)| = 0
$$

$$
\lim\limits_{n -> \infty}\frac{(2\pi)^{1/2}n^{n + 1/2} e^{-n}}{n!} = 1
$$

**Theorem 1.8.1**

$$
C_{n, k} = \frac{P_{n, k}}{k!} = \frac{n!}{k!(n - k)!}
$$

**Theorem 1.8.2**

$$
(x + y) = \sum{k = 0}{n}\binom{n}{k}x^ky^{n - k}
$$

**Theorem 1.8.3**

$$
\binom{n}{0} = \binom{n}{n} = 1
$$

$$
\binom{n}{k} = \binom{n}{n - k}
$$

**Theorem 1.9.1**

$$
(x_1 + x_2 + ... + x_k)^n = \sum\binom{n}{n_1, n_2, ... , n_k}x_1^{n_1}x_2^{n_2}...x_k^{n_k}
$$

**Theorem 1.10.1**

$$
P(A_1 \cup A_2 \cup A_3) = P(A_1) + P(A_2) + P(A_3) \\
- [P(A_1 \cap A_2) + P(A_2 \cap A_3) + P(A_1 \cap A_3)] \\
+ P(A_1 \cap A_2 \cap A_3)
$$

**Theorem 1.10.2**

$$
P(\bigcup_{i = 1}^{n} A_i) = \sum_{i = 1}^{n}P(A_i) - \sum_{i <j}^{}P(A_i \cap A_j) \\
+ \sum_{i < j < k}^{}P(A_i \cap A_j \cap A_k) - ... \\
+ (-1)^{n + 1}P(A_i \cap A_2 \cap ... \cap A_n)
$$

**Theorem 2.1.1**

$$
P(A \cap B) = P(B) P(A | B) \\
P(A \cap B) = P(A) P(B | A)
$$

**Theorem 2.1.2**

$$
P(A_1 \cap A_2 \cap ... \cap A_n) = P(A_1)P(A_2 | A_1)P(A_3 | A_1 \cap A_2) ... P(A_n | A_1 \cap A_2 \cap ... \cap A_{n - 1})
$$

**THeorem 2.1.3**

$$
P(A_1 \cap A_2 \cap ... \cap A_n | B) = P(A_1 | B) P(A_2 | A_1 \cap B) ... P(A_n|A_1 \cap A_2 \cap ... \cap A_{n-1} \cap B)
$$

**Theorem 2.1.4**

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

**Theorem 2.2.1**

A, B independent

$$
P(A \cap B^c) = P(A)P(B^c)
$$

**Theorem 2.2.2**

A<sub>i</sub> i = 1, 2, ..., k 独立，当且仅当任何两个不相交的子集满足

$$
P(A_{i_1} \cap ... \cap A_{i_m} | A_{j_1} \cap ... \cap A_{J_l}) = P(A_{i_1} \cap ... \cap A_{i_m})
$$

**Theorem 2.2.3**

Let n > 1 and let A<sub>1</sub>, . . . , A<sub>n</sub> be events that are mutually exclusive. The events are
also mutually independent if and only if all the events except possibly one of them
has probability 0.

**Theorem 2.2.4**

Suppose that A1, A2, and B are events such that Pr(A1 ∩ B) > 0. Then A1 and A2 are
conditionally independent given B if and only if Pr(A2|A1 ∩ B) = Pr(A2|B).

**Theorem 2.3.1**

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

**Theorem 3.3.1**

$$
P(X \gt x) = 1 - F(x)
$$

**Theorem 3.3.2**

$$
P(x_1 \lt X \le x_2) = F(x_2) - F(x_1)
$$

**Theorem 3.3.3**

$$
P(X \lt x) = F(x^{-})
$$

**Theorem 3.3.4**

$$
P(X=x) = F(x) - F(x^{-})
$$

**Theorem 3.3.5**

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

If $E(\vert X \vert^k) \lt \infty$ for some positive integer k, then $E(\vert X \vert^j) \lt \infty$ for every positive integer j such that j < k

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

The number $E(\vert X − d \vert)$ is called the mean absolute error (M.A.E.) of the prediction d.

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

Let X and Y be random variables such that the mean of Y exists and is ﬁnite. The conditional expectation (or conditional mean) of Y given X = x is denoted by $E(Y \vert x)$ and is deﬁned to be the expectation of the conditional distribution of Y given X = x.

**Definition 4.7.2**

Conditional Means as Random Variables

Let $h(x)$ stand for the function of x that is denoted $E(Y \vert x)$ in either (4.7.1) or (4.7.2). Deﬁne the symbol $E(Y|X)$ to mean $h(X)$ and call it the conditional mean of Y given X.

**Theorem 4.7.1**

Law of Total Probability for Expectations

Let $X$ and $Y$ be random variables such that $Y$ has ﬁnite mean. Then

Eq.(4.7.3)

$$E[E(Y |X)] = E(Y )$$

**Theorem 4.7.2**

Let $X$ and $Y$ be random variables, and let $Z = r(X, Y)$ for some function $r$. The conditional distribution of $Z$ given $X = x$ is the same as the conditional distribution of $r(x, Y)$ given $X = x$.

**Definition 4.7.3**

Conditional Variance

For every given value $x$, let $Var(Y \vert x)$ denote the variance of the conditional distribution of $Y$ given that $X = x$. That is,

Eq.(4.7.5)

$$Var(Y|x) = E\{[Y − E(Y|x)]^2|x\}$$

We call $Var(Y|x)$ the conditional variance of $Y$ given $X = x$.

**Theorem 4.7.3**

The prediction $d(X)$ that minimizes $E\{[Y − d(X)]^2\}$ is $d(X) = E(Y|X)$

**Theorem 4.7.4**

Law of Total Probability for Variances

If X and Y are arbitrary random variables for which the necessary expectations and variances exist, then $Var(Y ) = E[Var(Y|X)] + Var[E(Y|X)]$.

**Definition 4.8.1**

Utility Function

A person’s utility function U is a function that assigns to each possible amount x (−∞ < x < ∞) a number U(x) representing the actual worth to the person of gaining the amount x.

**Definition 4.8.2**

Maximizing Expected Utility

We say that a person chooses between gambles by maximizing expected utility if the following conditions hold. There is a utility function U, and when the person must choose between any two gambles X and Y, he will prefer X to Y if $E[U(X)] > E[U(Y )]$ and will be indifferent between X and Y if $E[U(X)] = E[U(Y )]$.

**Definition 5.2.1**

Bernoulli Distribution

A random variable X has the Bernoulli distribution with parameter p (0 ≤ p ≤ 1) if X can take only the values 0 and 1 and the probabilities are

Eq.(5.2.1)

Pr(X = 1) = p and Pr(X = 0) = 1 − p.

The p.f. of X can be written as follows:

Eq.(5.2.2)

$$
f (x|p) = \begin{cases} &p^x(1 − p)^{1−x} \ \ \ \text{for } x = 0, 1 \\
&0  
\end{cases}
$$

**Definition 5.2.2**

Bernoulli Trials/Process

If the random variables in a finite or infinite sequence $X_1,X_2, . . .$ are i.i.d., and if each random variable $X_i$ has the Bernoulli distribution with parameter p, then it is said that $X_1, X_2, . . .$ are Bernoulli trials with parameter p. An infinite sequence of Bernoulli trials is also called a Bernoulli process.

**Definition 5.2.3**

Binomial Distribution

A random variable X has the binomial distribution with parameters n and p if X has a discrete distribution for which the p.f. is as follows:

Eq.(5.2.3)

$$
f (x|n, p) =  \begin{cases} \binom{n}{x} p^x(1 − p)^{n−x} \ \ for \ x = 0, 1, 2, . . . , n \\
0
\end{cases}
$$

**Theorem 5.2.1**

If the random variables $X_1, . . . , X_n$ form n Bernoulli trials with parameter p, and if $X = X_1 + . . . + X_n$, then X has the binomial distribution with parameters n and p.

**Theorem 5.2.2**

If $X_1, . . . , X_k$ are independent random variables, and if $X_i$ has the binomial distribution with parameters $n_i$ and p (i = 1, . . . , k), then the sum $X_1 + . . . + X_k$ has the binomial distribution with parameters $n = n_1 + . . . + n_k$ and p

**Theorem 5.3.1**

Probability Function

The distribution of X in Example 5.3.1 has the p.f.

Eq.(5.3.1)

$$
f (x|A, B, n) = \frac{\binom{A}{x} \binom{B}{n − x}}{\binom{A + B}{n}}
$$

for max{0, n − B} ≤ x ≤ min{n, A}, (5.3.2) and f (x|A, B, n) = 0 otherwise.

**Definition 5.3.1**

Hypergeometric Distribution

Let A, B, and n be nonnegative integers with n ≤ A + B. If a random variable X has a discrete distribution with p.f. as in Eqs. (5.3.1) and (5.3.2), then it is said that X has the hypergeometric distribution with parameters A, B, and n.

**Theorem 5.3.2**

Mean and Variance

Let X have a hypergeometric distribution with strictly positive parameters A, B, and n. Then

Eq.(5.3.3)

$$E(X) = \frac{nA}{A + B}$$

Eq.(5.3.4)

$$Var(X) = \frac{nAB}{(A + B)^2}.\frac{A + B − n}{A + B − 1}$$

**Theorem 5.3.3**

Let $a_n$ and $c_n$ be sequences of real numbers such that $a_n$ converges to 0, and $c_na_n^2$ converges to 0. Then

$$
\lim_{n→∞}(1 + a_n)^{c_n}e^{−a_nc_n} = 1
$$

In particular, if $a_nc_n$ converges to b, then $(1 + a_n)^{c_n}$ converges to $e^b$

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

For each integer n and each 0 < p < 1, let $f (x \vert n, p)$ denote the p.f. of the binomial distribution with parameters n and p. Let $f (x \vert λ)$ denote the p.f. of the Poisson distribution with mean λ. Let ${p_n}_{n=1}^∞$ be a sequence of numbers between 0 and 1 such that $\lim_{n→∞} np_n = λ$. Then

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

**Definition 5.4.2**

Poisson Process

A Poisson process with rate λ per unit time is a process that satisfies the following two properties:

+ The number of arrivals in every fixed interval of time of length t has the Poisson
distribution with mean λt.
+ The numbers of arrivals in every collection of disjoint time intervals are independent.

**Theorem 5.5.1**

Sampling until a Fixed Number of Successes

Suppose that an infinite sequence of Bernoulli trials with probability of success p are available. The number X of failures that occur before the rth success has the following p.d.f.:

Eq.(5.5.1)

$$
f(x|r, p) = \begin{cases}
\binom{r+x-1}{x}p^r(1-p)^x \ \ \text{for x = 0, 1, 2,...} \\
0
\end{cases}
$$

**Definition 5.5.1**

Negative Binomial Distribution

A random variable X has the negative binomial distribution with parameters r and p (r = 1, 2, . . . and 0 < p < 1) if X has a discrete
distribution for which the p.f. $f (x \vert r, p)$ is as specified by Eq. (5.5.1).

**Definition 5.5.2**

Geometric Distribution

A random variable X has the geometric distribution with parameter p (0 < p < 1) if X has a discrete distribution for which the p.f. $f (x\vert 1, p)$ is as follows:

**Theorem 5.5.2**

If $X_1, . . . , X_r$ are i.i.d. random variables and if each $X_i$ has the geometric distribution with parameter p, then the sum $X_1 + . . . + X_r$ has the negative binomial distribution with parameters r and p.

**Theorem 5.5.3**

Moment Generating Function

If X has the negative binomial distribution with parameters r and p, then the m.g.f. of X is as follows:

Eq.(5.5.6)

$$
ψ(t) = (\frac{p}{1 − (1 − p)e^t})^r \ \ \  \text{for} \ t < log(\frac{1}{1-p})
$$

**Theorem 5.5.4**

Mean and Variance

If X has the negative binomial distribution with parameters r and p, the mean and the variance of X must be

Eq.(5.5.7)

$$
E(X) = \frac{r(1 − p)}{p}
$$
and 

$$Var(X) = \frac{r(1 − p)}{p^2}$$

**Theorem 5.5.5**

Memoryless Property of Geometric Distributions

Let X have the geometric distribution with parameter p, and let k ≥ 0. Then for every integer t ≥ 0,

$$
Pr(X = k + t|X ≥ k) = Pr(X = t).
$$

**Definition 5.6.1**

Definition and p.d.f.

A random variable X has the normal distribution with mean μ and variance σ 2 (−∞ < μ < ∞ and σ > 0) if X has a continuous distribution with the following p.d.f.:

Eq.(5.6.1)

$$
f (x|μ, σ^2) = \frac{1}{(2π)^{1/2}σ} exp[−\frac{1}{2} (\frac{x − μ}{\sigma})^2] \ \ \ \text{for} −∞ < x < ∞
$$

**Theorem 5.6.2**

Moment Generating Function

The m.g.f. of the distribution with p.d.f. given by Eq. (5.6.1) is

Eq.(5.6.5)

$$
ψ(t) = exp (μt + \frac{1}{2}σ^2t^2) \ \ \ \text{for} −∞ < t < ∞.
$$

**Theorem 5.6.3**

Mean and Variance

The mean and variance of the distribution with p.d.f. given by Eq. (5.6.1) are $μ$ and $σ^2$, respectively.

**Theorem 5.6.4**

If X has the normal distribution with mean $μ$ and variance $σ^2$ and if Y = aX + b, where a and b are given constants and a = 0, then Y has the normal distribution with mean $aμ + b$ and variance $a^2σ^2$

**Definition 5.6.2**

Standard Normal Distribution

The normal distribution with mean 0 and variance 1 is called the standard normal distribution. The p.d.f. of the standard normal distribution is usually denoted by the symbol $\phi$, and the c.d.f. is denoted by the symbol $\Phi$. Thus,

Eq.(5.6.6)

$$
\phi(x) = f (x|0, 1) = \frac{1}{(2π)^{1/2}} exp(−\frac{1}{2}x^2) \ \ \ \text{for} −∞ < x < ∞
$$

Eq.(5.6.7)

$$
\Phi(x) = \int_{−∞}^x \phi(u) du \ \ \ \text{for} −∞ < x < ∞,
$$

**Theorem 5.6.5**

Consequences of Symmetry

For all x and all 0 < p < 1,

Eq.(5.8.6)

$\Phi(−x) = 1 − \Phi(x)$ and $\Phi^{−1}(p) = −\Phi^{−1}(1 − p)$

**Theorem 5.6.6**

Converting Normal Distributions to Standard

Let X have the normal distribution with mean μ and variance $σ^2$. Let F be the c.d.f. of X. Then $Z = (X − μ)/σ$ has the standard normal distribution, and, for all x and all 0 < p < 1

Eq.(5.6.9)

$$
F(x) = \Phi(\frac{x − μ}{σ})
$$

Eq.(5.6.10)

$$
F^{−1}(p) = μ + σ\Phi^{−1}(p).
$$

**Theorem 5.6.7**

If the random variables $X_1, . . . , X_k$ are independent and if $X_i$ has the normal distribution with mean $μ_i$ and variance $σ_i^2$ (i = 1, . . . , k), then the sum $X_1 + . . . + X_k$ has the normal distribution with mean $μ_1 + . . . + μ_k$ and variance $σ_1^2 + . . . + σ_k^2$

**Corollary 5.6.1**

If the random variables $X_1, . . . , X_k$ are independent, if $X_i$ has the normal distribution with mean $μ_i$ and variance $σ_i^2$ (i = 1, . . . , k), and if $a_1, . . . , a_k$ and b are constants for which at least one of the values $a_1, . . . , a_k$ is different from 0, then the variable $a_1X_1 + . . . + a_kX_k + b$ has the normal distribution with mean $a_1μ_1 + . . . + a_kμ_k + b$ and variance $a_1^2σ_1^2 + . . . + a_k^2σ_k^2$

**Definition 5.6.3**

Sample Mean

Let $X_1, . . . , X_n$ be random variables. The average of these n random
variables, $\frac{1}{n}\sum_{i=1}^n X_i$, is called their sample mean and is commonly denoted $\overline{X}_n$

**Corollary 5.6.2**

Suppose that the random variables $X_1, . . . , X_n$ form a random sample from the normal distribution with mean $μ$ and variance $σ^2$, and let Xn denote their sample mean. Then $\overline{X}_n$ has the normal distribution with mean $μ$ and variance $σ^2/n$

**Definition 5.6.4**

Lognormal Distribution

If $log(X)$ has the normal distribution with mean $μ$ and variance $σ^2$, we say that X has the lognormal distribution with parameters $μ$ and $σ^2$

**Definition 5.7.1**

The Gamma Function

For each positive number $α$, let the value $\Gamma(α)$ be defined by the following integral:

Eq(5.7.2)

$$\Gamma(α) = \int_0^∞ x^{α−1}e^{−x}dx$$

**Theorem 5.7.1**

Eq.(5.7.4)

If α > 1, then $\Gamma(α) = (α − 1)\Gamma(α − 1)$

**Theorem 5.7.2**

Eq.(5.7.5)

For every positive integer n, $\Gamma(n) = (n − 1)!$

**Theorem 5.7.3**

Eq.(5.7.10)

For each α > 0 and each β > 0

$$\int_0^∞ x^{α−1} exp(βx)dx = \frac{β^α}{\Gamma(α)}$$

**Theorem 5.7.4**

Stirling’s Formula

$$
\lim_{x→∞} \frac{(2π)^{1/2}x^{x−1/2}e^{−x}}{\Gamma(x)} = 1
$$

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

$X_i$ random sample with mean $\mu$ and variance $\sigma^2$. Let $\overline{X_n}$ be the sample mean. Then $E(\overline{X_n}) = \mu$ and $Var(\overline{X_n}) = \sigma^2/n$

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

Suppose that $X_1, ..., X_n$ form a random sample from a distribution for which the mean is $\mu$ and for which the variance is finite. Let $\overline{X_n}$ denote the sample mean. Then

$$
\overline{X}_n \xrightarrow{p} \mu
$$

**Theorem 6.2.5**

Continues Functions of Random Variables

if $Z_n \xrightarrow{p} b$, and if $g(z)$ is a function that is continues at $z = b$, then $g(Z_n) \xrightarrow{p}g(b)$.

**Theorem 6.2.6**

Histograms

Let $X_1, X_2, ...$ be a sequence of i.i.d. random variables. Let $c_1 \lt c_2$ be two constants. Define $Y_i = 1$ if $c_1 \le Y_i \lt c_2$ and $Y_i = 0$ if not. Then $\overline{Y_n} = \frac{1}{n}\sum_{i=1}^{n}Y_i$ is proportion of $X_1, X_2, ...$ that lie in the interval $[c_1, c_2)$, and $\overline{Y_n} \xrightarrow{p}P(c_1 \le X_i \lt c_2)$.

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
\lim_{n->\infty} p[\frac{\overline{X}_n - \mu}{\sigma/\sqrt{n}} \le x] = \Phi(x)
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

Let $Y_1, Y_2, ...$ be a sequence of random variables and let $F^*$ be a continuous c.d.f. Let $\theta$ be a real number, and let $a_1, a_2, ...$ be a sequence of positive numbers that increase to $\infty$ . Supporse that $a_n(Y_n-\theta)$ converages in distribution to $F^*$ . Let $\alpha$ be a function with continuous derivative such that $\alpha'(\theta) \ne 0$ . Then $a_n[\alpha(Y_n)-\alpha(\theta)]/\alpha'(\theta)$ converges in distribution to $F^*$

**Corollary 6.3.1**

Delta Method for Average of a Random Sample

Let $X_1, X_2, ...$ be a sequence of i.i.d. random variables from a distribution with mean μ and ﬁnite variance $σ^2$. Let α be a function with continuous derivative such that $α'(μ) \ne 0$. Then the asymptotic distribution of

$$
\frac{\sqrt{n}}{σ α'(μ)}[α(\overline{X}_n) − α(μ)]
$$

is the standard normal distribution.

Eq.(6.3.8)

$$
Y_n=\frac{\sum_{i=1}^nX_i - \sum_{i=1}^n\mu_i}{(\sum_{i=1}^n\sigma_i^2)^{1/2}}
$$

**Theorem 6.3.3**

Suppose that the random variables $X_1, X_2, ...$ are independent and that $E(\vert X_i − μ_i \vert ^3 ) < ∞$ for i = 1, 2, . . . Also, suppose that

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

Consider a statistical inference problem with parameter $θ$ and random variables $X_1, ..., X_n$ to be observed. The conditional distribution of $θ$ given $X_1, ... , X_n$ is called the posterior distribution of $θ$. The conditional p.f. or p.d.f. of $θ$ given $X_1 = x_1, ..., X_n = x_n$ is called the posterior p.f. or posterior p.d.f. of $θ$ and is typically denoted $ξ(θ \vert x_1, ..., x_n)$.

**Theorem 7.2.1**

Suppose that the n random variables $X_1, ..., X_n$ form a random sample from a distribution for which the p.d.f. or the p.f. is $f(x \vert θ)$. Suppose also that the value of the parameter $θ$ is unknown and the prior p.d.f. or p.f. of $θ$ is $ξ(θ)$. Then the posterior p.d.f. or p.f. of $θ$ is

$$
ξ(θ|\vec{x}) = \frac{f(x_1|θ) ... f(x_n|θ)ξ(θ)}{g_n(\vec{x})}
$$
for $θ ∈ \Omega$, where $g_n$ is the marginal joint p.d.f. or p.f. of $X_1, ..., X_n$.

**Definition 7.2.3**

Likelihood Function

When the joint p.d.f. or the joint p.f. $f_n(x \vert θ)$ of the observations in a random sample is regarded as a function of $θ$ for given values of $x_1, ..., x_n$, it is called the likelihood function.

**Theorem 7.3.1**

Suppose that $X_1, ..., X_n$ form a random sample from the Bernoulli distribution with parameter θ, which is unknown (0 < θ < 1). Suppose also that the prior distribution of θ is the beta distribution with parameters α > 0 and β > 0. Then the posterior distribution of θ given that $X_i = x_i (i = 1, ..., n)$ is the beta distribution with parameters $α + \sum_{i=1}^n x_i$ and $β + n − \sum_{i=1}^n x_i$.

**Definition 7.3.1**

Conjugate Family/Hyperparameters

Let $X_1, X_2, ...$ be conditionally i.i.d. given θ with common p.f. or p.d.f. $f(x \vert θ)$. Let $\Psi$ be a family of possible distributions over the parameter space $\Omega$. Suppose that, no matter which prior distribution ξ we choose from $\Psi$, no matter how many observations $X = (X_1, ..., X_n)$ we observe, and no matter what are their observed values $x = (x_1, ..., x_n)$, the posterior distribution $ξ(θ \vert x)$ is a member of $\Psi$. Then $\Psi$ is called a conjugate family of prior distributions for samples from the distributions $f(x \vert θ)$. It is also said that the family $\Psi$ is closed under sampling from the distributions $f(x \vert θ)$. Finally, if the distributions in $\Psi$ are parametrized by further parameters, then the associated parameters for the prior distribution are called the prior hyperparameters and the associated parameters of the posterior distribution are called the posterior hyperparameters.

**Theorem 7.3.2**

Suppose that $X_1, ..., X_n$ form a random sample from the Poisson distribution with mean θ > 0, and θ is unknown. Suppose also that the prior distribution of θ is the gamma distribution with parameters α > 0 and β > 0. Then the posterior distribution of θ, given that $X_i = x_i (i = 1, ..., n)$, is the gamma distribution with parameters $α + \sum_{i=1}^n x_i$ and $β + n$.

**Theorem 7.3.3**

Suppose that $X_1, ..., X_n$ form a random sample from a normal distribution for which the value of the mean $θ$ is unknown and the value of the variance $σ^2 > 0$ is known. Suppose also that the prior distribution of $θ$ is the normal distribution with mean $μ_0$ and variance $v_0^2$. Then the posterior distribution of $θ$ given that $X_i = x_i (i = 1, ..., n)$ is the normal distribution with mean $μ_1$ and variance $v_1^2$ where

$$
\mu_1 = \frac{\sigma^2\mu_0 + n v_0^2 \overline{x}_n}{\sigma^2 + nv_0^2}
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

Let $L(θ, a)$ be a loss function. For each possible value $x$ of $X$, let $δ^∗(x)$ be a value of a such that $E[L(θ, a) \vert x]$ is minimized. Then $δ^∗$ is called a Bayes estimator of $θ$. Once $X = x$ is observed, $δ^∗(x)$ is called a Bayes estimate of $θ$.

**Definition 7.4.4**

Squared Error Loss Function

The loss function 

Eq.(7.4.4)

$$L(θ, a) = (θ − a)^2$$

is called squared error loss.

**Corollary 7.4.1**

Let $θ$ be a real-valued parameter. Suppose that the squared error loss function (7.4.4) is used and that the posterior mean of $θ$, $E(θ \vert X)$, is ﬁnite. Then, a Bayes estimator of $θ$ is $δ^∗(X) = E(θ \vert X)$.

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

When the joint p.d.f. or the joint p.f. $f_n(x \vert θ)$ of the observations in a random sample is regarded as a function of $θ$ for given values of $x_1, ..., x_n$, it is called the likelihood function.

**Definition 7.5.2**

Maximum Likelihood Estimator/Estimate

For each possible observed vector $x$, let $δ(x) ∈ \Omega$ denote a value of $θ ∈ \Omega$ for which the likelihood function $f_n(x \vert θ)$ is a maximum, and let $\hat{θ̂} = δ(X)$ be the estimator of $θ$ deﬁned in this way. The estimator $\hat{θ̂}$ is called a maximum likelihood estimator of $θ$. After $X = x$ is observed, the value $δ(x)$ is called a maximum likelihood estimate of $θ$.

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

$$θ_1 = θ_0 − \frac{f(θ_0)}{f'(θ_0)}$$

**Definition 7.6.3**

Method of Moments

Assume that $X_1, ..., X_n$ form a random sample from a distribution that is indexed by a k-dimensional parameter $θ$ and that has at least $k$ ﬁnite moments. For $j = 1, ..., k$, let $μ_j(θ) = E(X_1^j \vert θ)$. Suppose that the function $μ(θ) = (μ_1(θ), ..., μ_k(θ))$ is a one-to-one function of $θ$. Let $M(μ_1,... ,μ_k)$ denote the inverse function, that is, for all $θ$,

$$θ = M(μ_1(θ), ..., μ_k(θ))$$

Deﬁne the sample moments by $m_j = \frac{1}{n}\sum_{i=1}^n X_i^j$ for $j = 1, ..., k$. The method of moments estimator of $θ$ is $M(m_1, ..., m_j)$.

**Theorem 7.6.3**

Suppose that $X_1, X_2, ...$ are i.i.d. with a distribution indexed by a k-dimensional parameter vector $θ$. Suppose that the ﬁrst $k$ moments of that distribution exist and are ﬁnite for all $θ$. Suppose also that the inverse function M in Deﬁnition 7.6.3 is continuous. Then the sequence of method of moments estimators based on $X_1, ..., X_n$ is a consistent sequence of estimators of $θ$.

**Definition 7.7.1**

Sufficient Statistic

Let $X_1, ..., X_n$ be a random sample from a distribution indexed by a parameter $θ$. Let $T$ be a statistic. Suppose that, for every $θ$ and every possible value $t$ of $T$, the conditional joint distribution of $X_1, ..., X_n$ given that $T = t$ (and $θ$) depends only on $t$ but not on $θ$. That is, for each $t$, the conditional distribution of $X_1, ..., X_n$ given $T = t$ and $θ$ is the same for all $θ$. Then we say that $T$ is a sufficient statistic for the parameter $θ$.

**Theorem 7.7.1**

Factorization Criterion

Let $X_1, ..., X_n$ form a random sample from either a continuous distribution or a discrete distribution for which the p.d.f. or the p.f. is $f(x \vert θ)$, where the value of $θ$ is unknown and belongs to a given parameter space $\Omega$. A statistic $T = r(X_1, ..., X_n)$ is a sufficient statistic for $θ$ if and only if the joint p.d.f. or the joint p.f. $f_n(\vec{x} \vert θ)$ of $X_1, ..., X_n$ can be factored as follows for all values of $\vec{x} = (x_1, ..., x_n) ∈ R^n$ and all values of $θ ∈ \Omega$

Eq.(7.7.1)

$$f_n(\vec{x}|θ) = u(\vec{x})v[r(\vec{x}), θ]$$

**Corollary 7.7.1**

A statistic $T = r(X)$ is sufﬁcient if and only if, no matter what prior distribution we use, the posterior distribution of $θ$ depends on the data only through the value of $T$.

**Definition 7.8.1**

Jointly Sufficient Statistics

Suppose that for each $θ$ and each possible value $(t_1, ..., t_k)$ of $(T_1, ..., T_k)$, the conditional joint distribution of $(X_1, ..., X_n)$ given $(T_1, ..., T_k) = (t_1, ..., t_k)$ does not depend on $θ$. Then $T_1, ..., T_k$ are called jointly sufficient statistics for $θ$.

**Theorem 7.8.1**

Factorization Criterion for Jointly Sufficient Statistics

Let $r_1, . . . , r_k$ be functions of $n$ real variables. The statistics $T_i = r_i(X), i = 1, . . . , k$, are jointly sufficient statistics for $θ$ if and only if the joint p.d.f. or the joint p.f. $f_n(\vec{x} \vert θ)$ can be factored as follows for all values of $x ∈ R^n$ and all values of $θ ∈ \Omega$:

$$f_n(\vec{x}|θ) = u(\vec{x})v[r_1(\vec{x}), . . . , r_k(\vec{x}), θ]$$

Here the functions $u$ and $v$ are nonnegative, the function $u$ may depend on $x$ but does not depend on $θ$, and the function $v$ will depend on $θ$ but depends on $x$ only through the $k$ functions $r_1(\vec{x}), . . . , r_k(\vec{x})$

**Definition 7.8.2**

Order Statistics

Suppose that $X_1, . . . , X_n$ form a random sample from some distribution. Let $Y_1$ denote the smallest value in the random sample, let $Y_2$ denote the next smallest value, let $Y_3$ denote the third smallest value, and so on. In this way, $Y_n$ denotes the largest value in the sample, and $Y_{n−1}$ denotes the next largest value. The random variables $Y_1, . . . , Y_n$ are called the order statistics of the sample.

**Theorem 7.8.2**

Order Statistics Are Sufficient in Random Samples

Let $X_1, . . . , X_n$ form a random sample from a distribution for which the p.d.f. or the p.f. is $f (x\vert θ)$. Then the order statistics $Y_1, . . . , Y_n$ are jointly sufficient for $θ$.

**Definition 7.8.3**

Minimal (Jointly) Sufficient Statistic(s)

A statistic $T$ is a minimal sufficient statistic if $T$ is sufficient and is a function of every other sufficient statistic. A vector $T =(T_1, . . . , T_k)$ of statistics are minimal jointly sufficient statistics if the coordinates of $T$ are jointly sufficient statistics and $T$ is a function of every other jointly sufficient statistics.

**Theorem 7.8.3**

M.L.E. and Sufficient Statistics

Let $T = r(X_1, . . . , X_n)$ be a sufficient statistic for $θ$. Then the M.L.E. $\hat θ$ of $θ$ depends on the observations $X_1, . . . , X_n$ only through the statistic $T$. Furthermore, if $\hat θ$ is itself sufficient, then it is minimal sufficient.

**Theorem 7.8.4**

Bayes Estimator and Sufficient Statistics

Let $T = r(X)$ be a sufficient statistic for $θ$. Then every Bayes estimator $\hat θ$ of $θ$ depends on the observations $X_1, . . . , X_n$ only through the statistic $T$. Furthermore, if $\hat θ$ is itself sufficient, then it is minimal sufficient.

Eq.(7.9.3)

$$δ_0 (T) = E[δ(X)|T]$$

**Theorem 8.9.1**

Let $δ(X)$ be an estimator, let $T$ be a sufﬁcient statistic for $θ$ , and let the estimator $δ_0 (T)$ be deﬁned as in Eq.(7.9.3). Then for every value of $θ ∈ \Omega$,

Eq.(7.9.4)

$$R(θ, δ_0 ) ≤ R(θ, δ)$$

Furthermore, if $R(θ, δ) < ∞$, there is strict inequality in (7.9.4) unless $δ(X)$ is a function of $T$

Eq.(7.9.1)

$$R(θ, δ) = E_θ ([δ(X) − h(θ )]^2)$$

Eq.(7.9.7)

$$R(θ, δ) = E_θ (|δ(X) − θ |)$$

**Definition 7.9.1**

Inadmissible/Admissible/Dominates

Suppose that $R(θ, δ)$ is deﬁned by either Eq.(7.9.1) or Eq.(7.9.7). It is said that an estimator $δ$ is inadmissible if there exists another estimator $δ_0$ such that $R(θ, δ_0 ) ≤ R(θ, δ)$ for every value of $θ ∈ \Omega$ and there is strict inequality in this relation for at least one value of $θ ∈ \Omega$. Under these conditions, it is also said that the estimator $δ_0$ dominates the estimator $δ$. An estimator $δ_0$ is admissible if there is no other estimator that dominates $δ_0$.

**Definition 8.1.1**

Sampling Distribution

Suppose that the random variables $\vec{X} = (X_1, . . . , X_n)$ form a random sample from a distribution involving a parameter $θ$ whose value is unknown. Let $T$ be a function of $X$ and possibly $θ$. That is, $T = r(X_1, . . . , X_n, θ)$. The distribution of $T$ (given $θ$) is called the sampling distribution of $T$. We will use the notation $E_θ(T )$ to denote the mean of $T$ calculated from its sampling distribution.

**Definition 8.2.1**

$χ^2$ Distributions

For each positive number $m$, the gamma distribution with parameters $α = m/2$ and $β = 1/2$ is called the $χ^2$ distribution with m degrees of freedom.

**Theorem 8.2.1**

Mean and Variance

If a random variable $X$ has the $χ^2$ distribution with $m$ degrees of freedom, then $E(X) = m$ and $Var(X) = 2m$.

**Theorem 8.2.2**

If the random variables $X_1 , . . . , X_k$ are independent and if $X_i$ has the $χ^2$ distribution with $m_i$ degrees of freedom $(i = 1, . . . , k)$, then the sum $X_1 + . . . + X_k$ has the $χ^2$ distribution with $m_1 + . . . + m_k$ degrees of freedom.

**Theorem 8.2.3**

Let $X$ have the standard normal distribution. Then the random variable $Y = X^2$ has the $χ^2$ distribution with one degree of freedom.

**Corollary 8.2.1**

If the random variables $X_1 , . . . , X_m$ are i.i.d. with the standard normal distribution, then the sum of squares $X_1^2 + . . . + X_m^2$ has the $χ^2$ distribution with $m$ degrees of freedom.

**Theorem 8.3.1**

Suppose that $X_1 , . . . , X_n$ form a random sample from the normal distribution with mean $μ$ and variance $σ^2$ . Then the sample mean $\overline{X}_n$ and the sample variance $1/n\sum_{i=1}^n(X_i−\overline{X}_n)^2$ are independent random variables, $\overline{X}_n$ has the normal distribution with mean $μ$ and variance $σ^2/n$ , and $\sum_{i=1}^n(X_i−\overline{X}_n)^2 /σ^2$ has the $χ^2$ distribution with $n − 1$ degrees of freedom.

**Theorem 8.3.2**

Determinant is 1

If A is orthogonal, then \|det A\| = 1.

**Theorem 8.3.3**

Squared Length Is Preserved

Consider two n-dimensional random vectors

Eq.(8.3.4)

$$
\vec{X} =
\begin{bmatrix}
X_1 \\
... \\
X_n
\end{bmatrix}
$$

$$
\vec{Y} =
\begin{bmatrix}
Y_1 \\
... \\
Y_n
\end{bmatrix}
$$

and suppose that $\vec{Y} = A\vec{X}$, where A is an orthogonal matrix. Then

Eq.(8.3.5)

$$
\sum_{i=1}^n Y_i^2 = \sum_{i=1}^n X_i^2
$$

**Theorem 8.3.4**

Suppose that the random variables, $X_1, . . . , X_n$ are i.i.d. and each has the standard normal distribution. Suppose also that A is an orthogonal n × n matrix, and $\vec{Y} = A\vec{X}$. Then the random variables $Y_1, . . . , Y_n$ are also i.i.d., each also has the standard normal distribution, and $\sum_{i=1}^n X_i^2 = \sum_{i=1}^n Y_i^2$

**Definition 8.4.1**

t Distributions

Consider two independent random variables $Y$ and $Z$, such that $Y$ has the $χ^2$ distribution with $m$ degrees of freedom and $Z$ has the standard normal distribution. Suppose that a random variable $X$ is defined by the equation

Eq.(8.4.1)

$$
X = \frac{Z}{(\frac{Y}{m})^{1/2}}
$$

Then the distribution of $X$ is called the t distribution with $m$ degrees of freedom

**Theorem 8.4.1**

Probability Density Function

The p.d.f. of the t distribution with m degrees of freedom is

$$
\frac{\Gamma(\frac{m+1}{2})}{(m\pi)^{1/2}\Gamma(\frac{m}{2})}(1+\frac{x^2}{m})^{-(m+1)/2}
$$

**Theorem 8.4.2**

Suppose that $X_1, . . . , X_n$ form a random sample from the normal distribution with mean $μ$ and variance $σ^2$. Let $\overline{X}_n$ denote the sample mean, and define

$$
\sigma' = [\frac{\sum_{i=1}^n(X_i - \overline{X}_n)^2}{n-1}]^{1/2}
$$

Then $n^{1/2}(\overline{X}_n − μ)/σ'$ has the t distribution with n − 1 degrees of freedom.

**Definition 8.5.1**

Confidence Interval

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter (or parameter vector) $θ$. Let $g(θ)$ be a real-valued function of $θ$. Let A ≤ B be two statistics that have the property that for all values of θ,

Eq.(8.5.4)

$$Pr(A < g(θ) < B) ≥ γ$$

Then the random interval (A, B) is called a coefficient γ confidence interval for g(θ) or a 100γ percent confidence interval for g(θ).

**Theorem 8.5.1**

Confidence Interval for the Mean of a Normal Distribution

Let $X_1, . . . , X_n$ be a random sample from the normal distribution with mean μ and variance $σ^2$. For each 0 < γ < 1, the interval (A, B) with the following endpoints is an exact coefficient γ confidence interval for μ:

$$
A = \overline{X}_n − T_{n−1}^{−1} (\frac{1 + γ}{2}) \frac{σ'}{n^{1/2}}
$$

$$
B = \overline{X}_n + T_{n−1}^{−1} (\frac{1 + γ}{2}) \frac{σ'}{n^{1/2}}
$$

**Definition 8.5.2**

One-Sided Confidence Intervals/Limits

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter (or parameter vector) θ. Let g(θ)
be a real-valued function of θ. Let A be a statistic that has the property that for all values of θ,

Eq.(8.5.5)

$$
Pr(A < g(θ)) ≥ γ
$$

Then the random interval (A, ∞) is called a one-sided coefficient γ confidence interval for g(θ) or a one-sided 100γ percent confidence interval for g(θ)

**Theorem 8.5.2**

One-Sided Confidence Intervals for the Mean of a Normal Distribution

Let $X_1, . . . , X_n$ be a random sample from the normal distribution with mean μ and variance $σ^2$. For each 0 < γ < 1, the following statistics are, respectively, exact lower and upper coefficient γ confidence limits for μ:

$$
A = \overline{X}_n − T_{n−1}^{−1}(γ) \frac{σ'}{n^{1/2}}
$$

$$
B = \overline{X}_n + T_{n−1}^{−1}(γ) \frac{σ'}{n^{1/2}}
$$

**Definition 8.5.3**

Pivotal

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter (or vector of parameters) θ. Let $V (\vec{X}, θ)$ be a random variable whose distribution is the same for all θ. Then V is called a pivotal quantity (or simply a pivotal).

**Theorem 8.5.3**

Confidence Interval from a Pivotal

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter (or vector of parameters) θ. Suppose that a pivotal V exists. Let G be the c.d.f. of V , and assume that G is continuous. Assume that a function r exists as in Eq. (8.5.7), and assume that r(v, x) is strictly increasing in v for each x. Let 0 < γ < 1 and let γ2 > γ1 be such that γ2 − γ1 = γ . Then the following statistics are the endpoints of an exact coefficient γ confidence interval for g(θ):

$$A = r (G^{−1}(γ1), \vec{X}$$

$$B = r (G^{−1}(γ2), \vec{X}$$

If r(v, x) is strictly decreasing in v for each x, then switch the definitions of A and B.

**Definition 8.6.1**

Precision of a Normal Distribution. The precision τ of a normal distribution is defined as the reciprocal of the variance; that is, $τ = 1/σ^2$.

**Theorem 8.6.1**

Suppose that $X_1, . . . , X_n$ form a random sample from the normal distribution with unknown mean μ and unknown precision τ (−∞ < μ < ∞ and τ > 0). Suppose also that the joint prior distribution of μ and τ is as follows: The conditional distribution of μ given τ is the normal distribution with mean $μ_0$ and precision $λ_0τ$ ($−∞ < μ_0 < ∞$ and $λ_0 > 0$), and the marginal distribution of τ is the gamma distribution with parameters $α_0$ and $β_0$ ($α_0 > 0$ and $β_0 > 0$). Then the joint posterior distribution of μ and τ, given that $X_i = x_i$ for i = 1, . . . , n, is as follows: The conditional distribution of μ given τ is the normal distribution with mean $μ_1$ and precision $λ_1τ$, where

Eq.(8.6.1)

$$μ_1 = \frac{λ_0μ_0 + n\overline{x}_n}{λ_0 + n}$$

and

$$λ_1 = λ_0 + n$$

and the marginal distribution of τ is the gamma distribution with parameters $α_1$ and $β_1$, where

Eq.(8.6.2)

$$α_1 = α_0 + \frac{n}{2}$$

and

$$β_1 = β_0 + \frac{1}{2}s_n^2 + \frac{nλ_0(\overline{x}_n − μ_0)^2}{2(λ_0 + n)}$$

**Definition 8.6.2**

Normal-Gamma Family of Distributions

Let μ and τ be random variables. Suppose that the conditional distribution of μ given τ is the normal distribution with mean $μ_0$ and precision $λ_0τ$. Suppose also that the marginal distribution of τ is the gamma distribution with parameters $α_0$ and $β_0$. Then we say that the joint distribution of μ and τ is the normal-gamma distribution with hyperparameters $μ_0, λ_0, α_0, β_0$.

**Theorem 8.6.2**

Marginal Distribution of the Mean. Suppose that the prior distribution of μ and τ is the normal-gamma distribution with hyperparameters $μ_0, λ_0, α_0, β_0$. Then the marginal distribution of μ is related to a t distribution in the following way:

$$(\frac{λ_0α_0}{β_0})^{1/2} (μ − μ_0)$$

has the t distribution with $2α_0$ degrees of freedom.

**Theorem 8.6.3**

Suppose that μ and τ have the joint normal-gamma distribution with hyperparameters $μ_0, λ_0, α_0, β_0$. If $α_0 > 1/2$, then $E(μ) = μ_0$. If $α_0 > 1$, then

Eq.(8.6.11)

$$Var(μ) = \frac{β_0}{λ_0(α_0 − 1)}$$

**Definition 8.7.1**

Unbiased Estimator/Bias

An estimator $δ(\vec{X})$ is an unbiased estimator of a function g(θ) of the parameter θ if $E_θ[δ(\vec{X})]= g(θ)$ for every possible value of θ. An estimator that is not unbiased is called a biased estimator. The difference between the expectation of an estimator and g(θ) is called the bias of the estimator. That is, the bias of δ as an estimator of g(θ) is $E_θ[δ(\vec{X})] − g(θ)$, and δ is unbiased if and only if the bias is 0 for all θ.

**Corollary 8.7.1**

Let δ be an estimator with finite variance. Then the M.S.E. of δ as an estimator of g(θ) equals its variance plus the square of its bias.

**Theorem 8.7.1**

Unbiased Estimation of the Variance

Sampling from a General Distribution. Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter (or parameter vector) θ. Assume that the variance of the distribution is finite. Define g(θ) = Varθ(X1). The following statistic is an unbiased estimator of the variance g(θ):

$$
\hat{\sigma_1}^2 = \frac{1}{n - 1} \sum_{i=1}^{n}(X_i - \overline{X}_n)^2
$$

**Definition 8.8.1**

Fisher Information in a Random Variable.

Let X be a random variable whose distribution depends on a parameter θ that takes values in an open interval $\Omega$ of the real line. Let the p.f. or p.d.f. of X be $f (x|θ)$. Assume that the set of x such that $f (x|θ) > 0$ is the same for all θ and that $λ(x|θ) = log f (x|θ)$ is twice differentiable as a function of θ. The Fisher information I(θ) in the random variable X is defined as

Eq(8.8.1)

$$I (θ) = E_θ\{[λ'(X|θ)]^2\}.$$

Thus, if f (x|θ) is a p.d.f., then

Eq(8.8.2)

$$I (θ) = \int_S[λ'(x|θ)]^2f (x|θ) dx.$$

**Theorem 8.8.1**

Assume the conditions of Definition 8.8.1. Also, assume that two derivatives of $\int_Sf (x|θ)dx$ with respect to θ can be calculated by reversing the order of integration and differentiation. Then the Fisher information also equals

Eq(8.8.3)

$$I (θ) = −E_θ[λ''(X|θ)].$$

Another expression for the Fisher information is

Eq(8.8.4)

$$I (θ) = Var_θ[λ'(X|θ)].$$

**Definition 8.8.2**

Fisher Information in a Random Sample. Suppose that $\vec{X} = (X_1, . . . , X_n)$ form a random sample from a distribution for which the p.f. or p.d.f. is $f (x|θ)$, where the value of the parameter θ must lie in an open interval $\Omega$ of the real line. Let $f_n(\vec{x}|θ)$ denote the joint p.f. or joint p.d.f. of X. Define

Eq(8.8.9)

$$λ_n(\vec{x}|θ) = log f_n(\vec{x}|θ)$$

Assume that the set of $\vec{x}$ such that $f_n(\vec{x}|θ) > 0$ is the same for all θ and that log $f_n(\vec{x}|θ)$ is twice differentiable with respect to θ. The Fisher information $I_n(θ)$ in the random sample X is defined as

$$I_n(θ) = E_θ\{[λ_n'(\vec{X}|θ)]^2\}$$

For continuous distributions, the Fisher information $I_n(θ)$ in the entire sample is given by the following n-dimensional integral:

$$I_n(θ) = \int_S . . . \int_S[λ_n'(\vec{x}|θ)]^2 f_n(\vec{x}|θ) dx_1 . . . dx_n$$

For discrete distributions, replace the n-dimensional integral by an n-fold summation

Furthermore, if we again assume that derivatives can be passed under the integrals, then we may express $I_n(θ)$ in either of the following two ways:

Eq(8.8.10)

$$I_n(θ) = Var_θ[λ_n'(\vec{X}|θ)]$$

or

Eq(8.8.11)

$$I_n(θ) = −E_θ[λ_n''(\vec{X}|θ)]$$

**Theorem 8.8.2**

Under the conditions of Definitions 8.8.1 and 8.8.2,

Eq(8.8.12)

$$I_n(θ) = nI (θ)$$

**Theorem 8.8.3**

Cram´er-Rao (Information) Inequality.

Suppose that $X = (X_1, . . . , X_n)$ form a random sample from a distribution for which the p.d.f. is $f (x|θ)$. Suppose also that all the assumptions which have been made about $f (x|θ)$ thus far in this section continue to hold. Let $T = r(\vec{X})$ be a statistic with finite variance. Let $m(θ) = E_θ(T )$. Assume that m(θ) is a differentiable function of θ. Then

Eq. (8.8.14)

$$Var_θ(T ) ≥ \frac{[m'(θ)]^2}{nI (θ)}$$


There will be equality in (8.8.14) if and only if there exist functions u(θ) and v(θ) that may depend on θ but do not depend on X and that satisfy the relation

Eq. (8.8.15)

$$T = u(θ)λ_n'(\vec{X}|θ) + v(θ)$$

**Corollary 8.8.1**

Cram´er-Rao Lower Bound on the Variance of an Unbiased Estimator.

Assume the assumptions of Theorem 8.8.3. Let T be an unbiased estimator of θ. Then

$$Var_θ(T ) ≥ \frac{1}{nI (θ)}$$

**Definition 8.8.3**

Efficient Estimator.

It is said that an estimator T is an efficient estimator of its expectation m(θ) if there is equality in (8.8.14) for every value of $θ ∈ \Omega$.

**Theorem 8.8.4**

Asymptotic Distribution of an Efficient Estimator

Assume the assumptions of Theorem 8.8.3. Let T be an efficient estimator of its mean m(θ). Assume that $m'(θ)$ is never 0. Then the asymptotic distribution of

$$
\frac{\sqrt{nI(\theta)}}{m'(\theta)}[T-m(\theta)]
$$

is the standard normal distribution.

**Theorem 8.8.5**

Asymptotic Distribution of M.L.E

Suppose that in an arbitrary problem the M.L.E. $\hat{θ}_n$ is determined by solving the equation $λ'_n(\vec{x}|θ) = 0$, and in addition both the second and third derivatives $λ''_n(\vec{x}|θ)$ and $λ'''_n(\vec{x}|θ)$ exist and satisfy certain regularity conditions. Then the asymptotic distribution of $[nI (θ)]^{1/2}(\hat{θ}_n − θ)$ is the standard normal distribution.

**Theorem 8.8.6**

Efficient Estimation

Assume the same smoothness conditions on the likelihood function as in Theorem 8.8.5. Assume that $\tilde{θ}_n$ is a sequence of estimators of θ such that $\sqrt{n}(\tilde{θ}_n − θ)$ converges in distribution to some distribution (it doesn’t matter what distribution). Use $\tilde{θ}_n$ as the starting value, and perform one step of Newton’s method (Definition 7.6.2) toward finding the M.L.E. of θ. Let the result of this one step be called $θ^∗_n$. Then the asymptotic distribution of $[nI (θ)]^{1/2}(θ_n^∗ − θ)$ is the standard normal distribution.

**Definition 8.8.4**

Fisher Information for a Vector Parameter. Suppose that $\vec{X} = (X_1, . . . , X_n)$ form a random sample from a distribution for which the p.d.f. is f(x|θ), where the value of the parameter $\vec{θ} = (θ_1, . . . , θ_k)$ must lie in an open subset $\Omega$ of a k-dimensional real space. Let $f_n(x|θ)$ denote the joint p.d.f. or joint p.f. of $\vec{X}$. Define

$$λ_n(\vec{x}|θ) = log f_n(\vec{x}|θ)$$

Assume that the set of $\vec{x}$ such that $f_n(x|θ) > 0$ is the same for all θ and that log $f_n(\vec{x}|θ)$ is twice differentiable with respect to θ. The Fisher information matrix $I_n(θ)$ in the random sample $\vec{X}$ is defined as the k × k matrix with (i, j) element equal to

$$
I_{n,i,j}(θ) = Cov_θ [\frac{∂}{∂θ_i} λ'_n(\vec{X}|θ), \frac{∂}{∂θ_j} λ_n'(\vec{X}|θ)]
$$

**Definition 9.1.1**

Null and Alternative Hypotheses/Reject

The hypothesis $H_0$ is called the null hypothesis and the hypothesis $H_1$ is called the alternative hypothesis. When performing a test, if we decide that θ lies in $\Omega_1$, we are said to reject $H_0$. If we decide that θ lies in $\Omega_0$, we are said not to reject $H_0$.

**Definition 9.1.2**

Simple and Composite Hypotheses

If $\Omega_i$ contains just a single value of θ, then $H_i$ is a simple hypothesis. If the set $\Omega_i$ contains more than one value of θ, then $H_i$ is a composite hypothesis.

**Definition 9.1.3**

One-Sided and Two-Sided Hypotheses

Let θ be a one-dimensional parameter. One-sided null hypotheses are of the form $H_0 : θ ≤ θ_0$ or $H_0 : θ ≥ θ_0$, with the corresponding one-sided alternative hypotheses being $H_1 : θ > θ_0$ or $H_1 : θ < θ_0$. When the null hypothesis is simple, such as (9.1.1), the alternative hypothesis is usually two-sided, $H_1 : θ = θ_0$.

**Definition 9.1.4**

Critical Region

The set $S_1$ defined above is called the critical region of the test

**Definition 9.1.5**

Test Statistic/Rejection Region

Let $\vec{X}$ be a random sample from a distribution that depends on a parameter θ. Let $T = r(\vec{X})$ be a statistic, and let R be a subset of the real line. Suppose that a test procedure for the hypotheses (9.1.3) is of the form “reject $H_0$ if T ∈ R.” Then we call T a test statistic, and we call R the rejection region of the test.

**Definition 9.1.6**

Power Function

Let δ be a test procedure. The function π(θ|δ) is called the power function of the test δ. If $S_1$ denotes the critical region of δ, then the power function π(θ|δ) is determined by the relation

Eq.(9.1.4)
$$π(θ|δ) = Pr(X ∈ S_1|θ) for θ ∈ \Omega$$

If δ is described in terms of a test statistic T and rejection region R, the power function is

Eq(9.1.5)
$$π(θ|δ) = Pr(T ∈ R|θ) for θ ∈ \Omega$$

**Definition 9.1.7**

Type I/II Error

An erroneous decision to reject a true null hypothesis is a type I error, or an error of the first kind. An erroneous decision not to reject a false null hypothesis is called a type II error, or an error of the second kind.

**Definition 9.1.8**

Level/Size

A test that satisfies $\pi(\theta|\delta) \le \alpha_0$ for $\theta \in \Omega_0$ is called a level $α_0$ test, and we say that the test
has level of significance α0. In addition, the size α(δ) of a test δ is defined as follows:

Eq.(9.1.7)
$$α(δ) = sup_{θ∈\Omega_0}π(θ|δ)$$

**Corollary 9.1.1.**

A test δ is a level $α_0$ test if and only if its size is at most $α_0$ (i.e., $α(δ) ≤ α_0$). If the null hypothesis is simple, that is, $H_0 : θ = θ_0$, then the size of δ will be $α(δ) = π(θ_0|δ)$.

**Definition 9.1.9**

p-value

In general, the p-value is the smallest level $α_0$ such that we would reject the null-hypothesis at level $α_0$ with the observed data

**Theorem 9.1.1**

Defining Confidence Sets from Tests

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter θ. Let g(θ) be a function, and suppose that for each possible value $g_0$ of g(θ), there is a level $α_0$ test $δ_{g_0}$ of the hypotheses

Eq.(9.1.13)
$$H_{0,g_0} : g(θ) = g_0, H_{1,g_0} : g(θ) \ne g_0$$

For each possible value $\vec{x}$ of $\vec{X}$, define

Eq.(9.1.14)
$$ω(x) = \{g_0 : δ_{g_0} \ does \ not \ reject \ H_{0,g_0} \ if \ \vec{X} = \vec{x} \ is \ observed\}$$

Let $γ = 1 − α_0$. Then, the random set $ω(\vec{X})$ satisfies

Eq.(9.1.15)
$$Pr[g(θ_0) ∈ ω(\vec{X})|θ = θ_0] ≥ γ$$

for all $θ_0 ∈ \Omega$.

**Definition 9.1.10**

Confidence Set

If a random set $ω(\vec{X})$ satisfies (9.1.15) for every $θ_0 ∈ \Omega$, we call it a coefficient γ confidence set for g(θ). If the inequality in (9.1.15) is equality for all $θ_0$, then we call the confidence set exact.

**Theorem 9.1.2**

Defining Tests from Confidence Sets

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter θ. Let g(θ) be a function of θ, and let $ω(\vec{X})$ be a coefficient γ confidence set for g(θ). For each possible value $g_0$ of g(θ), construct the following test $δ_{g_0}$ of the hypotheses in Eq. (9.1.13): $δ_{g_0}$ does not reject $H_{0,g_0}$ if and only if $g_0 ∈ ω(\vec{X})$. Then $δ_{g_0}$ is a level $α_0 = 1 − γ$ test of the hypotheses in Eq. (9.1.13).

**Theorem 9.1.3**

One-Sided Confidence Intervals from One-Sided Tests

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from a distribution that depends on a parameter θ. Let g(θ) be a real-valued function, and suppose that for each possible value $g_0$ of g(θ), there is a level $α_0$ test $δ_{g_0}$ of the hypotheses (9.1.19). For each possible value $\vec{x}$ of $\vec{X}$, define $ω(\vec{x})$ by Eq. (9.1.14). Let $γ = 1 − α_0$. Then the random set ω(X) satisfies Eq. (9.1.15) for all $θ_0 ∈ \Omega$.

**Definition 9.1.11**

Likelihood Ratio Test

The statistic

Eq.(9.1.24)
$$\Lambda(x) = \frac{sup_{θ∈\Omega_0} f_n(\vec{x}|θ)}{sup_{θ∈\Omega} f_n(\vec{x}|θ)}$$

is called the likelihood ratio statistic. A likelihood ratio test of hypotheses (9.1.23) is to reject $H_0$ if $\Lambda(\vec{x}) ≤ k$ for some constant k.

**Theorem 9.1.4**

Large-Sample Likelihood Ratio Tests

Let $\Omega$ be an open subset of p-dimensional space, and suppose that $H_0$ specifies that k coordinates of θ are equal to k specific values. Assume that $H_0$ is true and that the likelihood function satisfies the conditions needed to prove that the M.L.E. is asymptotically normal and asymptotically efficient. (See page 523.) Then, as n → ∞, $−2 log \Lambda(\vec{X})$ converges in distribution to the $χ^2$ distribution with k degrees of freedom.

**Theorem 9.1.5**

For i = 1, . . . , n, let $H_{0,i}$ be a null hypothesis, and let $δ_i$ be a level $α_0$,i test of $H_{0,i}$. Define the combined null hypothesis $H_0$ that all of $H_{0,1}, . . . , H_{0,n}$ are simultaneously true. Let δ be the test that rejects $H_0$ if at least one of $δ_1, . . . , δ_n$ rejects its corresponding null hypothesis. Then δ is a level $\sum_{i=1}^{n} α_{0,i}$ test of $H_0$.

**Theorem 9.2.1**

Let $δ^∗$ denote a test procedure such that the hypothesis $H_0$ is not rejected if $af_0(\vec{x}) > bf_1(\vec{x})$ and the hypothesis $H_0$ is rejected if $af_0(\vec{x}) < bf_1(\vec{x})$. The null hypothesis $H_0$ can be either rejected or not if $af_0(\vec{x}) = bf_1(\vec{x})$. Then for every other test procedure δ,

Eq.(9.2.4)
$$aα(δ^∗) + bβ(δ^∗) ≤ aα(δ) + bβ(δ)$$

**Corollary 9.2.1**

Assume the conditions of Theorem 9.2.1, and assume that a > 0 and b > 0. Then the test δ for which the value of $aα(δ) + bβ(δ)$ is a minimum rejects $H_0$ when the likelihood ratio exceeds a/b and does not reject $H_0$ when the likelihood ratio is less than a/b.

**Theorem 9.2.2**

Nayman-Pearson lemma

Suppose that $δ'$ is a test procedure that has the following form for some constant k > 0: The hypothesis $H_0$ is not rejected if $f_1(\vec{x}) < kf_0(\vec{x})$ and the hypothesis $H_0$ is rejected if $f_1(\vec{x}) > kf_0(\vec{x})$. The null hypothesis $H_0$ can be either rejected or not if $f_1(\vec{x}) = kf_0(\vec{x})$. If δ is another test procedure such that $α(δ) ≤ α(δ')$, then it follows that $β(δ) ≥ β(δ')$. Furthermore, if $α(δ) < α(δ')$, then $β(δ) > β(δ')$

**Definition 9.3.1**

Uniformly Most Powerful(UMP) Test

A test procedure $δ^∗$ is a uniformly most powerful (UMP) test of the hypotheses (9.3.1) at the level of significance $α_0$ if $α(δ^∗) ≤ α_0$ and, for every other test procedure δ such that $α(δ) ≤ α_0$, it is true that

Eq.(9.3.4)

$π(θ|δ) ≤ π(θ|δ^∗)$ for every value of $θ ∈ \Omega_1$.

**Definition 9.3.2**

Monotone Likelihood Ratio

Let $f_n(\vec{x}|θ)$ denote the joint p.d.f. or the joint p.f. of the observations $\vec{X} = (X_1, . . . , X_n)$. Let $T = r(\vec{X})$ be a statistic. It is said that the joint distribution of $\vec{X}$ has a monotone likelihood ratio (MLR) in the statistic T if the following property is satisfied: For every two values $θ_1 ∈ \Omega$ and $θ_2 ∈ \Omega$, with $θ_1 < θ_2$, the ratio $f_n(\vec{x}|θ_2)/f_n(\vec{x}|θ_1)$ depends on the vector $\vec{x}$ only through the function $r(\vec{x})$, and this ratio is a monotone function of $r(\vec{x})$ over the range of possible values of $r(\vec{x})$. Specifically, if the ratio is increasing, we say that the distribution of $\vec{X}$ has increasing MLR, and if the ratio is decreasing, we say that the distribution has decreasing MLR.

**Theorem 9.3.1**

Suppose that the joint distribution of X has increasing monotone likelihood ratio in
the statistic $T = r(\vec{X})$. Let c and $α_0$ be constants such that

Eq.(9.3.9)

$$Pr(T ≥ c|θ = θ_0) = α_0$$

**Definition 9.4.1**

Unbiased Test

A test procedure δ is said to be unbiased if, for every $θ ∈ \Omega_0$ and $θ ∈ \Omega_1$,

Eq.(9.4.11)
$$π(θ|δ) ≤ π(θ'|δ)$$

**Theorem 9.5.1**

Level and Unbiasedness of t Tests

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from the normal distribution with mean μ and variance $σ^2$, let U be the statistic in Eq. (9.5.2), and let c be the $1 − α_0$ quantile of the t distribution with n − 1 degrees of freedom. Let δ be the test that rejects $H_0: \mu \le \mu_0$ if U ≥ c. The power function $π(μ, σ^2|δ)$ has the following properties:

- i.    $π(μ, σ^2|δ) = α_0$ when $μ = μ_0$,
- ii.   $π(μ, σ^2|δ) < α_0$ when $μ < μ_0$,
- iii.  $π(μ, σ^2|δ) > α_0$ when $μ > μ_0$,
- iv.   $π(μ, σ^2|δ) → 0$ as μ → −∞,
- v.    $π(μ, σ^2|δ) → 1$ as μ → ∞.

Furthermore, the test δ has size $α_0$ and is unbiased

**Corollary 9.5.1**

t Tests for Hypotheses of Eq. (9.5.3)

Let $\vec{X} = (X_1, . . . , X_n)$ be a random sample from the normal distribution with mean μ and variance $σ^2$, let U be the statistic in Eq. (9.5.2), and let c be the α0 quantile of the t distribution with n − 1 degrees of freedom. Let δ be the test that rejects $H_0: \mu \ge \mu_0$  if U ≤ c. The power function $π(μ, σ^2|δ)$ has the following properties:

- i.    $π(μ, σ^2|δ) = α_0$ when $μ = μ_0$,
- ii.   $π(μ, σ^2|δ) > α_0$ when $μ < μ_0$,
- iii.  $π(μ, σ^2|δ) < α_0$ when $μ > μ_0$,
- iv.   $π(μ, σ^2|δ) → 1$ as μ → −∞,
- v.    $π(μ, σ^2|δ) → 0$ as μ → ∞.

Furthermore, the test δ has size $α_0$ and is unbiased.

**Theorem 9.5.2**

p-Values for t Tests

Suppose that we are testing either the hypotheses in Eq. (9.5.1) or the hypotheses in Eq. (9.5.3). Let u be the observed value of the statistic U in Eq. (9.5.2), and let $T_{n−1}(.)$ be the c.d.f. of the t distribution with n − 1 degrees of freedom. Then the p-value for the hypotheses in Eq. (9.5.1) is $1 − T_{n−1}(u)$ and the p-value for the hypotheses in Eq. (9.5.3) is $T_{n−1}(u)$.

**Definition 9.5.1**

Noncentral t Distributions

Let Y and W be independent random variables with W having the normal distribution with mean ψ and variance 1 and Y having the $χ^2$ distribution with m degrees of freedom. Then the distribution of

$$
X = \frac{W}{(\frac{Y}{m})^{1/2}}
$$

is called the noncentral t distribution with m degrees of freedom and noncentrality parameter ψ. We shall let $T_m(t|ψ)$ denote the c.d.f. of this distribution. That is, $T_m(t|ψ) = Pr(X ≤ t)$

**Theorem 9.5.3**

Let $X_1, . . . , X_n$ be a random sample from the normal distribution with mean μ and variance $σ^2$. The distribution of the statistic U in Eq. (9.5.2) is the noncentral t distribution with n − 1 degrees of freedom and noncentrality parameter $ψ = n^{1/2}(μ − μ_0)/σ$. Let δ be the test that rejects $H_0 : μ ≤ μ_0$ when U ≥ c. Then the power function of δ is $π(μ, σ^2|δ) = 1 − T_{n−1}(c|ψ)$. Let $δ'$ be the test that rejects $H_0 : μ ≥ μ_0$ when U ≤ c. Then the power function of $δ'$ is $π(μ, σ^2|δ') = T_{n−1}(c|ψ)$.

**Theorem 9.5.4**

p-Values for Two-Sided t Tests

Suppose that we are testing the hypotheses in Eq. (9.5.7). Let u be the observed value of the statistic U, and let $T_{n−1}(.)$ be the c.d.f. of the t distribution with n − 1 degrees of freedom. Then the p-value is $2[1 − T_{n−1}(|u|)]$.

**Theorem 9.6.1**

Two-Sample t Statistic. Assume the structure described in the preceding paragraphs. Define

Eq.(9.6.2)

$$
\overline{X}_m = \frac{1}{m} \sum_{i=1}^m X_i
$$
$$
\overline{Y}_n = \frac{1}{n} \sum_{i=1}^n Y_i
$$
$$
S^2_X = \sum_{i=1}^m (X_i − \overline{X}_m)^2
$$
$$
S_Y^2 = \sum_{i=1}^n (Y_i − \overline{Y}_n)^2
$$

Define the test statistic

Eq.(9.6.3)

$$
U = \frac{(m + n − 2)^{1/2}(\overline{X}_m − \overline{Y}_n)}{(\frac{1}{m} + \frac{1}{n})^{1/2} (S_X^2 + S_Y^2)^{1/2}}.
$$

For all values of $θ = (μ_1, μ_2, σ^2)$ such that $μ_1 = μ_2$, the distribution of U is the t distribution with m + n − 2 degrees of freedom.


**Theorem 9.6.2**

Level and Unbiasedness of Two-Sample t Tests

Let δ be the two-sample t test defined above. The power function $π(μ_1, μ_2, σ^2|δ)$ has the following properties:

- i.   $π(μ_1, μ_2, σ^2|δ) = α_0$ when $μ_1 = μ_2$,
- ii.  $π(μ_1, μ_2, σ^2|δ) < α_0$ when $μ_1 < μ_2$,
- iii. $π(μ_1, μ_2, σ^2|δ) > α_0$ when $μ_1 > μ_2$,
- iv.  $π(μ_1, μ_2, σ^2|δ) → 0$ as $μ_1 − μ_2 → −∞$,
- v.   $π(μ_1, μ_2, σ^2|δ) → 1$ as $μ_1 − μ_2 → ∞$

**Theorem 9.6.3**

p-Values for Two-Sample t Tests

Suppose that we are testing either the hypotheses in Eq. (9.6.1) or the hypotheses in Eq. (9.6.7). Let u be the observed value of the statistic U in Eq. (9.6.3), and let $T_{m+n−2}(.)$ be the c.d.f. of the t distribution with m + n − 2 degrees of freedom. Then the p-value for the hypotheses in Eq. (9.6.1) is $1 − T_{m+n−2}(u)$ and the p-value for the hypotheses in Eq. (9.6.7) is $T_{m+n−2}(u)$.

**Theorem 9.6.4**

Power of Two-Sample t Test. Assume the conditions stated earlier in this section. Let U be defined in Eq. (9.6.6). Then U has the noncentral t distribution with m + n − 2 degrees of freedom and noncentrality parameter

Eq.(9.6.8)

$$
ψ = \frac{μ_1 − μ_2}{σ(\frac{1}{m} + \frac{1}{n})^{1/2}}
$$

**Definition 9.7.1**

The F distributions

Let Y and W be independent random variables such that Y has the $χ^2$ distribution with m degrees of freedom and W has the $χ^2$ distribution with n degrees of freedom, where m and n are given positive integers. Define a new random variable X as follows:

Eq.(9.7.1)

$$
X = \frac{Y/m}{W/n}= \frac{nY}{mW}
$$

Then the distribution of X is called the F distribution with m and n degrees of freedom.

**Theorem 9.7.1**

Probability Density Function. Let X have the F distribution with m and n degrees of freedom. Then its p.d.f. f(x) is as follows, for x > 0:

Eq.(9.7.2)

$$
f (x) = \frac{\Gamma[\frac{1}{2}(m + n)]m^{m/2}n^{n/2}}{\Gamma(\frac{1}{2}m)\Gamma(\frac{1}{2}n)}.\frac{x^{(m/2)−1}}{(mx + n)^{(m+n)/2}}
$$

and f(x) = 0 for x ≤ 0

**Theorem 9.7.2**

If X has the F distribution with m and n degrees of freedom, then its reciprocal 1/X has the F distribution with n and m degrees of freedom. If Y has the t distribution with n degrees of freedom, then $Y^2$ has the F distribution with 1 and n degrees of freedom.

**Definition 9.7.2**

Eq.(9.7.4)

$$
V = \frac{S^2_X/(m − 1)}{S^2_Y/(n − 1)}
$$

$\delta$: if $V \ge c$ reject $H_0: \sigma_1^2 \le \sigma_2^2$ Eq.(9.7.3)

F test

The test procedure defined above is called an F test.

**Theorem 9.7.3**

Distribution of V

Let V be the statistic in Eq.(9.7.4). The distribution of ($σ_2^2/σ_1^2)V$ is the F distribution with m − 1 and n − 1 degrees of freedom. In particular, if $σ_1^2 = σ_2^2$, then the distribution of V itself is the F distribution with m − 1 and n − 1 degrees of freedom.

**Theorem 9.7.4**

Level, Power Function, and P-Values

Let V be the statistic defined in Eq. (9.7.4). Let c be the $1 − α_0$ quantile of the F distribution with m − 1 and n − 1 degrees of freedom, and let $G_{m−1,n−1}$ be the c.d.f. of that F distribution. Let δ be test that rejects $H_0$ in (9.7.3) when V ≥ c. The power function $π(μ_1, μ_2, σ_1^2, σ_2^2|δ)$ satisfies the following properties:

- i.    $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) = 1 − G_{m−1,n−1} (\frac{σ_2^2}{σ_1^2}c)$,
- ii.   $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) = α_0$ when σ12 = σ22,
- iii.  $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) < α_0$ when σ12 < σ22,
- iv.   $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) > α_0$ when σ12 > σ22,
- v.    $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) → 0$ as $σ_1^2/σ_2^2 → 0$,
- vi.   $π(μ_1, μ_2, σ_1^2, σ_2^2|δ) → 1$ as $σ_1^2/σ_2^2 → ∞$

The test δ has level $α_0$ and is unbiased. The p-value when V = v is observed equals $1 − G_{m−1,n−1}(v)$.

**Theorem 9.7.5**

P-Value of Equal-Tailed Two-Sided F Test

Let V be as defined in (9.7.4). Suppose that we wish to test the hypotheses (9.7.7). Let $δ_{α_0}$ be the equal-tailed two-sided F test that rejects $H_0$ when $V ≤ c_1$ or $V ≥ c_2$, where $c_1$ and $c_2$ are, respectively, the $α_0/2$ and $1 − α_0/2$ quantiles of the appropriate F distribution. Then the smallest $α_0$ such that $δ_{α_0}$ rejects $H_0$ when V = v is observed is

Eq.(9.7.8)

$2 \min\{1 − G_{m−1, n−1}(v), G_{m−1, n−1}(v)\}$

**Theorem 9.8.1**

Suppose that $f_n(\vec{x}|θ)$ has a monotone likelihood ratio in the statistic $T = r(\vec{X})$. Let the hypotheses be as in Eq. (9.8.8), and assume that the loss function is of the form

||$d_0$|$d_1$|
|--|--|--|
|$\theta \le \theta_0$|0|$w_0$|
|$\theta \gt \theta_0$|$w_1$|0|

where $w_0, w_1 > 0$ are constants. Then a test procedure that minimizes the posterior expected loss is to reject $H_0$ when T ≥ c for some constant c (possibly infinite).

**Theorem 9.8.2**

Suppose that $X_1, . . . , X_m$ form a random sample from a normal distribution with mean $μ_1$ and precision τ while $Y_1, . . . , Y_n$ form a random sample from a normal distribution with mean $μ_2$ and precision τ. Suppose that the parameters have the improper prior with “p.d.f.” $ξ(μ_1, μ_2, τ) = 1/τ$ for τ > 0. The posterior distribution of

Eq.(9.8.17)

$$
(m + n − 2)^{1/2} \frac{μ_1 − μ_2 − (\overline{x}_m − \overline{y}_n)}{(\frac{1}{m} + \frac{1}{n})^{1/2}(s_x^2 + s_y^2)^{1/2}}
$$

is the t distribution with m + n − 2 degrees of freedom, where $s_x^2$ and $s_y^2$ are the observed values of $S^2_X$ and $S_Y^2$, respectively


**Theorem 10.1.1**

$\chi^2$ Statistic

The following statistic

Eq.(10.1.2)

$$
Q = \sum_{i=1}^k \frac{(N_i − np_i^0)^2}{np_i^0}
$$

has the property that if $H_0$ is true and the sample size n → ∞, then Q converges in distribution to the $χ^2$ distribution with k − 1 degrees of freedom.

**Theorem 10.2.1**

χ2 Test for Composite Null

(10.2.3)

$$
H_0: There exists a value of θ ∈ \Omega such that \\

p_i = π_i(θ) \ for \ i = 1, . . . , k, \\

H_1: The \ hypothesis \ H_0 \ is \ not \ true
$$

(10.2.4)

$$
Q = \sum_{i=1}^k \frac{[N_i − nπ_i(\hat{θ})]^2}{nπ_i(\hat{θ})}
$$

Suppose that the null hypothesis $H_0$ in (10.2.3) is true and certain regularity conditions are satisfied. Then as the sample size n → ∞, the c.d.f. of Q in (10.2.4) converges to the c.d.f. of the $χ^2$ distribution with k − 1 − s degrees of freedom.

**Theorem 10.2.2**

Let $X_1, . . . , X_n$ be a random sample from a distribution with a p-dimensional parameter θ. Let $\hat{θ}_n$ denote the M.L.E. as defined in Definition 7.5.2. Partition the real line into k > p + 1 disjoint intervals $I_1, . . . , I_k$. Let $N_i$ be the number of observations that fall into Ii for i = 1, . . . , k. Let $π_i(θ) = Pr(X_i ∈ I_i|θ)$. Let

(10.2.11)

$$
Q' = \sum_{i=1}^k \frac{[N_i − nπ_i(\hat{θ}_n)]^2}{nπ_i(\hat{θ}_n)}
$$

Assume the regularity conditions needed for asymptotic normality of the M.L.E. Then, as n → ∞, the c.d.f. of $Q'$ converges to a c.d.f. that lies between the c.d.f. of the $χ^2$ distribution with k − p − 1 degrees of freedom and the c.d.f. of the $χ^2$ distribution with k − 1 degrees of freedom.

**Definition 10.3.1**

Contingency Tables

A table in which each observation is classified in two or more ways is called a contingency table.

**Definition 10.6.1**

Sample (Empirical) Distribution Function

Let $x_1, . . . , x_n$ be the observed values of a random sample $X_1, . . . , X_n$. For each number x (−∞ < x < ∞), define the value $F_n(x)$ as the proportion of observed values in the sample that are less than or equal to x. In other words, if exactly k of the observed values in the sample are less than or equal to x, then $F_n(x) = k/n$. The function $F_n(x)$ defined in this way is called the sample distribution function, or simply the sample c.d.f.Sometimes $F_n(x)$ is called the empirical c.d.f

**Theorem 10.6.1**

Glivenko-Cantelli Lemma

Let $F_n$ be the sample c.d.f. from an i.i.d. sample $X_1, . . . , X_n$ from the c.d.f. F. Define

Eq.(10.6.2)

$$
D_n = sup_{−∞<x<∞}|F_n(x) − F(x)|
$$

Then $D_n \xrightarrow{p} 0$

**Theorem 10.6.2**

If the null hypothesis $H_0$ is true, then for each given value t > 0,

Eq.(10.6.5)

$$
\lim_{n→∞}Pr(n^{1/2}D^∗_n ≤ t) = 1 − 2\sum_{i=1}^∞(−1)^{i−1}e^{−2i^2t^2}
$$

**Definition 10.6.2**

Kolmogorov-Smirnov test

A test procedure that rejects $H_0$ when $n^{1/2}D_n^∗ ≥ c$ is called a Kolmogorov-Smirnov test.

**Theorem 10.6.3**

Two-Sample Kolmogorov-Smirnov Statistic

For each value of t > 0, let H(t) denote the right side of Eq. (10.6.5). If the null hypothesis $H_0$ in (10.6.6) is true, then

Eq.(10.6.9)

$$
\lim_{m→∞, n→∞}Pr[(\frac{mn}{m + n})^{1/2} D_{mn} ≤ t] = H(t)
$$

**Definition 10.6.3**

Two-Sample Kolmogorov-Smirnov Test

A test procedure that rejects $H_0$ when

Eq.(10.6.10)

$$
(\frac{mn}{m + n})^{1/2} D_{mn} ≥ c
$$

where c is an appropriate constant, is called a *Kolmogorov-Smirnov two-sample test*

**Definition 10.7.1**

Contaminated Normal Distributions

Eq.(10.7.1)

$$
f (x) = (1 − \epsilon)(2πσ^2)^{−1/2} exp(−\frac{1}{2σ^2} [x − μ]^2) + \epsilon g(x).
$$

A distribution whose p.d.f. has the form of Eq. (10.7.1) is called a *contaminated normal*, and the distribution with p.d.f. g is called the *contaminating distribution*.

**Definition 10.7.2**

Trimmed Means

For each positive integer k such that k < n/2, ignore the k smallest observations $Y_1, . . . , Y_k$ and the k largest observations $Y_n, Y_{n−1}, . . . , Y_{n−k+1}$ in the sample. The average of the remaining n − 2k intermediate observations is called the kth *level trimmed mean*.

**Definition 10.7.3**

Scale Parameters

An arbitrary parameter σ is a *scale parameter* for the distribution of X if, for all a > 0 and all real b, the corresponding parameter for the distribution of aX + b is aσ.

**Definition 10.7.4**

Median Absolute Deviation

The *median absolute deviation* of a random variable X is the median of the distribution of |X − m|, where m is the median of X.

**Definition 10.7.5**

Laplace Distributions

Let σ > 0 and θ be real numbers. The distribution whose p.d.f. is

Eq.(10.7.5)

$$
f (x|θ, σ ) = \frac{1}{2σ}e^{−|x−θ|/σ}
$$

is called the *Laplace distribution with parameters θ and σ*.

**Definition 10.7.6**

M-Estimators

Eq.(10.7.6)

$$g_k(x|θ, σ ) = c_ke^{h_k([x−θ]/σ )}$$

$$h_k(y) = \begin{cases}
-0.5y^2         & \text{if -k ＜ y ＜ k} \\
0.5k^2 - k|y|  & \text{otherwise}
\end{cases}$$

The M.L.E. of θ under the assumption that the data have p.d.f. gk in Eq. (10.7.6) is called an *M-estimator*.

**Theorem 10.7.1**

Asymptotic Distribution of Sample Quantile

Under the conditions above, let $\tilde{θ}_{p,n}$ denote the sample p quantile. Then, as n → ∞, the c.d.f. of $n^{1/2}(\tilde{θ}_{p,n} − θ_p)$ will converge to the c.d.f. of the normal distribution with mean 0 and variance $p(1−p)/f^2(θ_p)$

