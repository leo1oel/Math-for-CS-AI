#import "template.typ": *
#import "quick-maths.typ": shorthands
#import "@preview/physica:0.9.3": *
#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond
#show: project.with(
  title: "Mathematics for Computer Science: Homework 10",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)
#show: shorthands.with(
  ($+-$, $plus.minus$),
  ($>=$, sym.gt.eq.slant),
  ($<=$, sym.lt.eq.slant),
  ($VV$, "Var"),
)
= Problem 1
Answer:

*a.*

We use the fact that $iprod(x_i, x_j)_pi = delta_(i j)$, which means that in the inner product space $(R^Omega, iprod(dot, dot)_pi)$, ${f_i}_(i = 1)^(abs(Omega))$ is an orthonormal basis. Then we assume $f = sum_(i = 1)^n a_i f_i$. Since $iprod(f, f_1)_pi = 0$, whence $a_1 = 0$, $f = sum_(i = 2)^n a_i f_i$. Since $iprod(f, f)_pi = 1$, we have $sum_(i = 2)^n a_i^2 = 1$.

Thus,

$
iprod(L f, f)_pi &=  sum_(x in Omega) pi(x) (L f)(x) f(x) \  
&= sum_(x in Omega) pi(x) ((I - P) f) (x) f(x) \
&= sum_(x in Omega) pi(x) f(x) f(x) - sum_(x in Omega) pi(x) (P f) (x) f(x)\  
&= iprod(f, f)_pi -  sum_(x in Omega)  pi(x) (sum_(i = 2)^n a_i lambda_i f_i (x)) (sum_(j = 2)^n a_j f_j (x)) \
&= iprod(f, f)_pi - sum_(i = 2)^n a_i^2 lambda_i iprod(f_i, f_i)_pi\
&= 1 - sum_(i = 2)^n a_i^2 lambda_i \  
&>= 1 - lambda_2 sum_(i = 2)^n a_i^2 \  
&= 1 - lambda_2.
$
Because $lambda_1 = 1$, so $iprod(L f, f)_pi >= 1 - lambda_2 = lambda_1 - lambda_2 = gamma$.

*b.*

Similar to $a$, except we don't have $iprod(f, f)_pi = 1$. We still assume $f = sum_(i = 1)^n a_i f_i$. Since $iprod(f, f_1)_pi = 0$, whence $a_1 = 0$, $f = sum_(i = 2)^n a_i f_i$. The difference is that now we have $sum_(i = 2)^n a_i^2 = iprod(f, f)_pi$. Thus,

$
iprod(L f, f)_pi &=  sum_(x in Omega) pi(x) (L f)(x) f(x) \  
&= sum_(x in Omega) pi(x) ((I - P) f) (x) f(x) \
&= sum_(x in Omega) pi(x) f(x) f(x) - sum_(x in Omega) pi(x) (P f) (x) f(x)\  
&= iprod(f, f)_pi -  sum_(x in Omega)  pi(x) (sum_(i = 2)^n a_i lambda_i f_i (x)) (sum_(j = 2)^n a_j f_j (x)) \
&= iprod(f, f)_pi - sum_(i = 2)^n a_i^2 lambda_i iprod(f_i, f_i)_pi\
&= iprod(f, f)_pi - sum_(i = 2)^n a_i^2 lambda_i \  
&>= iprod(f, f)_pi - lambda_2 sum_(i = 2)^n a_i^2 \  
&= iprod(f, f)_pi (1- lambda_2).
$

And if we let $a_1 = a_3 = a_4 = ... = a_n = 0$ and $a_2 = sqrt(iprod(f, f)_pi)$, the equality is reached and we have $iprod(L f, f)_pi/iprod(f, f)_pi = 1 - lambda_2 = gamma$.

Thus, $gamma = min_(f in R^n, iprod(f, f_1)_pi = 0, iprod(f, f)_pi>0) iprod(L f, f)_pi/iprod(f, f)_pi$.

*c.*

Use $pi(x) P(x, y) = pi(y) P(y, x)$ we can know that 
$
sum_(x in Omega) pi(x) f(x)^2  & = sum_(x in Omega) pi(x) sum_(y in Omega) P(x, y) f(x)^2 \   
& = sum_(x, y in Omega) pi(x) P(x, y) f(x)^2 \
&= 1/2 sum_(x, y in Omega) (pi(x) P(x, y) f(x)^2 + pi(y) P(y, x) f(y)^2) \   
& = 1/2 sum_(x, y in Omega) (pi(x) P(x, y) (f(x)^2 + f(y)^2)) \
$
Also notice that $(P f)(x) = sum_(y in Omega) P(x, y) f(y)$.
Thus, 
$
iprod(L f, f)_pi &=  sum_(x in Omega) pi(x) (L f)(x) f(x) \  
&= sum_(x in Omega) pi(x) ((I - P) f) (x) f(x) \
&= sum_(x in Omega) pi(x) f(x) f(x) - sum_(x in Omega) pi(x) (P f) (x) f(x)\  
&= 1/2 sum_(x, y in Omega) (pi(x) P(x, y) (f(x)^2 + f(y)^2)) -  sum_(x in Omega)  pi(x) sum_(y in Omega) P(x, y) f(y) f(x) \
&= 1/2 sum_(x, y in Omega) (pi(x) P(x, y) (f(x) - f(y))^2).
$
For the second equality, we can calculate the right side,
$
"RHS" & = sum_(x, y in Omega) pi(x) pi(y) f(x) f(y) + 1/2 sum_(x, y in Omega) pi(x) pi(y) (f(x)f(x) + f(y)f(y) - 2 f(x)f(y)) \
& = 1/2 sum_(x, y in Omega) pi(x) pi(y) (f(x)f(x) + f(y)f(y))\  
& = sum_(x, y in Omega) pi(x) pi(y) f(x) f(x) \  
& = sum_(x in Omega) pi(x) f(x)^2 sum_(y in Omega) pi(y) \
& = sum_(x in Omega) pi(x) f(x)^2\  
& = "LHS".
$

*d.*
$
iprod(f_S, f_S)_pi = sum_(x in Omega) pi(x) f_S (x) f_S (x) = sum_(x in S) pi(x) pi(S^C)^2 + sum_(x in S^C) pi(x) pi(S)^2= pi(S) pi(S^C).
$
$
iprod(L f_S, f_S)_pi = sum_(x in Omega) pi(x) (L f_S) (x) f_S (x) = iprod(f_S, f_S)_pi - sum_(x in Omega)  pi(x) sum_(y in Omega) P(x, y) f_S (y) f_S (x).
$
$
sum_(x in Omega)  pi(x) sum_(y in Omega) P(x, y) f_S (y) f_S (x)&= sum_(x in S, y in S) pi(x) P(x, y) (-pi(S^C)) (-pi(S^C)) + sum_(x in S^C, y in S^C) pi(x) P(x, y) pi(S) pi(S) \  
&+  sum_(x in S, y in S^C) pi(x) P(x, y) (-pi(S^C)) pi(S) + sum_(x in S^C, y in S) pi(x) P(x, y) pi(S) (-pi(S^C))\ 
&=pi(S^C)^2sum_(x in S, y in S) pi(x) P(x, y)  + pi(S)^2sum_(x in S^C, y in S^C) pi(x) P(x, y)\
&- 2pi(S)pi(S^C)sum_(x in S, y in S^C) pi(x) P(x, y) \  
& = pi(S^C)^2 sum_(x in S)pi (x) (1 - sum_(y in S^C) P(x, y)) + pi(S)^2 sum_(x in S^C) pi(x)(1 - sum_(x in S^C)P(x, y)) \  
&- 2pi(S)pi(S^C)sum_(x in S, y in S^C) pi(x) P(x, y) \  
&= pi(S^C)^2 pi(S) + pi(S)^2 pi(S^C) - (pi(S)+pi(S^C))^2sum_(x in S, y in S^C) pi(x) P(x, y)\
& = pi(S)pi(S^C) - sum_(x in S, y in S^C) pi(x) P(x, y).
$
Therefore, $iprod(L f_S, f_S)_pi = sum_(x in S, y in S^C) pi(x) P(x, y)$. And we can know that
$
iprod(L f_S, f_S)_pi/iprod(f_S, f_S)_pi = (sum_(x in S, y in S^C) pi(x) P(x, y))/(pi(S) pi(S^C)) = (Q(S, S^C))/(pi(S)pi(S^C)).
$


*e.*

We can verify that 
$
iprod(f_S, f_1)_pi = sum_(x in Omega) pi(x)f_S (x) f_1(x) = sum_(x in S) pi(x) (-pi(S^C))+ sum_(x in S_C) pi(x) pi(S) = 0,
$
and 
$
iprod(f_S, f_S)_pi = pi(S) pi(S^C)(pi(S^C) + pi(S))>0.
$
Thus from $b$ and $d$ we can deduce that
$gamma<= iprod(L f_S, f_S)_pi/iprod(f_S, f_S)_pi = (Q(S, S^C))/(pi(S)pi(S^C)) <= (2Q(S, S^C))/(min(pi(S), pi(S^C))) = 2 Phi_*$.

= Exercise 4.25
Answer:

(1) We denote the probability of reaching vertex 1 before vertex 5 when starting at vertex $i$ is $p_i$. 
Then we know that:
$p_1 = 1, p_5 = 0$.
And we can also get a recursive formula:
$p_i = 1/2 p_(i - 1) + 1/2 p_(i+1)$ for $i = 2, 3, 4$.

Thus $p_2 = 1/2 + p_3/2,p_3 = p_2/2 + p_4/2,p_4 = p_3/2$. Solve these equations we can get $p_2 = 3/4, p_3 = 1/2, p_4 = 1/4$.

Thus, the probability of reaching vertex 1 before vertex 5 when starting at vertex 4 is $1/4$.

(2) We denote the probability of reaching vertex 1 before vertex 5 when starting at vertex $i$ is $p_i$. 
Then we know that: 
$p_1 = 1, p_5 = 0$.
And we can also get some equations: 
$
p_2 = 1/4 p_1 + 1/4 p_3 +1/4 p_4 + 1/4 p_6,\  
p_3 = 1/4 p_1 + 1/4 p_2 + 1/4 p_4 + 1/4 p_6,\
p_4 = 1/4 p_2 + 1/4 p_3 + 1/4 p_5 + 1/4 p_6,\
p_6 = 1/4 p_2 + 1/4 p_3 + 1/4 p_4 + 1/4 p_5.
$
Solve these equations and we can get $p_2 = p_3 = 3/5, p_4 = p_6 = 2/5$.

Thus, the probability of reaching vertex 1 before vertex 5 when starting at vertex 4 is $2/5$.