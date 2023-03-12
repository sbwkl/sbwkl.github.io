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

$$
B_i \text{ partition of the space S} \\
P(A) = \sum_{j=1}^{k}P(B_j)P(A | B_j)
$$