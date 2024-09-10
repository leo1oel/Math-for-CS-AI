#import "template.typ": *
#show: project.with(
  title: "Mathematics for Computer Science: Homework 6",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)
#show "red1": text(red)[red]
#show "green1": text(green)[green]
#show "blue1": text(blue)[blue]
#show "yellow1": text(yellow)[yellow]

= Exercise 1
Answer: 

We already know that $X tilde "Exponential"(beta)$, so 
$
Pr(abs(X - mu_X) >= k sigma_X) &= Pr(X>= mu_X + k sigma_X) + Pr(X <= mu_X - k sigma_X) \  
&= e^(-(mu_k + k sigma_X)/beta) + max(0, 1-e^(-(mu_X - k sigma_X)/beta))\  
& = e^(-(beta + k beta)/beta) + max(0, 1-e^(-(beta - k beta)/beta))\
& = e^(-1 - k) + max(0, 1-e^(k - 1))\  
& = e^(-1-k)
$

From Chebyshev's inequality, we have 
$
Pr(abs(X - mu_X)>= k sigma_X) <= (sigma_X^2)/(k^2 sigma_X^2) = 1/k^2.
$
Since $e^(-1 - k)<=1/k^2$, so it's consistent with Chebyshev's inequality.

= Exercise 2
Answer: 
$
Pr(X>=2 lambda) = Pr(abs(x - lambda)>=lambda) <= "Var"(X)/lambda^2 = lambda/lambda^2 = 1/lambda.
$

= Exercise 3
Answer:
Using Chebyshev's inequality, we have
$
Pr(abs(overline(X)_n - p) > epsilon) <= "Var"(overline(X)_n)/epsilon^2 = (n "Var"(X_1))/(n^2 epsilon^2) = "Var"(X_1)/(n epsilon^2) = p(1-p)/(n epsilon^2).
$
Using Hoeffding's inequality, we have
$
Pr(abs(overline(X)_n - p) > epsilon.alt) <= 2e^(-(2n epsilon.alt)^2/(1-0)^2) = 2e^(-2n epsilon.alt^2).
$
We then compare the two bounds. When $n > 1/(p(1-p)epsilon.alt^2)$(we assume $p!=0, p!=1$), we have
$
p(1-p)/(n epsilon^2)> 1/((n epsilon.alt^2)n epsilon.alt^2) = 1/((n epsilon^2)^2) = 2/((2n epsilon^2)^2/2)>=2/(e^(2n epsilon^2)) =  2e^(-2n epsilon.alt^2).
$

= Exercise 5
Answer:
Since $Z tilde N(0, 1)$, we have $f_Z (x) = 1/sqrt(2pi)e^(-x^2/2)$.
Therefore, 
$
Pr(abs(Z) > t) &= 2Pr(Z > t) \  
&= 2integral_(t)^infinity 1/sqrt(2pi)e^(-x^2/2) d x \  
&= sqrt(2/pi) integral_(t)^infinity e^(-x^2/2) d x \  
&<= sqrt(2/pi) 1/t integral_(t)^infinity x e^(-x^2/2) d x \  
&= sqrt(2/pi) 1/t (-e^(-x^2/2)|_(t)^infinity )\  
&= sqrt(2/pi) e^(-t^2/2)/t. 
$
Which is the desired result.
= Problem 1
Answer:
(a) 
We denote $c_(a, b)$ as the number of spanning trees of complete bipartite graph $K_(a, b)$ with $a$ and $b$ points on each side.
Then we have $c_(1, 1) = 1$, $c_(1, 2) = c_(2, 1) = 1$, $c_(2, 2) = 4$, $c_(a, 1) = c_(1, b) = 1$, $c_(a, b) = c_(b, a)$. We manage to find a recursive formula for $c_(a, b)$.

$
c_(a+1, b) &= 1vec(b, 1) c_(a, b) + 2 vec(b, 2) c_(a, b-1) + 3 vec(b, 3) c_(a, b-2) + ... + b vec(b, b) c_(a, 1) \  
& = sum_(i = 1)^b i vec(b, i) c_(a, b-i+1) \  
&= b sum_(i = 1)^b vec(b-1, i-1) c_(a, b-(i-1)) \  
& = b sum_(i = 0)^(b-1) vec(b-1, i) c_(a, b-i)
$
The formula is similar for $c_(a, b+1)$.

For $a = 2$, $b = n$, we can simplify the formula to $c_(2, n) = n sum_(i = 0)^(n-1) vec(n-1, i) c_(1, n-i) = n sum_(i = 0)^(n-1) vec(n-1, i) = n 2^(n-1)$. 
Therefore, $c_n = c_(2, n) = n 2^(n-1)$.

(b) 
The Laplacian matrix of $K_(m, n)$ is $mat(
  n, 0, 0, ..., 0, -1, -1, -1, ..., -1;
  0, n, 0, ..., 0, -1, -1, -1, ..., -1;
  0, 0, n, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, 0, ..., n, -1, -1, -1, ..., -1;
  -1, -1, -1, ...,-1, m, 0, 0, ..., 0;
  -1, -1, -1, ...,-1, 0, m, 0, ..., 0;
  -1, -1, -1, ...,-1 , 0, 0, m, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, -1, ...,-1 ,  0, 0, 0, ..., m;
)$

(c) 
From Matrix Tree Theorem, we have 
$
c_n = det(underbrace(mat(
  n, 0, ..., 0, -1, -1, -1, ..., -1;
  0, n, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., n, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, m, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, m, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, m, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., m;
), (n+m-1) times (n+m-1))) \  
$
Denote the matrix as $L^(1)$.

(1) If $m!=n$

Then $L^(1) - n I = mat(
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, m-n, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, m-n, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, m-n, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., m-n;
)$ has rank $n+1$ and is real symmetric, so the algebraic multiplicity of 0 is $m-2$. Hence $L^(1)$ has eigenvalue $n$ with algebraic multiplicity $m-2$.

$L^(1) - m I = mat(
  n-m, 0, ..., 0, -1, -1, -1, ..., -1;
  0, n-m, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., n-m, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, 0, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., 0;
)$ has rank $m$ and is real symmetric, so the algebraic multiplicity of 0 is $n-1$.
Hence $L^(1)$ has eigenvalue $m$ with algebraic multiplicity $n-1$. 

Notice that $L^1 - (m+n)/2 I$ satisfy the following equation:
$
mat(
  (n-m)/2, 0, ..., 0, -1, -1, -1, ..., -1;
  0, (n-m)/2, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., (n-m)/2, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, (m-n)/2, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, (m-n)/2, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, (m-n)/2, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., (m-n)/2;
) vec(n, n, dots.v, n, (n-m)/2+sqrt(((m+n)/2)^2 - n), (n-m)/2+sqrt(((m+n)/2)^2 - n), (n-m)/2+sqrt(((m+n)/2)^2 - n), ..., (n-m)/2+sqrt(((m+n)/2)^2 - n)) = -sqrt(((m+n)/2)^2 - n) vec(n, n, dots.v, n, (n-m)/2+sqrt(((m+n)/2)^2 - n), (n-m)/2+sqrt(((m+n)/2)^2 - n), (n-m)/2+sqrt(((m+n)/2)^2 - n), ..., (n-m)/2+sqrt(((m+n)/2)^2 - n)).
$
Therefore, $L^1$ have an eigenvalue $(m+n)/2-sqrt(((m+n)/2)^2 - n)$. Similarly, we have an eigenvalue $(m+n)/2+sqrt(((m+n)/2)^2 - n)$.

Thus, $L^1$ has eigenvalues $n$ with algebraic multiplicity $m-2$ and $m$ with algebraic multiplicity $n-1$ and $(m+n)/2plus.minus sqrt(((m+n)/2)^2 - n)$. So the determinant of $L^1$ is $n^(m-2)m^(n-1)((m+n)/2+sqrt(((m+n)/2)^2 - n))((m+n)/2-sqrt(((m+n)/2)^2 - n)) = n^(m-2)m^(n-1)n = n^(m-1) m^(n-1)$.

(2) If $m = n$

$L^(1) - n I = mat(
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, 0, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., 0;
)$ has rank $2$ and is real symmetric, so the algebraic multiplicity of 0 is $n-2$.
Notice that 
$
mat(
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, ..., 0, -1, -1, -1, ..., -1;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1, 0, 0, 0, ..., 0;
  -1, -1, ...,-1 , 0, 0, 0, ..., 0;
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v, dots.v;
  -1, -1, ...,-1 ,  0, 0, 0, ..., 0;
) vec(sqrt(n), sqrt(n), ..., sqrt(n), sqrt(n-1), sqrt(n-1), sqrt(n-1), ..., sqrt(n-1)) = -sqrt(n(n-1)) vec(sqrt(n), sqrt(n), ..., sqrt(n), sqrt(n-1), sqrt(n-1), sqrt(n-1), ..., sqrt(n-1)).
$
Therefore, we have an eigenvalue $-sqrt(n(n-1))$. And we know that $"trace"(L^(1) - n I) = 0$.
Thus, the last two eigenvalues are $sqrt(n(n-1))$ and $-sqrt(n(n-1))$.

The eigenvalues of $L^(1)$ are $n$ with algebraic multiplicity $2n-3$ and $sqrt(n(n-1))+n$ and $-sqrt(n(n-1)) + n$.
So the determinant of $L^(1)$ is $n^(2n-3)(n+sqrt(n(n-1)))(n-sqrt(n(n-1))) = n^(2n-2)$.

Sum up, we have $c_(n, m) = det(L^(1)) = n^(m-1)m^(n-1)$.

For the case $K_(2, n)$, we have $c_n = n 2^(n-1)$.
= Problem 2
Answer: 
(a)
#image("2024-04-04-15-55-54.png", width: 20em)
We first random determine the orientation of a spanning tree(red1 parts), then we draw a dual graph(green1 parts). And we can determine the rest orientation starting from the leaves of the dual graph.
#image("2024-04-04-15-50-06.png", width: 25em)
(b)
From above Pfaffian orientation, we can construct matrix $A_G (rho)$ as below:
$
A_G (rho) = mat(
  0, -1, 1, 0, 0, 0, 0, 1;
  1, 0, -1, -1, 0, 1, 0, 0;
  -1, 1, 0, 0, 0, 1, 0, 1;
  0, 1, 0, 0, 1, -1, 0, 0;
  0, 0, 0, -1, 0, 0, -1, 0;
  0, -1, -1, 1, 0, 0, -1, 0;
  0, 0, 0, 0, 1, 1, 0, -1;
  -1, 0, -1, 0, 0, 0, 1, 0;
).
$
$det(A_G (rho)) = 49$, thus the number of perfect matchings for $G$ is $sqrt(det(A_G (rho))) = 7$.
= Problem 3
Answer: 
(a)
If $n=5$, then the chromatic number is 5, then we consider the case $n>5$.

We first arrange the integer in a circle, then every vertices have connection with its nearest two vertices. For vertices 0, 1, 2, since they pairwise connected, so we need at least color.

If $n eq.triple 0 (mod 3)$, we color the vertices in the following way:
vertices 0, 3, 6, ..., $n-3$ are colored with color red1, vertices 1, 4, 7, ..., $n-2$ are colored with color blue1, vertices 2, 5, 8, ..., $n-1$ are colored with color green1. Then we can see that every vertices have different color with its nearest two vertices.

If $n eq.triple 1 (mod 3)$, WLOG, we color 0, 1, 2 with color red1, blue1, green1 respectively. If we can color the graph with 3 colors, then vertices 3, 4, ..., $n-1$ can be determined without alternative. vertices 3 is colored with color red1, vertices 4 is colored with color blue1, ..., vertices $n-1$ is colored with color red1. Then we can see that vertices $n-1$ has the same color as vertex 0, which is a contradiction. 

It's similar with $n eq.triple 2 (mod 3)$, if we color with 3 colors, then we will end up with vertices $n-1$ and 1 have the same color, which is a contradiction.

Next, let's prove four color is enough for $n eq.triple 1 (mod 3)$ and $n eq.triple 2 (mod 3)$.

For $n eq.triple 1 (mod 3)$, we color the vertices in the following way:
vertices 0, 3, 6, ..., $n-3$ are colored with color red1, vertices 1, 4, 7, ..., $n-2$ are colored with color blue1, vertices 2, 5, 8, ..., $n-4$ are colored with color green1 and vertex $n-1$ is colored yellow1. Then we can see that every vertices have different color with its nearest two vertices.

For $n eq.triple 2 (mod 3)$, we color the vertices in the following way:
vertices 0, 4, 7, ..., $n-4$ are colored with color red1, vertices 1, $n-2$ are colored with color blue1, vertices 2, 5, 8, ..., $n-3$ are colored with color green1 and vertices 3, 6, 9, ..., $n-5$, $n-1$ is colored yellow1. Then we can see that every vertices have different color with its nearest two vertices.

To sum up, $chi(G_n) = cases(
  3 "if" n eq.triple 0 (mod 3),
  4 "if" n eq.triple 1 or 2 (mod 3),
  5 "if" n = 5
)$.

(b)
For $n=5$, the maximum size of any clique in $G_n$ is 5.

For $n > 5$, the maximum size of any clique in $G_n$ is 3. 
If there exist a clique with size 4, then we can see that the four vertices are pairwise connected. WLOG, we assume vertex 0 in the clique, then 3 vertices in 1, 2, $n-1$, $n-2$ must also in the clique, whichever the case, edge(1, n-2) or edge(2, n-1) at least one must in the clique, which is a contradiction. 

(c)
To find $m a x c u t(G_n)$, we need to divide the graph into two vertices sets and maximize the number of edges between the two sets.

Let's called two sets $A$ and $B$. WLOG, we assume vertex 0 is in set $A$.

If $n=5$, we can easily know that $m a x c u t(G_5) = 6$. Below we only discuss the case $n > 5$.

After some observation, we have some facts:
1. If three continuous vertices are in set $A$, then we can change one vertex from set $A$ to set $B$ and $m a x c u t(G_n)$ will not decrease.
2. Change from the pattern $..., A, A, B, A, A, ...$ to $..., B, A, B, A, A, ...$ to pattern $..., A, B, B, A, A, ...$ will not decrease $m a x c u t(G_n)$.

Therefore, if we want to reach the maximum of $m a x c u t(G_n)$, we need to divide the vertices into two sets in the following way:
$..., A, A, B, B, A, A, B, B, A, A, ...$

If $n eq.triple 0 (mod 4)$, then we can divide the vertices into two sets in the following way:
0, 1, 4, 5, ..., $n-4$, $n-3$ are in set $A$, 2, 3, 6, 7, ..., $n-2$, $n-1$ are in set $B$. Then we can see that $m a x c u t(G_n) = (3n)/2$. 

If $n eq.triple 1 (mod 4)$, then we can divide the vertices into two sets in the following way:
0, 1, 4, 5, ..., $n-5$, $n-4$, $n-2$ are in set $A$, 2, 3, 6, 7, ..., $n-7$, $n-6$, $n-3$, $n-1$ are in set $B$. Then we can see that $m a x c u t(G_n) = (3(n-1))/2$.

If $n eq.triple 2 (mod 4)$, then we can divide the vertices into two sets in the following way:
0, 1, 4, 5, ..., $n-6$, $n-5$, $n-3$, $n-2$ are in set $A$, 2, 3, 6, 7, ..., $n-8$, $n-7$, $n-4$, $n-1$ are in set $B$. Then we can see that $m a x c u t(G_n) = (3n-2)/2$.

If $n eq.triple 3 (mod 4)$, then we can divide the vertices into two sets in the following way:
the vertices into two sets in the following way:
0, 1, 4, 5, ..., $n-7$, $n-6$, $n-3$ are in set $A$, 2, 3, 6, 7, ..., $n-5$, $n-4$, $n-2$, $n-1$ are in set $B$. Then we can see that $m a x c u t(G_n) = (3n-1)/2$.

To sum up, $m a x c u t(G_n) = cases(
  6k "if" n = 4k,
  6k "if" n = 4k+1,
  6k+2 "if" n = 4k+2,
  6k+4 "if" n = 4k+3
)$.

(d) 
We arrange the vertices in a circle, then we can construct a hamiltonian cycle $0, 1, 2, ..., n-1, 0$.

Notice that if two edges intersect, then one of them must be inside the circle and the other must be outside the circle to make the graph planar. If two intersect edges are both inside the circle or both outside the circle, then they must intersect and the graph cannot be planar.

If $n eq.triple 1 (mod 2)$, then we color the edges in red1 and blue1, where red1 edges stand for inside the circle and blue1 edges stand for outside the circle. If the graph is planar, then two intersect edges cannot have the same color.

WLOG, we assume edge(0, 2) is blue1, then edge(1, 3) must be red1, edge(2, 4) must be blue1, ..., edge($n-3$, $n-1$) must be blue1, edge($n-2$, 0) must be red1. Then if edge($n-1$, 1) is red1(for $n=9$, this case is shown in the figure below), then edge($n-2$, 0) and edge($n-1$, 1) intersect and have the same color. If edge($n-1$, 1) is blue1, then edge($n-1$, 1) and edge(0, 2) intersect and have the same color. Thus, the graph is not planar.
#image("2024-04-05-11-03-54.png", width: 20em)

If $n eq.triple 0 (mod 2)$, then we can color each intersect edge with red1 and blue1 alternatively successfully. Thus, we can draw each intersect edge inside and outside the circle without intersecting.
So $G_n$ is planar.

To sum up, $G_n$ is planar only when $n eq.triple 0 (mod 2)$.
// From _Kuratowski's Theorem_, we know that a graph is planar if and only if it does not contain a subgraph that is a subdivision of $K_5$ or $K_(3, 3)$.

// Since $G_5$ is exactly $K_5$, thus $G_5$ is not planar.

// For $n > 5$, since every vertices has four edges, so we only need to  verify whether $G_n$ contains a subgraph $K_5$ or $K_(3, 3)$.

// From (b), we know that $G_n$ does not contain $G_5$. If $G_n$ contains $K_(3, 3)$, we assume, vertex 0 is a vertex on the left side. Then we can see that 3 vertices in 1, 2, $n-1$, $n-2$ are in the right side and they are pairwise disconnected. This is impossible.

// Thus, $G_n$ is planar for $n > 5$.
