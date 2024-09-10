#import "template.typ": *

#show: project.with(
  title: "Mathematics for Computer Science: Homework 5",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)


= [Wasserman]
== Exercise 1
Answer: 
We denote random variable $X_n$ as the money we have after $n$ trials.

Then we know that $E(X_(n+1)|X_n) = 1/2(2X_n + X_n/2) = (5X_n)/4$.

From the rule of iterated expectations, we have 
$
E(X_(n+1)) = E(E(X_(n+1)|X_n)) = E((5X_n)/4) = 5/4 E(X_n).
$

Since $E(X_0) = c$, so $E(X_n) = (5/4)^n c$.

== Exercise 7
Answer: $E(X) = integral_(-infinity)^infinity x f(x) d x$. 
Since we know that $Pr(X>0) = 1$ and $X$ is continues, thus for $x<0$, we have $f(x) = 0$.

So we have 
$
E(X) = integral_(0)^infinity x f(x) d x = integral_(0)^infinity x d F(x) \  
= -integral_(0)^infinity x d(1-F(x)) = -lim_(x->infinity)x(1-F(x))+integral_(0)^infinity (1-F(x))d x = integral_(0)^infinity Pr(X>x) d x.
$
where we use the fact that $lim_(x->infinity)x(1-F(x)) = lim_(x->infinity) x integral_(x)^infinity f(t)d t <= lim_(x->infinity) integral_(x)^infinity t f(t)d t = lim_(x -> infinity)(E(X) - integral_(-infinity)^x t f(t) d t) = 0$.

== Exercise 13
Answer: 
(a) $E(X) = 1/2E("Unif"(0, 1)) + 1/2E("Unif"(3, 4)) = 1/2(1/2+7/2) = 2$.

(b) $E(X^2) = 1/2E(("Unif"(0, 1))^2) + 1/2E(("Unif"(3, 4))^2) = 1/2((0^2+ 0 dot 1 + 1^2)/3+ (3^2+ 3 dot 4+ 4^2)/3) = 19/3$.

Therefore, $"Var"(X) = E(X^2) - E(X)^2 = 7/3$, $sigma(X) = sqrt(7/3)$.

== Exercise 17
Answer: 
$
"Var"(Y) &= E(Y^2) - E(Y)^2\  
&= E(("Var"(Y)+E(Y)^2)|X)-E(Y)^2 \
&= E("Var"(Y|X)) + E(E(Y|X)^2) - E(Y)^2 \
&= E("Var"(Y|X)) + E(E(Y|X)^2) - E(E(Y|X))^2 \
&= E("Var"(Y|X)) + "Var"(E(Y|X)).
$

== Exercise 20
Answer:
We assume $X = vec(X_1, X_2, dots.v, X_n)$, then
$
mu = E(X) = vec(E(X_1), E(X_2), dots.v, E(X_n))
$ and 
$
Sigma = "Var"(X) = mat(
  "Var"(X_1), "Cov"(X_1, X_2), dots, "Cov"(X_1, X_n);
  "Cov"(X_2, X_1), "Var"(X_2), dots, "Cov"(X_2, X_n);
  dots.v, dots.v, dots.v, dots.v;
  "Cov"(X_n, X_1), "Cov"(X_n, X_2), dots, "Var"(X_n)
).
$

We assume $a^T = (a_1, a_2, ..., a_n)$, then 
$
E(a^T X) = E(sum_(i = 1)^n a_i X_i) = sum_(i = 1)^n E(a_i X_i) = sum_(i = 1)^n a_i E(X_i) = a^T E(X)= a^T mu.
$
$
"Var"(a^T X) = "Var"(sum_(i = 1)^n a_i X_i) = sum_(i = 1)^n a_i^2 "Var"(X_i) + sum_(i != j) a_i a_j "Cov"(X_i, X_j) = a^T "Var"(X) a = a^T Sigma a .
$

If A is a matrix, we assume $A = mat(a_1^T; a_2^T; dots.v; a_n^T)$, then
$
E(A X) = E(mat(a_1^T X; a_2^T X; dots.v; a_n^T X)) = mat(a_1^T E(X); a_2^T E(X); dots.v; a_n^T E(X)) = A E(X) = A mu.
$
The $(i, j)$ entry of $"Var"(A X)$ is $"Cov"(a_i^T X, a_j^T X) = E((a_i^T X)(a_j^T X)) - E(a_i^T X)E(a_j^T X) = a_i^T E(X X^T) a_j - a_i^T E(X)E(X)^T a_j = a_i^T "Var"(X) a_j$.
Thus
$
"Var"(A X) = mat(
  a_1^T "Var"(X) a_1, a_1^T "Var"(X) a_2, dots, a_1^T "Var"(X) a_n;
  a_2^T "Var"(X) a_1, a_2^T "Var"(X) a_2, dots, a_2^T "Var"(X) a_n;
  dots.v, dots.v, dots.v, dots.v;
  a_n^T "Var"(X) a_1, a_n^T "Var"(X) a_2, dots, a_n^T "Var"(X) a_n
) = A Sigma A^T.
$
== Exercise 24
Answer:
$X_i tilde "Exp"(beta)$, so $f(x) = 1/beta e^(-1/beta x)$.

MGF of $X_i$ is 
$
M_t(x)&= E(e^(t x)) \  
&= integral_(0)^infinity e^(t x) f(x) d x \  
&= integral e^(t x) 1/beta e^(-1/beta x) d x\  
&= 1/beta integral_(0)^infinity e^((t-1/beta)x) d x\  
&= 1/((t-1/beta)beta) lim_(x->infinity) (e^((t-1/beta)x) - 1)\  
&= 1/(1-beta t).
$
Denote $Y = sum_(i = 1)^n X_i$, then $M_Y(t) = (1/(1-beta t))^n$. We recognize this as the MGF of $"Gamma"(n, beta)$. Since the MGF characterizes the distribution, we have $Y tilde "Gamma"(n, beta)$, which is $sum_(i = 0)^n X_i tilde "Gamma"(n, beta)$.

= [The Story of Louis Posa]
== Exercise 2
Answer: We first prove a lemma:

_Lemma_: If a graph has a Hamiltonian circuit, after removing k vertices and their incident edges, the graph has at most k connected components.

_Proof_: Since the graph has a Hamiltonian circuit, all vertices are on the cycle. When we remove a vertex, we can increase the number of connected components by at most 1. Thus, after removing k vertices, the graph has at most k connected components.

Now let's go back to original problem.

We remove 2, 2, 4 vertices and their incident edges from the three graphs respectively. But we see that the number of connected components is 4, 3, 5 respectively, which is larger than the number of vertices removed. Thus, the three graphs do not have Hamiltonian circuits.
#image("2024-03-30-14-20-20.png", width: 24em)
== Exercise 4
// We first prove a lemma:

// _Lemma_: a bipartite graph with unequal-sized partitions cannot have a Hamiltonian circuit. If the difference in size is at least 2, then the graph cannot have a Hamiltonian path either.

// _Proof_: In a bipartite graph, each vertex in one partition is connected to one vertex in the other partition and does not have any edges to vertices in the same partition. Thus, a Hamiltonian circuit or path must alternate between the two partitions. Therefore, if Hamiltonian circuit exists, the number of vertices in the two partitions must be equal. If Hamiltonian path exists, the number of vertices in the two partitions must differ less or equal than 1.

// Now let's go back to original problem.
Answer: We consider (a), if (a) has Hamiltonian circuit, then vertices A, B and C must have degree 2, so they have red edges drawn in the picture below. But then D has degree 3, which is impossible. Thus, (a) does not have Hamiltonian circuit.
#image("2024-03-30-15-19-51.png", width: 12em)
Although (a) does not have Hamiltonian circuit, it has Hamiltonian path. (b) and (c) both have Hamiltonian circuits.
#image("2024-03-30-15-02-55.png", width: 20em)
== Exercise 6
Answer: 
We color the chessboard like below.
#image("2024-03-30-17-48-12.png", width: 20em)
We have the same number of four blocks and we can see that 
1. red -> blue
2. blue -> red or yellow
3. yellow -> blue or green
4. green -> yellow
Since Hamiltonian circuit has no start and end, we assume we start from the red square in the top-left corner. The only block we can get to is blue, so the next step goes to blue. Because we have to go through all the blocks, so we have to go to yellow from blue at some point. And we have to go back to blue at some point too since we end at red and only blue can access red.

The problem occurs when we go from blue to yellow. This tour doesn't contain red and finally will go back to blue. This will cause the number of blue in the circuit will be greater than the number of red, which is impossible. Thus, the chessboard cannot have Hamiltonian circuit.
== Exercise 7
Answer:
We prove the _Ore's Theorem_: Let G be a simple graph on n vertices. If $n >= 3$, and
$deg(x) + deg(y) >= n$ for each pair of non-adjacent vertices x and y, then G has a Hamiltonian circuit.

_Proof_: We prove by contradiction. Assume that G does not have a Hamiltonian circuit but fulfils the condition. Then let G be the graph with most possible edges but does not have a Hamiltonian circuit(we can see that this is possible by adding edges).

Then add any edges to G will create a Hamiltonian circuit. G contains Hamiltonian paths. We assume that the Hamiltonian path is $v_1, v_2, ..., v_n$. Since G does not have a Hamiltonian circuit, $v_1$ and $v_n$ are not adjacent. 
If for any $v_i$ adjacent to $v_1$, $v_(i-1)$ and $v_n$ is not adjacent, then $deg(v_n)<=n-deg(v_1)-1$, which forms a contradiction to $deg(v_1) + deg(v_n)>=n$.

Thus, there exists $v_i$ adjacent to $v_1$ and $v_(i-1)$ adjacent to $v_n$, then $(v_1, ..., v_(i-1), v_n, ..., v_i, v_1)$ is a Hamiltonian circuit, which is a contradiction.

Therefore, we prove the _Ore's Theorem_.
== Exercise 9
Answer: 
Color all edges of the graph red. Then insert all the missing edges and color them blue.
Take any vertex at all as vertex 1 of the sequence. Separate into classes R and B the vertices to which 1 is joined, respectively, by red and blue edges. At least one of R and B must contain an infinity of vertices.
If both do, choose either. For definiteness, suppose R is infinite. Then take any vertex of R as vertex 2 of the sequence. Repeat the separation process with respect to vertex 2 and its infinite set B (forget all about set B). Choose any vertex of an infinite set thus
obtained as vertex 3 of the sequence, and so on. From this sequence Ramsey's theorem is
easily deduced. At the end rub out all the blue edges.
== Exercise 10
Answer:
Notice that edges $A_i A_j$ and $A_k A_l$ are parallel if and only if $abs(i - j) = abs(k - l) arrow.l.r.double i+j eq.triple k+l (mod 2n)$. 
For a Hamiltonian circuit, we assume the circuit is $A_(i_1) A_(i_2) ... A_(i_(2n))$.

If the circuit does not contain two edges which are parallel lines, then $i_j+i_(j-1)$ for $j in {2, 3, ..., 2n}$ and $i_1+i_(2n)$ must have different residues modulo $2n$. 
Thus, 
$
2sum_(j = 1)^(2n) i_j =sum_(j = 0)^(2n-1) j= n(2n-1) eq.triple n (mod 2n)
$
On the other hand, $i_1, i_2, ...,i_n$ are a permutation of $0, 1, ..., 2n-1$, so 
$
2sum_(j = 1)^(2n) i_j =2sum_(j = 0)^(2n-1) j= 2n(2n-1) eq.triple 0(mod 2n).
$
This is a contradiction. Thus, the circuit must contain two edges which are parallel lines.
