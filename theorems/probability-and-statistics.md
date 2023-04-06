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

Quantiles/Percentiles. Let X be a random variable with c.d.f. F. For each p strictly
between 0 and 1, define F −1(p) to be the smallest value x such that F (x) ≥ p. Then
F −1(p) is called the p quantile of X or the 100p percentile of X. The function F −1
defined here on the open interval (0, 1) is called the quantile function of X.

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

Then g1 is called the conditional p.f. of X given Y. The discrete distribution whose p.f. is g1(.|y) is called the conditional distribution of X given that Y = y.

**Definition 3.6.2**

Conditional p.d.f. Let X and Y have a continuous joint distribution with joint p.d.f. f and respective marginals f1 and f2. Let y be a value such that f2(y) > 0. Then the conditional p.d.f. g1 of X given that Y = y is defined as follows:

(Eq 3.6.4)

$$
g_1(x | y) = \frac{f(x, y)}{f_2(y)}
$$

for −∞ < x < ∞.

For values of y such that f2(y) = 0, we are free to define g1(x|y) however we wish, so long as g1(x|y) is a p.d.f. as a function of x.

**Theorem 3.6.1**

For each y, g1(x|y) defined in Definition 3.6.2 is a p.d.f. as a function of x.

**Definition 3.6.3**

Conditional p.f. or p.d.f. from Mixed Distribution. Let X be discrete and let Y be continuous with joint p.f./p.d.f. f . Then the conditional p.f. of X given Y = y is defined by Eq. (3.6.2), and the conditional p.d.f. of Y given X = x is defined by Eq. (3.6.3)

**Theorem 3.6.2**

Multiplication Rule for Distributions. Let X and Y be random variables such that X has p.f. or p.d.f. f1(x) and Y has p.f. or p.d.f. f2(y). Also, assume that the conditional p.f. or p.d.f. of X given Y = y is g1(x|y) while the conditional p.f. or p.d.f. of Y given X = x is g2(y|x). Then for each y such that f2(y) > 0 and each x,

(Eq 3.6.7)

$$
f(x, y) = g_1(x|y)f_2(y)
$$

where f is the joint p.f., p.d.f., or p.f./p.d.f. of X and Y. Similarly, for each x such that f1(x) > 0 and each y,

(Eq 3.6.8)

$$
f(x, y) = f_1(x)g_2(y|x)
$$

