#import "@preview/ilm:1.1.1": *
#import "quick-maths.typ": shorthands
#import "@preview/physica:0.9.3": *

#show: shorthands.with(
  ($+-$, $plus.minus$),
  ($>=$, sym.gt.eq.slant),
  ($<=$, sym.lt.eq.slant),
  ($VV$, "Var")
)

#set text(lang: "en")

#show: ilm.with(
  title: [Data Science],
  author: "Leo",
  date: datetime(year: 2024, month: 05, day: 14),
  abstract: [
    Mainly some useful facts without proof.
  ],
  preface: [
    #align(center + horizon)[
      This note is made possible \ by Hopcroft and Sven-Ake Wegner books.
    ]
  ],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

= High-Dimensional Space
$lambda^d$ denotes the d-dimensional Lebesgue measure on $RR^d$.

We say that $X$ is uniformly distributed on $B in RR^d$ if
$
Pr(X in A) = frac(lambda^d lr((A sect B)), lambda^d lr((B)))
$
holds for every Borel set $A in RR^d$. We write $X tilde U(B)$ in this case.

We say that $X$ is (spherically) Gaussian distributed with mean zero and variance $sigma > 0$, if
$
Pr lr((X in A)) eq 1 / lr((2 pi sigma^2))^(d slash 2) integral_A exp(- norm(x)^2/(2 sigma^2)) "d" lambda^d (x)
$
holds for every Borel set $A in RR^d$. We write $X tilde N(0, sigma^2, RR^d)$ in this case. Note that $X = (X_1, ..., X_d) tilde N(0, sigma^2, RR^d)$ holds iff $X_i tilde N(0, sigma^2, RR^1)$ holds for all $i = 1, ..., d$.
== The curse of high dimensions
#image("2024-05-15-09-41-39.png")

== Volume and Surface
_Surface Concentration Theorem_: The vast majority of the volume lies near the boundary of the hypersphere.
$
"volume"((1-epsilon)A)/"volume"(A) = (1-epsilon)^d<=e^(-epsilon d).
$
=== Volume and Surface of the Unit Ball
The surface area $A(d)$ and the volume $V(d)$ of a unit-radius ball in d-dimensions are given by
$
A(d) = (2 pi^(d/2))/Gamma(d/2) "and" V(d) = (2 pi^(d/2))/(d Gamma(d/2)).
$
$
V_n lr((R)) eq cases(delim: "{", 1 & upright(i f) n eq 0 comma, 2 R & upright(i f) n eq 1 comma, frac(2 pi, n) R^2 times V_(n minus 2) lr((R)) & upright(o t h e r w i s e) dot.basic)
$
Gamma function $Gamma(x) = integral_0^infinity t^(x-1)e^(-t) "dt"$ have some properties:
- For positive $x$, $Gamma(x+1) = x Gamma(x)$
- $Gamma(1/2) = sqrt(pi)$
- For positive integer $x$, $Gamma(x) = (x-1)!$
- For non-negative integer $x$, $Gamma(1/2 + x) = (2x-1)!!/2^x sqrt(pi)$ and $Gamma(1/2 - x) = (-2)^x/((2x - 1)!!)sqrt(pi)$
The volume of the unit ball reaches its maximum at $d = 5$.

If $d = 2k$, then $V(d) = (2 pi^(d/2))/(d (k-1)!) = (2 pi^(d/2))/(d (d/2-1)!) = (pi^(d/2))/((d/2)!)$.
If $d = 2k+1$, then $V(d) = (2 pi^(d/2))/(d (Gamma((2k+1)/2))) = (pi^(d/2))/((2k+1)/2 ((2k-1)/2 !))=(pi^(d/2))/(d/2)!$.

$lim_(d->infinity)V(d) = 0$.
=== Volume near the equator
*Defination* (Arbitrary “North Pole” and “equator”) Pick a vector on the hypersphere arbitrarily, call it the North Pole. Then the intersection of the hyperplane that is perpendicular to it and the hypersphere
is called the equator.

As d grows to infinity, almost all volume are near the equator.
#image("2024-05-14-21-52-57.png")
_Waist Concentration Theorem_: Let $d>=3$ and $epsilon>0$. Then we have
$
(lambda^d (W_epsilon))/(lambda^d (overline(upright(B))_1(0)))>= 1-2/(epsilon sqrt(d-1))exp(-(epsilon^2(d-1))/2)
$
$
frac(lambda^d lr((brace.l lr((x_1 comma dots.h comma x_d)) in overline(upright(B))_1 lr((0)) semi lr(|x_1|) gt epsilon brace.r)), lambda^d lr((overline(upright(B))_1 lr((0))))) lt.eq frac(2, epsilon sqrt(d minus 1)) exp lr((minus frac(epsilon^2 lr((d minus 1)), 2)))
$
where $W_epsilon = {(x_1, ..., x_d) in overline(upright(B))_1(0); abs(x_1)<=epsilon}$.

Proof: Bound $integral_(c/sqrt(d-1))^1 (1-x_1^2)^((d-1)/2)V(d-1)dd(x)$ and $integral_0^1 (1-x_1^2)^((d-1)/2)V(d-1)dd(x)$.

Let $epsilon = c/sqrt(d-1)$ and we can know that:
For $c>0$ and $d>=3$, at least a $1-2/c e^(-c^2/2)$ fraction of the volume of the d-dimensional unit ball has $abs(x_1)<=c/sqrt(d-1)$.


Let $d >= 3$ and assume that we draw $n >= 2$ points $x^((1)), ..., x^((n))$ at
random from the d-dimensional unit ball. Then
1. $Pr(norm(x^((i)))>=1-(2ln n)/d "for all" i)>=1-1/n$, and
2. $Pr(abs(iprod(x^((i)), x^((j))))<= sqrt((6 ln n)/(d-1)) "for all" i!= j)>= 1-1/n$.
=== The High-Dimensional Unit Cube
A point picked at random in a unit cube will be within distance $t$ of the equator defined by $H = {x|sum_(i = 1)^d x_i = d/2}$ with probability at least $1-1/(4t^2)$.
== Gaussians in High Dimension
If $X, Y tilde N(0, 1, RR^d)$ and $xi in RR^d$ be a constant, then $forall d>=1$
1. $E(norm(X)^2) = d$
2. $"Var"(norm(X)^2) = 2d$
3. $abs(E(norm(X) - sqrt(d)))<= 1/sqrt(d)$
4. $"Var"(norm(X))<=2$
5. $E(norm(X-Y)^2) = 2d$
6. $abs(E(norm(X-Y) - sqrt(2d)))<= 1/sqrt(2d)$
7. $"Var"(norm(X-Y))<=3$
8. $E(angle.l X, Y angle.r) = 0$ and $"Var"(angle.l X, Y angle.r) = d$
9. $E(angle.l X, xi angle.r) = 0$ and $"Var"(angle.l X, xi angle.r) = norm(xi)^2$
10. $E(|angle.l X, xi angle.r|) = sqrt(2/pi)$
_Gaussian Annulus Theorem_: Let $x in RR^d$ be drawn at random with respect to the spherical Gaussian distribution with zero mean and unit variance.
Then 
$
Pr(abs(abs(x) - sqrt(d))>=epsilon)<=2 e^(-c epsilon^2). 
$
holds for every $0 <= epsilon <= sqrt(d)$ where $c = 1/16$.

_Proof_: Let a random vector $X tilde.op cal(N) lr((0 , 1))$ be given and let $X_1,dots.h,X_d$ denote its coordinate functions. We have $X_i tilde.op cal(N) lr((0 , 1))$ for every $i = 1 , dots.h , d$. We define $Y_i := frac(X_i^2 - 1, 2)$ and see that $ Pr lr([norm(X) - sqrt(d) gt.eq epsilon]) & lt.eq Pr lr(
  [abs(norm(X) - sqrt(d)) dot.op lr((norm(X) + sqrt(d))) > epsilon dot.op sqrt(d)]
)\
& = Pr lr([abs(X_1^2 + dots.h.c + X_d^2 - d) > epsilon sqrt(d)])\
& = Pr lr([abs(lr((X_1^2 - 1)) + dots.h.c + lr((X_d^2 - 1))) > epsilon sqrt(d)])\
& = Pr[abs(frac(X_1^2 - 1, 2) + dots.h.c + frac(X_d^2 - 1, 2)) > frac(epsilon sqrt(d), 2)]
\                                       
& = Pr lr([abs(Y_1 + dots.h.c + Y_d) > frac(epsilon sqrt(d), 2)]) $ where we used $norm(X) + sqrt(d) gt.eq sqrt(d)$ for the inequality. Since we have $bb(E) lr((X_i)) = 0$ and $upright(V a r) lr((X_i)) = 1$ we get $ bb(E) lr((Y_i)) & = bb(E) lr((frac(X_i^2 - 1, 2))) = 1 / 2 lr((bb(E) lr((X_i^2)) - 1)) = 0 $ for every $i = 1 , dots.h , d$. We now estimate for $k gt.eq 2$ the $k$-th moment of $Y_i$. For this we firstly note that $ lr(|X_i^2 lr((omega)) - 1|)^k lt.eq X_i^(2 k) lr((omega)) + 1 $ holds for every $omega in Omega$. Indeed, if $lr(|X_i lr((omega))|) lt.eq 1$, then $0 lt.eq X_i^2 lr((omega)) lt.eq 1$ and thus $lr(|X_i^2 lr((omega)) - 1|)^k = lr((1 - X_i^2 lr((omega))))^k lt.eq 1$. If otherwise $lr(|X_i lr((omega))|) > 1$, then $X_i^2 lr((omega)) - 1 > 0$ and therefore $lr(|X_i^2 lr((omega)) - 1|)^k = lr((X_i^2 lr((omega)) - 1))^k lt.eq X_i^(2 k) lr((omega))$. We employ the above and estimate $ lr(|bb(E) lr((Y_i^k))|) & = lr(|bb(E) lr((lr((frac(X_i^2 - 1, 2)))^k))|) = 1 / 2^k lr(|bb(E) lr((lr((X_i^2 - 1))^k))|)\
& lt.eq 1 / 2^k integral_Omega lr(|X_i^2 - 1|)^k dd(P) lt.eq 1 / 2^k integral_Omega (X_i^(2 k) + 1) dd(P) = 1 / 2^k lr((bb(E) lr((X_i^(2 k))) + 1))\
& = 1 / 2^k lr(
(1 / sqrt(2 pi) integral_(bb(R)) t^(2 k) exp lr((- t^2 \/ 2)) thin d t + 1)
) = 1 / 2^k lr((frac(lr((2 k)) !, 2^k k !) + 1))  \
&= frac(
  lr((2 k - 1)) lr((2 k - 2)) dots.h.c 5 dot.op 3 dot.op 1,
  lr((2 k)) lr((2 k - 2)) dots.h.c 6 dot.op 4 dot.op 2,
) dot.op k ! + 1 / 2^k \
&<= 1 dot.op 1 dots.h.c 1 dot.op 3 / 4 dot.op 1/2 dot k! + (k!)/(4 dot 2) \ 
&= frac(k !, 2). $
We make use of Bernstein’s inequality:
$upright(P) [lr(|Y_1 plus dots.h.c plus Y_d|) gt.eq a ] lt.eq 2 exp(minus C min  (a^2 / d comma a)).$
with $a := (epsilon sqrt(d))/2>0$ to continue our estimate. Since $sqrt(d) >=epsilon$ holds, we get
$
upright(P) lr([lr(|norm(x) minus sqrt(d)|) gt.eq epsilon]) & lt.eq upright(P) lr([lr(|Y_1 plus dots.h.c plus Y_d|) gt.eq frac(epsilon sqrt(d), 2)])\
 & lt.eq 2 exp lr((minus C min lr((lr((epsilon sqrt(d) slash 2))^2 / d comma frac(epsilon sqrt(d), 2)))))\
 & lt.eq 2 exp lr((minus C min lr((epsilon^2 / 4 comma epsilon^2 / 2))))\
 & eq 2 exp lr((minus C epsilon^2 / 4)) dot.basic
$
Finally, we recall that the constant $C = 1/4$ and thus the exponent equals $-c epsilon^2$ with $c = 1/16$.

*Proposition*: Let $x in RR^d$ be drawn at random with respect to the spherical Gaussian distribution with zero mean and unit variance.
Then 
$
Pr(abs(norm(x)^2 - d)>=epsilon)<=2 e^(-c min(epsilon^2/(2d), epsilon)). 
$
holds for every $0 < epsilon$ where $c = 1/8$.

_Proof_:
We define the random variables $Y_i$ as in the proof of Last Theorem and then
proceed using the Bernstein inequality as in the last part of the previous proof. This
way we obtain
$
upright(P) lr([lr(norm(X)^2 minus d|) gt.eq epsilon]) eq upright(P) lr([lr(|Y_1 plus dots.h.c plus Y_d|) gt.eq epsilon / 2]) lt.eq 2 exp lr((minus C min lr((frac(epsilon^2, 4 d) comma epsilon / 2))))
$
which leads to the claimed inequality taking $C = 1/4$ into account.

Let $x, y in RR^d$ be drawn at random with respect to the spherical Gaussian distribution with zero mean and unit variance.
Then for every $epsilon >0$ and for all $d>=1$ the estimate
$
Pr(abs(iprod(x/norm(x), y/norm(y)))>=epsilon)<= (2/epsilon + 7)/sqrt(d)
$
holds.

Let $X tilde N(0, 1, RR^d)$ and $0!=xi in RR^d$ be fixed. Then we have 
$
upright("P") mat(delim: "(", lr(|angle.l X comma xi angle.r|) gt.eq epsilon) lt.eq 4 / sqrt(2 pi) frac(norm(xi), epsilon sqrt(d))
$
for every $epsilon > 0$.

Let $x, y in RR^d$ be drawn at random with respect to the spherical Gaussian distribution with zero mean and unit variance.
Then for every $epsilon >0$ and for all $d>=1$ we have
$
Pr(abs(iprod(x/norm(x), y/norm(y)))<=epsilon/(2 sqrt(d)))<= epsilon + 2 exp(-c d)
$
where $c = 1/16$.

Combining the last two results we can think of the scalar products for a fixed high
dimension $d$, with high probability, to be small numbers which are however bounded
away from zero.

Let $x, y in RR^d$ be drawn at random with respect to the spherical Gaussian distribution with zero mean and unit variance. Then we have the following.
1. $forall epsilon>18, exists d_0 in NN,  forall d>=d_0: Pr(abs(norm(x-y)- sqrt(2d))>=epsilon)<=18/epsilon$.
2. $forall epsilon>18, d>=epsilon^2: Pr(abs(norm(x-y)- sqrt(2d))>=epsilon)<=18/epsilon + 8/sqrt(d)$.
3. $forall epsilon>18, d>=epsilon^2: Pr(abs(norm(x-y)^2- 2d)>=epsilon sqrt(2d))<=18/epsilon + 8/sqrt(d)$.
== Random projection and Johnson-Lindenstrauss Lemma
_Random Projection Theorem_: Let $U in RR^(k times d)$ be a random matrix with $U tilde N(0, 1)$. Then for every $x in RR^d backslash{0}$ and every $0<epsilon<1$ we have
$
Pr(abs(norm(U x) - sqrt(k) norm(x))>=epsilon sqrt(k) norm(x))<=2 e^(-c k epsilon^2)
$ 
where $c = 1/16$.

_Johnson-Lindenstrauss Lemma_: Let $0<epsilon<1$ and $n>=1$ and let $k>=48/epsilon^2 ln n$. Let $U tilde N(0, 1, RR^(k times d))$ be a random matrix. Then we have
$
Pr((1-epsilon)sqrt(k)norm(x_i - x_j)<= norm(U x_i - U x_j)<= (1+epsilon)sqrt(k)norm(x_i - x_j) "for all" i, j)>=1-1/n
$
== Separating Gaussian data
Let $mu_1, mu_2 in RR^d$ and $Delta := norm(mu_1 - mu_2)$. Let $X_1 tilde N(mu_1, 1, RR^d)$ and $X_2 tilde N(mu_2, 1, RR^d)$ be random vectors.
1. $forall d gt.eq 1 colon lr(|"E" lr((norm(X_1 - X_2)minus sqrt(Delta^2 plus 2 d)))|) lt.eq frac(3 d plus 8 Delta^2 plus sqrt(24) Delta d^(1 slash 2), 2 lr((Delta^2 plus 2 d))^(3 slash 2)) $.
2. $forall d gt.eq 1 colon "Var"(norm(X_1 - X_2)) lt.eq (frac(3 d plus 8 Delta^2 plus sqrt(24) Delta d^(1 slash 2), 2 lr((Delta^2 plus 2 d))^(3 slash 2)))^2 + frac(3 d plus 8 Delta^2 plus sqrt(24) Delta d^(1 slash 2),  Delta^2 plus 2 d) $.
3. $Pr(abs(norm(X_1 - X_2) - sqrt(Delta^2 + 2d))>=epsilon)<=54/epsilon + 8/sqrt(d)+ 20/(epsilon sqrt(d))$ holds for $epsilon>54$ and $d>=epsilon^2/9$.


_Separation Theorem_: Let $mu_1, mu_2 in RR^d$ and put $Delta := norm(mu_1 - mu_2)$. Let $epsilon_1>18$ and $epsilon_2>54$ be constant and assume that there is $d_0 >=1$ such that $sqrt(Delta^2 + 2d)- sqrt(2d)>epsilon_1 + epsilon_2$ holds for $d>=d_0$.
Let $X_i tilde N(mu_i 1, RR^d)$ and $S_i := {x_i^((1)), ..., x_i^((n))}$ be samples of $X_i$ for $i = 1, 2$ such that $S_1 sect S_2 = nothing$.
Let $x, y in S_1 union S_2$. Then
$
lim_(d arrow.r oo) inf upright("P") mat(delim: "(", x comma y upright("come from same Gaussian") lr(|parallel x minus y parallel minus sqrt(2 d)|) lt epsilon_1) gt.eq frac(1 minus 18 slash epsilon_1, 1 plus 54 slash epsilon_2)
$
holds.
= Random walks and Markov chains
== Markov chains basics
A *Markov chain* is a process which moves among the elements of a set $Omega$ ($Omega$ is a set of possibly infinite states $x_1, x_2, ...$) in the following manner: when at $x_t in Omega$, the next position $x_(t+1)$ is chosen according to a fixed probability distribution $P(x_t, ·)$ depending only on $x_t$. What we said in the last sentence is
essentially the *Markovian Property*, which we can write down formally:

_Markovian Property_: 
$
Pr(x_t = y|x_1, x_2, ..., x_(t-1)) = Pr(x_t = y|x_(t-1)).
$
We can use the following notation: $P(x, y):= Pr(x_(t+1) = y|x_t = x)$. The numbers $P(x, y)$ are called the *transition probabilities* of the chain. We denote $mu_t$ as the probability distribution over $Omega$ after $t$ transitions and $mu_t$ is a row vector. We have $mu_(t+1) = mu_t P$. Thus we also have $mu_t = mu_0 P^t$.

A *Random Walk* on a graph $G=(V, E)$ is a sequence $s_1, s_2, ..., s_t$ for which $s_(i+1) in N(s_i)$ where $N(v)$ is the neighborhood of $v$. Note that the transition matrix of a graph is going to have 
$
P(x, y) = 1/d_x
$
where $d_x$ is the degree of vertex $x$.

The transition matrix of any Markov Chain is *stochastic*, i.e. the entries in every row add up to 1. A
transition matrix is *doubly stochastic* if the rows and the columns add to 1.

A *stationary distribution $pi^*$* has the following property:
$
forall x, pi^*(x) = sum_y pi^*(y) P(y, x).
$or even better:
$
pi^* = pi^* P
$

The *period* of a state $i$ is the greatest common divisor of the set ${ n in NN: p(i ,i) > 0}$. If every state has period 1 then the Markov chain (or its transition probability matrix) is called
*aperiodic*.

A Markov Chain is *irreducible* if:
$
forall x, y, exists t = t(x, y): P^(t')(x, y) >0, forall t' > t
$which means that all states communicate with each other.

A Markov Chain is *ergodic* if:
$
exists t^*: forall t>t^*, Pr(x, y) >0, forall x, y
$
If a Markov Chain is ergodic then it is going to have a unique stationary distribution no
matter what the initial distribution was.

If a finite Markov Chain is irreducible then it has a unique stationary distribution.

Suppose a probability distribution $pi$ on $Omega$ satisfies 
$
pi(x)P(x, y) = pi(y)P(y, x) "for all" x, y in Omega.
$
This equation is called the *detailed balance equations*.

Let $P$ be the transition matrix of a Markov chain with state space $Omega$. Any distribution $pi$ satisfying the detailed balance equations is stationary for $P$.


The *time reversal* of an irreducible Markov chain with transition matrix $P$ and stationary distribution $pi$ is the chain with matrix
$
hat(P)(x, y):= (pi(y)P(y, x))/(pi(x))
$
If a chain with transition matrix $P$ is reversible, then $hat(P) = P$.

We define *Hitting time* of $x$ to $y$ as:
$
h_(x, y):= E(\# italic("steps to go from x to y"))
$
For $x = y$, we call this *recurrence times* and $h_(x, x) = 1/(pi^*(x))$.

We define the *cover time* of a vertex $v$ of a graph $G$ as follows:
$
C_v(G) = E(\# italic("steps to visit all vertices when we start at v"))
$
We define the cover time of a graph $G$ as:
$
C(G) = max_(v in G) C_v (G)
$
We define *commute time* from $x$ to $y$ the expected number of steps it takes to go from $x$ to $y$ and back to $x$.
$
C_(x, y) = E(\# italic("of steps to go from x to y and back to x")) = h_(x, y) + h_(y, x)
$
== Markov Chain Monte Carlo
Use Markov chain to sample from a given probability distribution is called *Markov
chain Monte Carlo*.
=== Metropolis-Hasting algorithm
Symmetric base chain. Suppose that $Psi$ is a symmetric transition matrix. In this case, $Psi$ is reversible with respect to the uniform distribution on $Omega$.

The *Metropolis chain* for a probability $pi$ and a symmetric transition matrix $Psi$ is defined as 
$
P lr((x comma y)) eq cases(
  delim: "{", 
  Psi lr((x comma y)) lr([pi(y)/pi(x) and 1]) & upright("if") y eq.not x comma,
  1 minus sum_(z colon z eq.not x) Psi lr((x comma z)) [pi(z)/pi(x) and 1] & upright("if") y eq x dot.basic)
$
*General base chain*. The Metropolis chain can also be defined when
the initial transition matrix is not symmetric.
$
P lr((x comma y)) eq cases(delim: "{", Psi lr((x comma y)) lr([frac(pi lr((y)) Psi lr((y comma x)), pi lr((x)) Psi lr((x comma y))) and 1]) & upright("if") y eq.not x comma, 1 minus sum_(z colon z eq.not x) Psi lr((x comma z)) lr([frac(pi lr((z)) Psi lr((z comma x)), pi lr((x)) Psi lr((x comma z))) and 1]) & upright("if") y eq x dot.basic)
$
=== Gibbs Sampling
State spaces are contained in a set of the form $S^V$, where $V$ is the vertex set of a graph and $S$ is a finite set. The elements of $S^V$, called *configurations*, are the functions from $V$ to $S$.

The *Gibbs Sampling* is a Markov chain with probability distribution
$
P(x, y) = cases(delim: "{", 
  1/d pi(y)/(sum_(z: z~_j x)pi(z)) & upright("if") y~_j x,
  0 & upright("otherwise")
)
$
where $x~_j y "if" x_i = y_i "for all" i != j$.
= Some useful inequality
== Markov's inequality
For $a>0$, we have $Pr(x>=a)<=E[x]/a$.
== Chebyshev's inequality
For $a>0$, we have $Pr(abs(x - E(x))>=c) <= "Var"(x)/c^2$.
== Law of Large Numbers
Let $x_1, x_2, ... , x_n$ be $n$ independent samples of a random variable $x$. Then
$
Pr(abs((x_1 + x_2 + ... + x_n)/n - E(x)) >= a) <= "Var"(x)/(n a^2).
$
== Master Tail Bounds Theorem
Let $x = x_1+x_2+ ... +x_n$ be $n$ mutually independent random variables with zero mean and variance at most $sigma^2$. Let $0<=a<=sqrt(2)n sigma^2$ and $a^2/(4n sigma^2)<=s<= (n sigma^2)/2$ is a positive even integer and $abs(E(x_i^r))<= sigma^2 r!$ for $r = 3, 4, ..., s$. Then
$
Pr(abs(x)>=a)<=3 e^(-a^2/(12n sigma^2)).
$
