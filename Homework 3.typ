#import "template.typ": *
#import "@preview/cetz:0.2.1"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Mathematics for Computer Science: Homework 3",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)


= Exercise 12
Answer:
Let A be the event that the chosen card side is green. Let B be the event that the both side of the chosen card is green. 



We are going to calculate $Pr(B|A)$,
$
Pr(B|A) = Pr(A sect B)/Pr(A).
$
Since there are 3 green sides in total 6 sides, the probability of A is $Pr(A) = 3/6 = 1/2$.And only 1 card have green on both sides, so the probability of B is $Pr(B) = Pr(A and B) =  1/3$.

Hence, 
$
Pr(B|A) = (1/3)/(1/2) = 2/3.
$

= Exercise 18
Answer: Since $A_i$ are disjoint and $union.big_(i = 1) ^k A_i = Omega$, from the law of total probability, we have
$
sum_(i = 1) ^k Pr(A_i|B) = sum_(i = 1) ^k Pr(A_i sect B)/Pr(B) = Pr(B)/Pr(B) = 1.
$
We already known that $Pr(A_1|B) < Pr(A_1)$, if $Pr(A_i|B) <= Pr(A_i)$ for all $i = 2, 3,...,k$, then
$
sum_(i = 1) ^k Pr(A_i|B) < sum_(i = 1) ^k Pr(A_i) = 1,
$
which is contradiction. Hence, there must exist $i in {2, 3,...,k}$ such that $Pr(A_i|B) >= Pr(A_i)$.

= Exercise 20
Answer: (a)
$Pr(C_i|H) = Pr(C_i sect H)/Pr(H) = (1/5p_i)/(1/5sum_(i = 1) ^5 p_i) = (2p_i)/5$.
Thus,
$
Pr(C_i|H) = cases(
  0 "if" i = 1, 
  1/10 "if" i = 2,
  1/5 "if" i = 3,
  3/10 "if" i = 4,
  2/5 "if" i = 5,
). 
$
(b)We know that $Pr(H_1) = 1/5sum_(i = 1) ^5 p_i = 1/2$, and
$
Pr(H_2 sect H_1) = 1/5 sum_(i = 1) ^5 p_i^2 = 3/8
$
Therefore $Pr(H_2|H_1) = Pr(H_2 sect H_1)/Pr(H_1) = 3/4$.

(c)
$Pr(C_i|B_4) = Pr(C_i sect B_4)/Pr(B_4)$.

$Pr(C_i sect B_4) = (1-p_i)^3p_i$ and 
$Pr(B_4) = 1/5 sum_(i = 1) ^5 (1-p_i)^3p_i = 69/320$.

Therefore, 
$
Pr(C_i|B_4) = cases(
  0 "if" i = 1, 
  27/46 "if" i = 2,
  8/23 "if" i = 3,
  3/46 "if" i = 4,
  0 "if" i = 5,
).
$.

= Problem 1
Answer: 
Let $(x, y)$ be the coordinate of the center of the needle, $theta in (-pi/2, pi/2)$ be the angle of the needle and x-axis. From the graph below we can see that the needle has intersection with x-axis when $l/2sin(theta)>=y$. Similarly we kown the needle has intersection with y-axis when $l/2cos(theta) >= x$.
#set align(center)
#cetz.canvas({
  import cetz.draw: *
  rect((0.3,0.3),(3,4))
  content((0,0), [(0,0)])
  content((0,4.3), [(0,b)])
  content((3.3,0), [(a,0)])
  content((3.3,4.3), [(a,b)])
  line((1,0.9),(2,0))
  content((2.25,0.1),[$theta$])
  line((1,0.9),(1,0.3), stroke: (dash:"dashed"))
  circle((1.5,0.45),radius: 0.05, fill: black)
  content((1.9,0.8),[(x,y)]) 
})
#set align(left)
Consider the upper and right edge of the rectangle,
for a given $theta$, the area of the region that the needle intersects with x-axis or y-axis is  $2 dot (abs(l/2sin(theta)a) + abs(l/2cos(theta) b)) = a l abs(sin(theta)) + b l cos(theta)$.

But we count the area of the region that the needle intersects with two edges twice, so we have to get rid of that.

As for the situation that the needle intersects with both x-axis and y-axis, we have $l/2sin(theta)>=y$ and $l/2cos(theta) >= x$. Since  there are total four corners, thus the area is $4 dot abs(l/2sin(theta)dot l/2cos(theta)) = l^2/2abs(sin(2theta))$.

Therefore, the area of the region that the needle intersects with the rectangle is $a l abs(sin(theta)) + b l cos(theta) - l^2/2abs(sin(2theta))$.

We then calculate the volume of the domain representing needle has intersection with the rectangle, which is
$
integral_(-pi/2) ^(pi/2) (a l abs(sin(theta)) + b l cos(theta) - l^2/2abs(sin(2theta)))d theta = 2a l + 2b l - l^2.
$
The volume of the entire domain is $pi a b$ and $l =1$, therefore the probability is $(2a + 2b -1)/(pi a b)$.


= Problem 2
Answer:
First we prove that for independent random variables $X, Y$ and $Z = X + Y$, then $f_Z (z) = integral_(x in Omega_X) f_X (x)f_Y (z-x)d x$, where $f_X (x)$ is PDF of $X$.


_Proof_:
Let $F_X (x)$ be the CDF of $X$, then
$
F_Z (z) = Pr(Z <= z)\  
= Pr(X + Y <= z)\
= integral_(x in Omega_X) Pr(Y + X <= z|X = x) f_X (x) d x\
= integral_(x in Omega_X) Pr(Y <= z-x |X = x) f_X (x) d x\
= integral_(x in Omega_X) F_Y (z-x)f_X (x) d x.
$
We take derivative of both sides, then we get $f_Z (z) = integral_(x in Omega_X) f_X (x)f_Y (z-x)d x$.

Back to the original problem, we can first calculate the PDF of $x_1 + x_2$. Let $Y = x_1 + x_2$, since $rho_0(x) = 0 "for" x < 0$, we only need to consider $0<= x <=y$ parts.
$
f_Y (y) = integral_0 ^y rho_0 (x)rho_0 (y-x)d x\  
= integral_0 ^y e^(-x) e^(-(y-x))d x\
= integral_0 ^y e^(-y)d x\
= y e^(-y).
$
Therefore, 
$
Pr(x_1+x_2>t) = Pr(Y>t) = integral_t ^(+infinity) f_Y (y)d y = integral_t ^(+infinity) y e^(-y) d y \  
=lim_(A->+infinity) -(y+1)e^(-y)|_t^A = lim_(A->+infinity) (1+t)e^(-t) - (1+A)e^(-A) = (1+t)/e^t.
$
$f_Y (y) = y e^(-y)$ only exists when $Y>=0$, so above equation is only valid when $t>=0$. For $t<0$, we always have $Pr(x_1+x_2>t) = 1$.

To sum up,
$
Pr(x_1+x_2>t) = cases(
  1 "if" t < 0,
  (1+t)/e^t "if" t >= 0,
).
$
= Problem 3
Answer: (a)(c)(d) are _True_ and (b) is _False_.

(a)_Proof_: 
$
E(X+Y) &= sum_(x in Omega_X) sum_(y in Omega_Y) (x+y)Pr(X = x sect Y = y) \  
&= sum_(x in Omega_X) sum_(y in Omega_Y) x Pr(X = x sect Y = y) + sum_(x in Omega_X) sum_(y in Omega_Y) y Pr(X = x sect Y = y) \
&= sum_(x in Omega_X) sum_(y in Omega_Y) x Pr(X = x sect Y = y) + sum_(y in Omega_Y) sum_(x in Omega_X) y Pr(X = x sect Y = y) \
&= sum_(x in Omega_X) x sum_(y in Omega_Y) Pr(X = x sect Y = y) + sum_(y in Omega_Y) y sum_(x in Omega_X) Pr(X = x sect Y = y) \
&= sum_(x in Omega_X) x Pr(X = x) + sum_(y in Omega_Y) y Pr(Y = y) \  
&= E(X) + E(Y).
$

(b)Let's toss a dice only once, and let $X = 1$ when the number is 1, else $X = 0$. And $Y = 1$ when the number is 2, else $Y = 0$. Then $E(X) = 1/6$ and $E(Y) = 1/6$.
$X = 1$ and $Y = 1$ can't happen at the same time, so $E(X^2 Y^2) = 0$, but $E(X)E(Y) = 1/36$. Hence, $(E(X^2 Y^2))^(1/2) >= E(X) dot E(Y)$ is _False_.

Before proving (c)(d), let's prove the following lemma first.

*Lemma*: For any random variables $X$ and convex function f satisfying $f'''$ exists, we have $f(E(X)) <= E(f(X))$.

_Proof_:
Since $f$ is convex, we have $f''>=0$.

Since $f'''$ exists, use Taylor's theorem, we have 
$
f(x) = f(x_0) + (f'(x_0))/(1!)(x-x_0) + (f''(xi_0))/(2!)(x-x_0)^2 >= f(x_0) + f'(x_0)(x-x_0).
$

Hence, $E[f(X)] >= E[ f(x_0) + f'(x_0)(X-x_0) ] = f(x_0) + f'(x_0)E[ X-x_0 ]$ for a given $x_0$.

Let $x_0 = E[X]$, we have $E[ f(X) ] >= f(x_0) + f'(x_0)(E[X]-x_0) = f(E[X])$.

(c) $X$ and $Y$ are independent, so $E(X Y) = E(X)E(Y)$.
This is because
$
E(X Y) &= sum_(x in Omega_X) sum_(y in Omega_Y) x y Pr(X = x sect Y = y) \
&= sum_(x in Omega_X) sum_(y in Omega_Y) x y Pr(X = x)Pr(Y = y) \
&= sum_(x in Omega_X) x Pr(X = x) sum_(y in Omega_Y) y Pr(Y = y) \
&= E(X)E(Y).
$
Since $f(x) = x^2$ is convex, we have $E(X^2 Y^2) >= E^2(X Y) = (E(X) E(Y))^2$, so $(E(X^2 Y^2))^(1/2) >= E(X) dot E(Y)$.

(d) Let $f(x) = e^x$, and $f(x)$ is convex.
Using lemma above, we have $f(E(X)) <= E(f(X))$, so $E(e^X) >= e^(E(X))$.
= Problem 4
Answer: $m >= 2$, we want to prove
$
sum_(2<=k<=m) vec(m,k)vec(n-m, m-k)1/(2^(vec(m,2)-vec(k,2)))<=m^5/(n-m+1)E[X].
$
Since $E[X] = vec(n, m)1/2^(vec(m,2))$
So we only need to prove that
$
sum_(2<=k<=m) vec(m,k)vec(n-m, m-k)1/(2^(vec(m,2)-vec(k,2)))<=m^5/(n-m+1)vec(n, m)1/2^(vec(m,2))\   
arrow.l.r.double sum_(2<=k<=m) vec(m,k)vec(n-m, m-k)2^(vec(k,2))<=m^5/(n-m+1)vec(n, m). 
$
Let $f(x) = vec(m,x)vec(n-m, m-x)2^(vec(x,2))$, $2<=x<=m$, then for sufficiently large $n$, we have 
$
f(x+1)/f(x) = (m-x)/(x+1)(m-x)/(n-2m+x+1)2^(x(x+1)/2-x(x-1)/2) = (m-x)^2/((x+1)(n-2m+x+1))2^x<1. 
$
Therefore, $f(x)$ is decreasing, so we have
$
sum_(2<=k<=m) vec(m,k)vec(n-m, m-k)2^(vec(k,2))<=m^5/(n-m+1)vec(n, m)\ 
arrow.l.double m vec(m,2)vec(n-m, m-2)2^(vec(2,2))<=m^5/(n-m+1)vec(n, m)\
arrow.l.double m^2(m-1)dot (n-m)!/((m-2)!(n-2m+2)!)<=m^5/(n-m+1)vec(n, m)\
arrow.l.double (n-m+1)!/((m-2)!(n-2m+2)!)<=m^2n!/(m!(n-m)!)\
arrow.l.double (n-m+1)!/(n-2m+2)!<=n!/(n-m)!\
arrow.l.double vec(n-m+1,m)<=vec(n,m).
$
The last inequality is true therefore we prove the original inequality.
= Problem 5
Answer: We directly prove (b).

We first prove that two path can only share some continuous edges at most one time.

If they share twice or more, let the end node of the first shared path be $v_1$, and the beginning of the second shared path be $v_2$. Then there are at least two path from $v_1$ to $v_2$, which can't be true since bit-fixing algorithm only generate one path from $v_1$ to $v_2$.

During the routing, $M_i$ increases its lag from 0 to $D_j$ when it arrives at destination. Notice that $M_i$ will increase its lag from $t$ to $t+1$ when it arrives(or stays) at a node when another packet $M_j$ come in and get through the next edge before $M_i$.

If this situation happens, then we say that $M_i$ give a bonus to $M_j$. So $M_j$ has a bonus now. If $M_j$ also meets similar situation(delay), then it gives all his bonus to the packet that crosses the next edge. So the bonus is passed from one packet to another.

Notice that only $M_i$ can generate and allocate bonus, other packets can only get bonus from $M_i$ and pass it to another packet. So the number of bonus depends on the number of bonus that $M_i$ generates.

Now, let's prove that the number of bonus that $M_i$ generates is at most $abs(S)$.

First, bonus can't stop moving until it got out of $p a t h_i$. If $M_j$ gets a bonus, then it must cross the next edge before another packet to get it. Else $M_j$ has a bonus already, if $M_j$ doesn't cross the next edge, then it will give the bonus to another packet that crosses. Whichever the situation is, the bonus will continue moving through edges and edges.

Second, $M_i$ can only generate a bonus at one time since $M_i$ only give a bonus to the packet that crosses the next edge before $M_i$. 

Third, one packet can only have one bonus at one time, this can be proved by above facts(bonus can't stop moving and is generated at most one at one time).

Therefore, the number of bonus that $M_i$ generates is at most the number of packets that come into $p a t h_i$, which is $abs(S)$.
We have a bonus iff $M_i$ suffers a delay, so $D_i<=abs(S)$.

= Problem 6
Answer: We need to find out the expectation of the number of paths that contain a particular $e$.

Let $I$ be the indicator function, then
$
sum_(e in "all edges")Y_e &= sum_(e in "all edges")sum_(i = 1)^(2^n) I(e in P a t h_i)\  
&= sum_(i = 1)^(2^n) sum_(e in "all edges")I(e in P a t h_i)\
&= sum_(i = 1) ^(2^n) ("length of" P a t h_i).
$
Therefore,
$
sum_(e in "all edges")E[Y_e] = sum_(i = 1) ^(2^n) E[("length of" P a t h_i)].
$
$
E[Y_e] = (2^n E["the length of paths starting from point 1"])/("# all edges")= (2^n sum_(i = 0) ^n i vec(n, i)/2^n)/(2^n n) = (2^n n 2^(n-1)/2^n)/(2^n n) = 1/2.
$
= Problem 7
Answer: 
We consider two point $011A$ and $101A$, where A stands for a random 01 string.
If they both go to $110B$, where B is a random 01 string. Then two paths are  
$
011A -> 111A -> 110A -> 110... -> ... -> 110B\
101A -> 111A -> 110A -> 110... -> ... -> 110B.
$
Notice that bit-fixing algorithm ensures that they have common edge $111A->110A$ and packets will arrive  $111A$ at the same time, so there must be at least one delay. There are $2^(n-3)$ pairs of such points, and a packet has probability $1/8$ to have destination $110B$.

Hence, the expectation of the number of delayed packets is $E[abs(S)] >= 2^(n-3) dot 1/8 dot 1/8 dot 1 = 1/2^9 dot 2^n$.

Therefore, $E[abs(S)] = Omega(2^n)$.

Acknowledgement: Yu Yue, _Geometric Probability_, _All of Statistics_, _Probability and Computing_, CS271 Lecture Notes.