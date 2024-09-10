#import "template.typ": *
#import "quick-maths.typ": shorthands
#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond
#show: project.with(
  title: "Mathematics for Computer Science: Homework 9",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)
#show: shorthands.with(
  ($+-$, $plus.minus$),
  ($>=$, sym.gt.eq.slant),
  ($<=$, sym.lt.eq.slant),
  ($VV$, "Var")
)

= Problem 4.1
Answer: 
(i) We assume that $p(0) = (x_1, x_2)$.

#diagram(
  node-stroke: .1em,
  spacing: 4em,
  node((0,0), `state 1`, radius: 2em),
  edge($p_(12) = 1$, "-|>", bend: 40deg),
  node((1,0), `state 2`, radius: 2em),
  edge((1, 0), (0, 0), $p_(21) = 1$, "-|>", bend: 40deg)
)

So, the transition matrix $P$ is $mat(0, 1; 1, 0)$. Since $p(t) = p(t-1)P$, we have $p(t) = p(0)P^t$.

$
P^t = mat(0, 1;1, 0)^t = cases( 
  mat(0, 1;1, 0) & upright("if" 2|t),
  mat(1, 0;0, 1) & upright("if" 2 divides.not t).
)
$
Therefore $p(t) = cases(delim: "{", (x_1, x_2) & upright("if" 2 divides.not t), (x_2, x_1) & upright("if" 2|t))$. It converge iff $x_1 = x_2$.

(ii)
We assume that $p(0) = (x_1, x_2, x_3)$.

#diagram(
  node-stroke: .1em,
  spacing: 4em,
  node((0,0), `state 1`, radius: 2em),
  edge($p_(12)=1$, "-|>", bend: 40deg),
  node((1,0), `state 2`, radius: 2em),
  edge($p_(23)=1$, "-|>", bend: 40deg),
  node((2, 0), `state 3`, radius: 2em),
  edge((2, 0), (0, 0), $p_(31)=1$, "-|>", bend: 40deg)
)

So the transition matrix $P$ is $mat(0, 1, 0;0, 0, 1; 1, 0, 0)$. Since $p(t) = p(t-1)P$, we have $p(t) = p(0)P^t$.
$
P^t = mat(0, 1, 0;0, 0, 1; 1, 0, 0)^t = cases(
  mat(0, 1, 0;0, 0, 1; 1, 0, 0) & upright("if" t eq.triple 1 (mod 3)),
  mat(0, 0, 1;1, 0, 0;0, 1, 0) & upright("if" t eq.triple 2 (mod 3)), 
  mat(1, 0, 0;0, 1, 0;0, 0, 1) & upright("if" t eq.triple 0 (mod 3)).
)
$
Therefore $p(t) = cases(delim: "{", 
  (x_1, x_2, x_3) & upright("if" t eq.triple 0 (mod 3)), 
  (x_3, x_1, x_2) & upright("if" t eq.triple 1 (mod 3)), 
  (x_2, x_3, x_1) & upright("if" t eq.triple 2 (mod 3))
)$. It converge iff $x_1 = x_2 = x_3$.

We can generalize these examples to $n$ states with $p_(12) = p_(23) = p_(34) = ... = p_((n-1)n) = p_(n 1) = 1$ and the other $p_(i j) = 0$. Similarly, we have $P$ as a cyclic permutation matrix and $p(t)$ converge iff $x_1 = x_2 = ... = x_n$. So $p(t)$ does not converge for every connected Markov Chain.

= Problem 4.2
Answer: Let $a(t) = log(t)$. We have $lim_(t -> infinity) a(t) - a(t+1) = lim_(t->infinity) log(1-1/(t+1)) = 0$. But $a(t)$ does not converge. 
= Problem 4.3
Answer: (i) We can tell from the graph that the transition matrix $P$ is 
$
mat(
  0.4, 0.6, 0, 0, 0;
  0.4, 0, 0.6, 0, 0;
  0, 0.4, 0, 0.6, 0;
  0, 0, 0.4, 0, 0.6;
  0, 0, 0, 0.4, 0.6;
)
$
We assume $pi = (x_1, x_2, x_3, x_4, x_5)$.
From $pi = pi P$ we know that
$
(x_1, x_2, x_3, x_4, x_5) = (0.4x_1 + 0.4x_2,0.6x_1+ 0.4x_3, 0.6x_2+ 0.4x_4, 0.6x_3+ 0.4x_5, 0.6x_4 + 0.6x_5)\  
x_1 + x_2 + x_3 + x_4 + x_5 = 1
$
Solving the equations, we have $x_1 = 16/211, x_2 = 24/211, x_3 = 36/211, x_4 = 54/211, x_5 = 81/211$. So the stationary distribution is $(16/211,24/211, 36/211, 54/211, 81/211)$.

(ii) We can tell from the graph that the transition matrix $P$ is
$
mat(
  0.5, 0.5, 0, 0, 0;
  0, 0.5, 0.5, 0, 0;
  0, 0, 0.5, 0.5, 0;
  0, 0, 0, 0.5, 0.5;
  0, 0, 0, 0, 1; 
)
$
We assume $pi = (x_1, x_2, x_3, x_4, x_5)$.
From $pi = pi P$ we know that
$
(x_1, x_2, x_3, x_4, x_5) = (0.5x_1, 0.5x_1 + 0.5x_2, 0.5x_2 + 0.5x_3, 0.5x_3 + 0.5x_4, 0.5x_4+ x_5)\  
x_1 + x_2 + x_3 + x_4 + x_5 = 1
$
Solving the equations, we have $x_1 = x_2 = x_3 = x_4 =0, x_5 = 1/5$. So the stationary distribution is $(0,0,0,0,1)$.
= Problem 4.10
Answer:
The current state stay put with probability $1/2$ and mov as in the old chain with probability $1/2$. 
Therefore,
$
p'_(i j) = cases(
  1/2+ 1/2p_(i i) & upright("if" i = j),
  1/2p_(i j) & upright("if" i != j).
)
$
We just need to prove that 
$
pi_x &= sum_y pi_y p'_(y x) \  
<=>pi_x &= pi_x 1/2+ pi_x 1/2 p_(i i)+sum_(y != x) pi_y 1/2 p_(y x) \   
<=>pi_x&= pi_x/2 + (pi_x p_(i i))/2  + 1/2 (sum_y pi_y p_(y x)- pi_x p_(x x))\   
<=> pi_x &= pi_x.
$
Therefore, the new chain has the same stationary distribution as the old chain.

And since the new chain tends to stay put instead of getting out, the conductance is much lower than the old chain.(We can also observe this from $Phi = (sum_((x, y) in (S, overline(S))) pi_x p'_(x y))/(min(pi(S), pi(overline(S))))$ since $p'_(x y) = (p_(x y))/2$ for $x!=y$) Thus the convergence time will be longer.


= Problem 4.19
Answer:
(1)
For two $n$ vetices cliques connected by a single edge, we have $p_(x y)= 1/(n-1)$ if $x, y$ are not the vertices on that connected single edge and $p_(x, y) = 1/n$ if $x, y$ at least one is a vertex of that connected single edge. Thus, $pi_x = n/(2(n^2 - n + 1))$ if vertex $x$ is on that connected single edge and $pi_x = (n-1)/(2(n^2 - n + 1))$ if vertex $x$ is not on that connected single edge. 

With $pi(S)<=1/2$, we want $S$ to have the smallest probability mass exiting it, which is that connected single edge.

Thus, we have $Phi = (n/(2(n^2 - n + 1)) 1/n)/(1/2) = 1/(n^2 - n +1)$.

Thus the $epsilon$-mixing time is $O(ln(1/((n-1)/(2(n^2 - n + 1))))/(Phi^2 epsilon^3))= O(((n^2 - n +1)^2 ln((2(n^2-n +1))/(n-1)))/epsilon^3)= O((n^4 ln n)/epsilon^3)$.

(2)
For a $n$ vetices cliques connected by a single edge, we have $p_(x y)= 1/(n-1)$ if $x, y$ are not the vertices on that connected single edge and $p_(x, y) = 1/n$ if one $x, y$ is a vertex of that connected single edge and $p_(x, y) = 1/n$ and $p_(x, y) = 1$ if edge $x y$ is that additional edge and $x$ is on the clique. Thus, $pi_x = (n-1)/(n^2-n +2)$ if vertex $x$ is not on that connected single edge and $pi_x = n/(n^2-n +2), pi_y = 1/(n^2 - n +2)$ if edge $x y$ is that additional edge and $x$ is on the clique.

// With $pi(S)<=1/2$, we want $S$ to have the smallest ratio of probability mass exiting it to probability mass inside it.

// If $abs(S) = 1$, then $Phi = 1$.
// For $abs(S) >= 2$, we can know that the one contain one of the vetex of the additional edge will have the smallest ratio.
// $
// Phi = min(((n-abs(S))(n/(n^2-n +2) 1/n + (abs(S) - 1)(n-1)/(n^2-n +2) 1/(n-1)))/((n+ (abs(S)-1)(n-1))/(n^2-n +2)))= min(((n-abs(S))abs(S))/(n+(abs(S)-1)(n-1))).
// $
Next, we prove a lemma.

We define canonial path $gamma_(i j) = {i = x_0, x_1, ..., x_k = j}$ and 
the congestion of the Markov chain as 
$
rho = max_((u, v)){1/(pi(u)P_(u v)) sum_(x, y in chi\  gamma_(x y) "uses" (u, v)) pi(x)pi(y)}.
$
Then we can show that $Phi>=1/(2rho)$.

_Proof_.
It's suffices to show that for any $S$ such that $pi(S) <= 1/2$, we have $("flow"(S, overline(S)))/pi(S)>=1/(2rho)$.
$
2rho"flow"(S, overline(S)) = 2rho sum_(u in S\ 
v in overline(S)) pi(u)P(u, v)\  
>=2sum_(u in S\ v in overline(S))rho_((u, v))pi(u)P(u, v) >=2 sum_(u in S\ v in overline(S))sum_(x, y in chi\  gamma_(x y) "uses" (u, v)) pi(u)P(u, v)\  
>=2 sum_(x in S\  y in overline(S)) pi(x)pi(y) = 2pi(S)pi(overline(S))>=pi(S).
$
Therefor $Phi>=1/(2rho)$.

so $t_"mix"<= 2/Phi^2 log(1/(pi_min epsilon))<=8 rho^2 log(1/(pi_min epsilon))$.

Now we go back to the original problem, we design the path to be straight, so every two vertices in the clique has path with one edge. For the addition vertex, the path is first go to the vertex on the clique and then go straight to the destination.

From this design of path we can know that
$
rho = max(1/(1/(n^2 - n +2)) (n-1)  1/(n^2 - n +2)  n/(n^2 - n +2),\  
 1/(1/(n^2 - n +2)) 1 (n-1)/(n^2 - n +2)  n/(n^2 - n +2),\  
  1/(1/(n^2 - n +2)) 1 (n-1)/(n^2 - n +2)  (n-1)/(n^2 - n +2))\  
=  (n^2 - n)/(n^2 - n +2).
$
Therefore we have $t_"mix"=O(((n^2 - n)/(n^2 - n +2))^2log((n^2 -n +2)/epsilon))$.

= Problem 4.21
Answer:
(1)
We know that $pi_x$ and $p_(x y)$ is the same for all vertices.
Thus, if we want to minimize the conductance, we only need to minimize the number of edges between $S$ and $overline(S)$.(If two vertices are adjacent, we think they have an edge between them.)
We use set $A$ to denote the edges between $S$ and $overline(S)$.

Notice two fact:
1. If a vertex is not connected with other vertices, we can always adjust it to connected with other vertices and it will not increase the conductance.
2. If we have vertices connected to each other, we can always adjust it to form many square next to each other and it will not increase the conductance. 

Because we know that:
1. We add a isolated vertex at corner and $abs(A)$ will increase by 2.
2. We add a isolated vertex in the border and $abs(A)$ will increase by 3.
3. We add a isolated vertex in the center and $abs(A)$ will increase by 4.
4. We connected a vertex and another vertex and $abs(A)$ will decrease by 2.

Thus it's always better to connect two isolated vertices to each other. And to form square is another effective way to reduce $abs(A)$ since it connected more vertices. So we have two cases: one is that all the vertices are around the corner and the other is that the vertices take at least two corners.

The first case, we only take one corner.

For a given number of small square with 4 vertex, if the total size is given, then $abs(A)$ is minimized when these squares build a big square since square has the smallest perimeter.

Therefore, the minimum number of edges leaving $S$ is at least $2 floor(sqrt(abs(S)))$.

The second case, we take more than one corner. 

If we take two corners, then the minimum number of edges leaving $S$ is at least $n$.
If we take more than two corners, then the $overline(S)$ will take less than two corners and we can use the above result.

Thus, the minimum number of edges leaving $S$ is $min(n, 2 sqrt(abs(S)))$.

(1) If $abs(S) >= n^2/4$, the minimum number of edges leaving $S$ is $min(n, 2 sqrt(n^2/4)) = n$.

(2) If $abs(S) <= n^2/4$, the minimum number of edges leaving $S$ is $min(n, 2 sqrt(abs(S))) = 2 sqrt(abs(S))$.

(3) 
If $abs(S)>=n^2/4$, $Phi= Omega((n 1/n^2 1/4)/(n^2/4 1/n^2)) = Omega(1/n)$.

If $abs(S)<= n^2/4$, 
$Phi(S) = Omega((sqrt(abs(S))/n^2 1/4)/(abs(S)/n^2)) = Omega(1/sqrt(abs(S))) = Omega(1/n)$

(4) $Phi = min_(S)(Phi(S)) = Omega(1/n)$.

(5) The $epsilon$-mixing time is $O(ln(n^2)/(Phi^2 epsilon^3)) = O((n^2 ln n)/epsilon^3)$.