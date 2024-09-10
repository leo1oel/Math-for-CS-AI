#import "template.typ": *
#import "@preview/cetz:0.2.1"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Mathematics for Computer Science: Homework 4",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)

= Exercise 11
Answer: (a) 
We only toss once.
Therefore, $Pr((X = 1) sect (Y = 0)) = p$ and $ Pr((X = 0) sect (Y = 1)) = 1-p$ .
While $Pr(X = 1) = Pr(Y = 0) = p$ and $Pr(Y = 1) = Pr(X = 0) = 1-p$.

If X and Y are independent, then $Pr((X = 1) sect (Y = 0)) = Pr(X = 1)Pr(Y = 0)$ and $Pr((X = 0) sect (Y = 1)) = Pr(X = 0)Pr(Y = 1)$
Therefore, $p = p(1-p)$ and $1-p = p(1-p)$.
We have $p = 0$ and $p = 1$, which is a contradiction.

Thus, X and Y are dependent.

(b)
$N ~ "Poisson"(lambda)$ therefore $Pr(N = i) = lambda^(i)/(i !)e^(-lambda)$.
$lambda$ is the expected number of toss in a given time interval.
So $lambda p$ is the expected number of heads in the same time interval.
Similarly, $lambda (1-p)$ is the expected number of tails in the same time interval.

$Pr(X = n_1) = (lambda p)^(n_1)/(n_1 !)e^(-lambda p)$

$Pr(Y = n_2) = (lambda (1-p))^(n_2)/(n_2 !)e^(-lambda(1-p))$

Next, we calculate
$Pr((X = n_1) sect (Y = n_2))$.
$
Pr((X = n_1) sect (Y = n_2)) &= sum_(i = 0) ^(+infinity) Pr((X = n_1) sect (Y = n_2) | N = i)Pr(N = i)\  
&= Pr((X = n_1) sect (Y = n_2) | N = n_1 + n_2)Pr(N = n_1 + n_2)\  
&= vec(n_1 + n_2, n_1)p^(n_1)(1-p)^(n_2)lambda^(n_1 + n_2)/((n_1 + n_2) !)e^(-lambda)\  
&= p^(n_1)(1-p)^(n_2)lambda^(n_1 + n_2)/(n_1 ! n_2 !)e^(-lambda)\  
&= Pr(X = n_1)Pr(Y = n_2)
$
Therefore, X and Y are independent.
= Exercise 14
Answer: $(X, Y)$ uniformly distributed on the unit disk, 
$R = sqrt(X^2 + Y^2)$, thus 
$
F_R (a) = Pr(R<=a) = cases(
  0 "if" a<=0,
  a^2 "if" 0<a<=1,
  1 "if" a>1 
).
$
Take derivative of $Pr(R <= a)$, we have 
$
f_R (a) = cases(
  0 "if" a<=0,
  2a "if" 0<a<=1,
  0 "if" a>1 
).
$
= Exercise 15
Answer: $0<=a<1$, $F_Y (a) = Pr(Y<=a) = Pr(F(X)<=a) = Pr(X <= F^(-1) (a)) = F(F^(-1) (a)) = a$.

For $a<0$, $F_Y (a) = 0$. For $a>=1$, $F_Y (a) = 1$.

We can know that $f_Y (a) = F_Y '(a) = cases(
  1 "if" 0<=a<1,
  0 "if" a<0 "or" a>=1
)$.

Since $U ~ "Uniform(0, 1)"$,
$F_X (a) = Pr(X<=a) = Pr(F^(-1)(U)<=a) = Pr(U <= F(a)) = F(a)$, thus $X ~ F$.

To generate Exponential distribution, we can use the probability integral transform.

Exponential distribution has CDF $F(a) = 1 - e^(-a/beta)$, so $a = -beta ln(1-F(a))$.
We have $F^(-1)(a) = -beta ln(1-a)$.

So for Uniform(0, 1) random variables X, we can use $-beta ln(1-X)$ to generates random variables from an Exponential distribution. 

= Exercise 16
Answer: We only need to prove that $Pr(X = x | X + Y = n) = vec(n, x)pi^x (1-pi)^(n-x)$.

Since $X ~ "Poisson"(lambda)$ and $Y ~ "Poisson"(mu)$, so $X + Y ~ "Poisson"(lambda + mu)$.

$
Pr(X = x | X+Y = n) &= Pr(X = x sect X+Y = n)/Pr(X +Y =n)\  
&= Pr(X = x sect Y = n-x)/Pr(X +Y =n)\
&= (Pr(X = x)Pr(Y = n-x))/Pr(X +Y =n)\
&= (lambda^x/x!e^(-lambda)mu^(n-x)/(n-x)!e^(-mu))/((lambda + mu)^n/n!e^(-lambda - mu))\
&= n!/(x!(n-x)!)(lambda^x mu^(n-x))/(lambda+mu)^n\  
&= vec(n, x)(lambda^x/(lambda+mu)^x)(mu^(n-x)/(lambda+mu)^(n-x))\  
&= vec(n, x)pi^x (1-pi)^(n-x).
$

= Problem 1
Answer: Notice that when $x>=1$, $a(x) = 0$, when $x<=1/3$, $a(x) = 1$.
We only need to consider the case when $1/3<x<1$.

First, we consider the case when $1/3<x<1/2$.

We fix point $A$ and consider the position of $B$ and $C$. We can consider the situation when all angles are less than $x pi$.
#image("2024-03-20-12-58-31.png", width: 15em)

If all angels ar less than $x pi$, $B$ must on arc $A D$ or arc $A E$. Let's first assume it's on arc $A D$.
We then draw $A F$ and $B G$, thus point $C$ must on arc $F G$.
$
a(x) = 1 - 2integral_(2x+t-1>=0) ^x (2x+t-1)d t = 1-(3x-1)^2. 
$

Then, we consider the case when $1/2<x<1$.
#image("2024-03-20-18-49-26.png", width: 15em)

WLOG, we just need to consider $angle B C A$ is obtuse, and multiply the result by 3.

First, we fix point $A$, then $B$ and $C$ must be in the same segment of arc. The relative position of $B$ and $C$ is uncertain and only one can have $angle B C A$ obtuse.
$
a(x) = 3 dot 2 (1-x)(1-x) dot 1/2 = 3(1-x)^2.
$
Therefore, 
$
a(x) = cases(
  1 "if" x<=1/3,
  1-(3x-1)^2 "if" 1/3<x<=1/2,
  3(1-x)^2 "if" 1/2<x<1,
  0 "if" x>=1
)
$
= Problem 2
Answer: 
(a)First, we donote $b_n$ be the number of ways to tiling a $3 times n + 1$ board like the image below.
#image("2024-03-20-14-31-59.png", width: 10em)
Then, we manage to get the recurrence relation of $a_n$ and $b_n$.
#image("2024-03-20-14-23-07.png")
From the image, we can see that 
$
a_n = a_(n-2) + 2(a_(n-2) + b_(n-3))\  
b_n = a_(n-1) + b_(n-2).
$
Therefore, $a_n - a_(n-2) = 3a_(n-2)+2b_(n-3) - 3a_(n-4) - 2b_(n-5) = 3a_(n-2) - 3a_(n-4) + 2a_(n-4) = 3a_(n-2) - a_(n-4)$.
$a_n = 4a_(n-2) - a_(n-4)$.
$
A(x) &= sum_(n="even") a_n x^n \  
&= sum_(n="even") (4a_(n-2)-a_(n-4)) x^n \  
&= 4x^2 sum_(n="even") a_n x^n - x^4 sum_(n="even") a_n x^n + 1-x^2\  
&= (4x^2 - x^4)A(x) +1-x^2
$
Hence we get $A(x) = (x^2-1)/(4x^2-x^4-1)$

(b)
For even n, $a_0 = 1$, $a_2 = 3$.

We let $t = x^2$, so $A(x) = (t-1)/(-t^2+4t-1)$.

The root of $-t^2+4t-1 = 0$ is $t_1=2+sqrt(3)$ and $t_2 = 2-sqrt(3)$.

$A(x) = -t/((t-t_1)(t-t_2))+1/((t-t_1)(t-t_2)) = 1/(t_1-t_2)(-t_1/(t-t_1)+t_2/(t-t_2))+1/(t_1-t_2)(1/(t-t_1)-1/(t-t_2))$

$t_1/(t-t_1) = -1/(1-t/t_1) = -(1+t/t_1+(t/t_1)^2+...)$,
$t_2/(t-t_2) = -1/(1-t/t_2) = -(1+t/t_2+(t/t_2)^2+...)$

$1/(t-t_1) = -1/t_1 1/(1-t/t_1) = -1/t_1(1+t/t_1+(t/t_1)^2+...)$,
$1/(t-t_2) = -1/t_2 1/(1-t/t_2) = -1/t_2(1+t/t_2+(t/t_2)^2+...)$

Therefore, the coefficient of $t^n$ is $1/(t_1-t_2)(1/t_1^n - 1/t_2^n)+1/(t_1-t_2)(1/t_2 1/t_2^n-1/t_1 1/t_1^n)$.

We know that $t= x^2$, $t^n= x^(2n)$, thus 
$
a_(2n) = 1/(2sqrt(3))(1/(2+sqrt(3))^n-1/(2-sqrt(3))^n)+1/(2sqrt(3))(1/(2-sqrt(3))^(n+1)-1/(2+sqrt(3))^(n+1))
$

To sum up, 
$
a_n = (3+sqrt(3))/6 (2+sqrt(3))^(n/2)+(3-sqrt(3))/6 (2-sqrt(3))^(n/2).
$

= Problem 3
Answer: (1) $tan(z) = (e^(i z) - e^(-i z))/(i(e^(i z) + e^(-i z))) = (e^(2i z) - 1)/(i(e^(2i z) + 1)) = 1/i (1-2/(e^(2i z) + 1))$.
Thus the singularities are $z_m$ that satisfy $1+e^(2i z_m) = 0$.
So when $z->z_m$,
$
1 + e^(2i z) = 1+ e^(2i(z-z_m))/e^(2i z_m) = 1-e^(2i(z-z_m)) = 1-(1+(2i(z-z_m))/1! + (2i(z-z_m))^2/2!+...).
$
We now know 
$
lim_(z->z_m)(z-z_m)tan z = lim_(z->z_m)(z-z_m)/i (1+2/(sum_(j>=1)(2i(z-z_k))^j)) = -1.
$
Thus the residues $r_m = -1$.

(2)
Since $tan(z) = 1/i (1-2/(e^(2i z) + 1))$. We only need to prove $1+2/abs(e^(2i z) + 1)<=10 arrow.l.r.double abs(e^(2i z) + 1)>=2/9$.

For $z = plus.minus m pi + i y$, $abs(e^(2i z) + 1) = abs(e^(-2y)+1)>1$. So $abs(tan(z))<1+2<10$, 

For $z = x plus.minus i m pi$,
$abs(e^(2i z)+1) >= abs(1-abs(e^(2i z))) >= min{1-e^(-2m pi), e^(2m pi) - 1} > 2/9$.

Therefore, $tan(z)<=10$ at all z on $Gamma_m$.

(3)
When $m < n-1$, the graph can't have spanning tree, so the number is 0.


We need to prove that the determinant of any cofactors of $L$ is 0.

Since $m < n-1$, the graph can't have connectivity. There has to be at least two separate parts. Therefore, we can swap columns of $L$ to get
$mat(L_1, O;
O, L_2)$. So for any $L'$, $L_1$ and $L_2$ at least one is complete. WLOG, we assume is $L_1$ is complete and $L_2$ turns to $L'_2$.
Since $L_1$ every rows and columns add up to 0, $det L_1 = 0$. Therefore, $det L' = det L_1 det L'_2 = 0$.


(4)
This is because $L_G$ every rows add up to 0, so $L_G$ has eigenvalue 0, which means $L_G$ kernel space is at least 1 dimension. Hence rank $<n$.
= Problem 4
Answer: (a) 
$A's$ singularities are $z_k$ that satisfy $lambda - e^z = 0$, so $z_k = ln lambda+2k pi i$. They are isolated singularities.

For any $z_k$, 
$
lim_(z->z_k)(z-z_k)1/(lambda - e^z) = lim_(z->z_k)(z-z_k)1/lambda(1 - e^(z-z_k)) = lim_(z->z_k)(z-z_k)1/lambda(-(z-z_k)-(z-z_k)^2/2!-...) = -1/lambda. 
$
Hence the residues  for all singularities are $-1/lambda$.

(b)
$
a_n &= -sum("residues of" A(z)/z^(n+1) "for" z=z_k)\  
&= -sum("residues of" 1/((lambda - e^z)z^(n+1)) "for" z = z_k)\  
&= 1/lambda sum 1/z_k^(n+1)\  
&= 1/lambda sum 1/(ln lambda+2k pi i)^(n+1)\
&= 1/lambda  1/(ln lambda)^(n+1) sum 1/(1+(2k pi i)/(ln lambda))^(n+1).
$
Let $g(n) = 1/lambda  1/(ln lambda)^(n+1)$,
$
lim_(n->infinity) a_n/g(n) = lim_(n->infinity) sum 1/(1+(2k pi i)/(ln lambda))^(n+1)\
= 1+lim_(n->infinity) sum_(k != 0) 1/(1+(2k pi i)/(ln lambda))^(n+1)
$
When k is large enough, $abs(1+(2k pi i)/(ln lambda)) = sqrt(1+4k^2 pi^2/(ln lambda))>sqrt(k)$, so when $k>t(t "is a large number")$,
$
abs(sum_(k > t) 1/(1+(2k pi i)/(ln lambda))^(n+1))<abs(sum_(k >t) 1/k^((n+1)/2))->0("when" n -> infinity). 
$
So $lim_(n->infinity) a_n/g(n) = 1+ lim_(n->infinity)( sum_(0<k<=t) 1/(1+(2k pi i)/(ln lambda))^(n+1)+sum_(k>t) 1/(1+(2k pi i)/(ln lambda))^(n+1)) = 1+0+0 = 1$.

(c)
Let $a_n = b_n/(2n)!$, then
$
b_n = sum_(k = 0) ^(n-1) b_k (2n)!/((2k)!(2(n-k))!)\  
arrow.l.r.double b_n/(2n)! = sum_(k = 0) ^(n-1) b_k/(2k)! 1/(2(n-k))!\  
arrow.l.r.double a_n = sum_(k = 0) ^(n-1) a_k 1/(2(n-k))!.
$
Let $f(x) = sum_(i >= 0) a_i x^(2i)$, then $f(x) = 1 + sum_(i >=1) sum_(k= 1)^i a_(i-k)/(2k)! x^(2i) = 1+sum_(i>=1) x^(2i)/(2i)! f(x)$.
$
f(x) = 1/(1-sum_(i>=1) x^(2i)/(2i)!) = 2/(4-e^x-e^(-x)) = (2e^x)/(-e^(2x)+4e^x -1) = -((2sqrt(3)+3)/3)/(e^x-(2+sqrt(3))) + ((2sqrt(3)-3)/3)/(e^x-(2-sqrt(3))).
$
Therefore from (b), we know that
$
h(n) &= (2n)!(((2sqrt(3)+3)/3)/((2+sqrt(3))(ln (2+sqrt(3)))^(2n+1)) - ((2sqrt(3)-3)/3)/((2-sqrt(3))(ln(2-sqrt(3)))^(2n+1)))\  
&= (2n)!/sqrt(3)(1/(ln (2+sqrt(3)))^(2n+1) - 1/(ln(2-sqrt(3)))^(2n+1))\  
&= (2(2n)!)/(sqrt(3)(ln (2+sqrt(3)))^(2n+1)).
$
= Problem 5
Answer: We can consider the _Schur decomposition_ of $A$, $A = Q U Q^(-1)$, where $U = mat(
  lambda_1, *, ..., *;
  0, lambda_2, ..., *;
  dots.v, dots.v, dots.down, dots.v;
  0, 0, ..., lambda_n;
)$ with $A$'s eigenvalues $lambda_1, lambda_2, ..., lambda_n$ on it's diagonal.

Then, we let $A'_t = Q U_t Q^(-1)$ where $U_t = mat(
  lambda_1+1/t, *, ..., *;
  0, lambda_2+2/t, ..., *;
  dots.v, dots.v, dots.down, dots.v;
  0, 0, ..., lambda_n+n/t;
)$. So we have $lim_(t->infinity) A'_t= A$, now we only need to prove $A'_t $ is invertible starting from $t'$. Then we let $A_1 = A'_t$ and we'll get a invertible sequence of matrices $A_i$ with $lim_(i->infinity) A_i = A$.

Let g be the smallest non-zero gap between eigenvalues of $A$ and between non-zero eigenvalues of $A$ and zero.

Now we can prove a stronger result. We claim that for all $t>(2n)/g$, $A'_t$ is invertible and has distinct eigenvalues.

We only need to prove that eigenvalues of $A_t$ are distinct and non-zero.

For any $i eq.not j$, if $lambda_i = lambda_j$, then $lambda_i +i/t eq.not lambda_j + j/t$. 
If $lambda_i eq.not lambda_j$, then
$
abs((lambda_i + i/t) - (lambda_j + j/t)) >= abs(lambda_i - lambda_j) - abs(i/t) - abs(j/t) > g - 2n/t>0.
$
So we have $lambda_i + i/t eq.not lambda_j + j/t$ as well.

For any $i$, if $lambda_i = 0$, then $lambda_i + i/t >0$. If $lambda_i eq.not 0$ we also have
$
abs(lambda_i + i/t-0) = abs(lambda_i + i/t) > abs(lambda_i) - abs(i/t)>g-n/t>0.
$
So we have $lambda_i + i/t eq.not 0$ as well.

Therefore, $A'_t$ is invertible and has distinct eigenvalues when $t>(2n)/g$.

= Problem 6
Answer: (a)Notice that
$
mat(
  I_n, B;
  A, I_m;
)= 
mat(
  I_n, B;
  O, I_m;
)
mat(
  I_n-B A, O;
  O, I_m;
)
mat(
  I_n, O;
  A, I_m;
)
$
$
mat(
  I_n, B;
  A, I_m;
)= 
mat(
  I_n, O;
  A, I_m;
)
mat(
  I_n, O;
  O, I_m - A B;
)
mat(
  I_n, B;
  O, I_m;
)
$
Therefore, $det mat( I_n, B;A, I_m;) = det(I_n-B A) = det(I_m - A B)$.

Replace $A$ by $-A$ and we have _Sylvester's determinant identity_.

(b)

$x^m det(x I_n+B A) = x^n det(x I_m + A B)$.
WLOG, we assume $m<=n$.

We compare the coefficient of $x^n$ on both sides, we have 
$
sum_(abs(S) = m) det((B A)_(S,S))= det(0 I_m +A B) = det(A B).
$
LHS is 
$
sum_(abs(S) = m)det((B A)_(S, S)) = sum_(abs(S) = m)det(B_(S, {1,2,...,m}))det(A_({1,2,...,m}, S)) = sum_(abs(S) = m)det(A_S)det(B_S).
$
Therefore, we have $det(A B) = sum_(abs(S) = m)det(A_S)det(B_S)$, which is _Cauchy-Binet Formula_.
= Problem 7
Answer: WLOG, we assume $A'$ is $A$ without the first row.

We only consider the determinant of $A^((1))_S$.

If ${e_k|k in S}$ doesn't form a spanning tree, then it must contain a cycle path.

Consider the edges $f_1, f_2, ..., f_k$ which form a cycle, we prove that their corresponding columns are dependent.

We assign a indicator $t_1, t_2, ..., t_k$ to $f_1, f_2, ..., f_k$. If $f_i$ is in the  same direction as counterclockwise, then $f_i = 1$, else $f_i = -1$.

Thus we know that $sum_(i = 1)^k t_i f_i = 0$ since all points on the cycle has an edge in and an edge out.

Hence $det A^((1))_S = 0$.

If ${e_k|k in S}$ forms a spanning tree, then we use the property that every trees have at least two leaves.

Even if we had removed the first row, there's must exist a leaf.

Let's assume the leaf is $v_r$, with edge $f_u$ connecting to it. Then we know that row $r-1$(since we remove the first row) only have one non-zero element(1 or -1) on their intersection.

Therefore, we cancel row $r-1$ and column $u$ to get $A^((1)((r-1)(u)))_S$ and it's determinant is $plus.minus det A^((1))_S$.

We can cancel leaf and its related edge multiple times like above, and we can get $det A^((1))_S = plus.minus 1$, $abs(det A^((1))_S) = 1$.

Thus we prove the lemma.

= Problem 8
Answer: The Laplacian matrix of $K_n$ is  
$ 
L = mat(
  n-1, -1, ..., -1;
  -1, n-1, ..., -1;
  dots.v, dots.v, dots.down, dots.v;
  -1, -1, ..., n-1;
).
$
We only need to calculate determinant of $L^i = mat(
  n-1, -1, ..., -1;
  -1, n-1, ..., -1;
  dots.v, dots.v, dots.down, dots.v;
  -1, -1, ..., n-1;
)$, which is a $n-1$ by $n-1$ matrix.

Notice that $L_i-n I = mat(
  -1, -1, ..., -1;
  -1, -1, ..., -1;
  dots.v, dots.v, dots.down, dots.v;
  -1, -1, ..., -1;
)$, has rank $n-2$, thus it has at least $n-2$ eigenvalues 0.

$"Trace"(L_i - n I) = 1-n$, so the remaining eigenvalue is $1-n$.

Therefore, $L_i$ has $n-1$ eigenvalues, $n-2$ of them are $0+n = n$ and 1 of them is $1-n+n = 1$.

Thus $det L_i = n^(n-2)$.

*Acknowledgement*: Ruitao Liu, Wikipedia, MIT Lecture Notes, Yilong Yang's Lecture Notes