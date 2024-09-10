#import "template.typ": *
#show: project.with(
  title: "Mathematics for Computer Science: Homework 7",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)

= Problem 1
1.We let $y_i = x_i - c_1, z_i = x'_i - c_2$, then 
$
Pr(abs(y_i)<=1-epsilon) = (1-epsilon)^d <= e^(-epsilon d).\  
Pr(abs(y_i y_j)>= c/sqrt(d-1))<=2/c e^(-c^2/2).\
Pr(abs(y_i (c_1-c_2))>= delta c/sqrt(d-1))<=2/c e^(-c^2/2).\
$
// so 
// $
// Pr(abs(y_i)<=1-epsilon "for all" i) <= n e^(-epsilon d).\  
// Pr(abs(y_i y_j)>= c/sqrt(d-1) "for all" i!=j)<= (n(n-1))/2 2/c e^(-c^2/2).\
// Pr(abs(y_i (c_1-c_2))>= delta c/sqrt(d-1) "for all" i)<=n 2/c e^(-c^2/2).\
// $
It's similar for $z_i$.

Let $epsilon = (log n ln n)/d, c = sqrt(log n ln n)$, then
$
Pr(abs(y_i)<=1-epsilon) <= e^(-epsilon d) = n^(-log n) = n^(-Omega(log n)).\  
Pr(abs(y_i y_j)>= c/sqrt(d-1))<=  2/sqrt(log n ln n) e^(-(log n ln n)/2) = 2/sqrt(log n ln n)n^(-(log n)/2) = n^(-Omega(log n))\  
Pr(abs(y_i (c_1-c_2))>= delta c/sqrt(d-1))<= 2/sqrt(log n ln n) e^(-(log n ln n)/2) = 2/sqrt(log n ln n)n^(-(log n)/2) = n^(-Omega(log n)).\
.

$
Back to the original problem, let $L^2(d, n) >= 2 + 2 c/sqrt(d-1)$
$
Pr(abs(x_i - x_j)<=L(d, n)) = Pr(abs(y_i-y_j)^2 <= L^2(d, n))\  
>= Pr(y^2_i+y^2_j - 2y_i y_j<= L^2(d, n))\  
>=Pr(y^2_i<=1)Pr(y^2_j<=1)Pr(abs(y_i y_j)<=c/sqrt(d-1))\
>= 1 - n^(-Omega(log n)).
$
It's similar for $x'_i$.

Then, let $L^2(d, n) <= 2(1-epsilon)^2 + delta^2 - 2c/sqrt(d-1)- 4delta c/sqrt(d-1)$
$
Pr(abs(x_i - x'_j)>=L(d, n)) = Pr(abs(y_i-c_1-z_j+c_2)^2 >= L^2(d, n))\
= Pr(y^2_i + z^2_j +(c_1-c_2)^2 - 2y_i z_j + 2(c_1-c_2)y_i-2(c_1-c_2)z_j>=L^2(d, n))\ 
>=  Pr(y^2_i + z^2_j +(c_1-c_2)^2 - 2y_i z_j + 2(c_1-c_2)y_i-2(c_1-c_2)z_j>=L^2(d, n))\  
>= Pr(y^2_i>=(1-epsilon)^2)Pr(z^2_j>=(1-epsilon)^2)Pr((c_1- c_2)^2 = delta^2)\  
Pr(abs(y_i z_j)<= c/sqrt(d-1))Pr(abs((c_1-c_2) y_i)<= delta c/sqrt(d-1))Pr(abs((c_1-c_2) z_j)<= delta c/sqrt(d-1))\  
>= (1- n^(-Omega(log n)))^5
= 1 - n^(-Omega(log n)).
$
so, we only need to have 
$
2 + 2 c/sqrt(d-1)<=L^2(d, n) <= 2(1-epsilon)^2 + delta^2 - 2c/sqrt(d-1)- 4delta c/sqrt(d-1).
$
There exists $L(d, n)$ if we have 
$
2 + 4(1+ (log n)^2/(d^(1/4))) sqrt(log n ln n)/sqrt(d-1) <= 2(1-(log n ln n)/d)^2 + (log n)^4/sqrt(d)\  
arrow.l.double 2 + 4(1+ (log n)^2/(d^(1/4))) sqrt(log n ln n)/sqrt(d-1) <= 2 + 2((log n ln n)/d)^2 - 4 (log n ln n)/d + (log n)^4/sqrt(d)\
arrow.l.double 4(1+ (log n)^2/(d^(1/4))) /sqrt(d-1) <= 2(log n ln^2 n)/d^2 - 4 (ln n)/d + (log n)^3/sqrt(d)\
arrow.l.double 4(1+ (log d^3)^2/(d^(1/4))) /sqrt(d-1) + 4 (ln d^3)/d<= 2(log d^3 ln^2 d^3)/d^2  + (log d^3)^3/sqrt(d).
$
It's true for large enough $d$. Therefore, there exists $L(d, n)$ and we can just let $L(d, n) = sqrt(2 + 2 sqrt((log n ln n)/(d-1)))$.
= Problem 2.5
Answer:
1.$Pr(x>=3) <= E[x]/3 = (integral_0^4 x f(x) "dx")/3 = (integral_0^4 x/4 "dx")/3 = 2/3$.

2.$Pr(abs(x)>=a) = Pr(x^2 >= a^2)<= E[x^2]/a^2$. For $a = 3$, we have
$
Pr(abs(x) >= 3) <= E[x^2]/9 = (integral_0^4 x^2/4 "dx")/9 = 16/27.
$
3.For $a = 3$, 
$
Pr(abs(x)>= 3) = Pr(x^r >= 3^r) <= E[x^r]/3^r = (integral_0^4 x^r/4 "dx")/3^r = 4^r/(3^r (r+1)).
$
= Problem 2.12
// Answer:
// Let $f(x) = e^x - x - 1$, then we know that
// $f'(x) = e^x - 1>=0$ for $x>=0$ and $f'(x) <=0$ for $x<=0$. Therefore, $f(x)$ has a unique minimum at $x = 0$. Since $f(0) = 0$, we have $f(x) >= 0$ for all $x$. Therefore, $e^x >= x + 1$ for all $x$.

// Let $g(x) = e^x - x^2/2 - x - 1$, then $g'(x) = e^x -x - 1 = f(x)$, since we know that $f(x)>=0$, so $g(x)$ monotonically increases. Therefore, $g(x) <= g(0) = 0$ for $x<=0$. Let $x = -sqrt(0.02)$ and we can see that $e^x - x - 1<=x^2/2 = 0.01$.

// To get a more precise range, we can solve $e^x - x - 1 = 0.01$ and get $x approx -
// 0.1448 "or" 0.1381$, thus the range is about $[-0.1448, 0.1381]$.
Answer:
We know that $V(d) = (2 pi^(d/2))/(d Gamma(d/2))$, so we have 
$
V(d)/V(d-1) = (2 pi^(d/2))/(d Gamma(d/2)) ((d-1) Gamma((d-1)/2))/(2 pi^((d-1)/2)).
$
If $d = 2k$ and $k >= 3$, then
$
Gamma(d/2) = Gamma(k) = (k-1)!\  
Gamma((d-1)/2) = Gamma(k-1/2) = ((2k-3)!!)/2^(k-1) sqrt(pi)\  
V(d)/V(d-1) = pi ((2k-1)!!)/(2^(k)k!) =  ((2k-1)...(5 dot 3 dot 1 dot pi))/((2k)...(6 dot 4 dot 2))<1.
$
If $d = 2k+1$ and $k >= 3$, then
$
Gamma(d/2) = Gamma(k+1/2) = ((2k-1)!!)/2^k sqrt(pi)\  
Gamma((d-1)/2) = Gamma(k) = (k-1)!\  
V(d)/V(d-1) =(2^(k+1) (k)!)/((2k+1)!!)= ((2k)...(6 dot 4 dot 2 dot 2))/((2k+1)...(7 dot 5 dot 3))<1.
$
Therefore, the volume of a sphere decreases as the dimension increases above 5.
Since
$
V(2) = pi<V(3) = 4/3 pi< V(4) = pi^2/2<V(5) = 8/15 pi^2.
$
Therefore, the volume of a d-dimensional unit ball take on its maximum when $d = 5$.
= Problem 2.19
// Answer: This is because as the dimension increases, the distribution change, most of volume concentrates on the surface of the sphere. The relative size of a 3D ball within a very high-dimensional ball becomes infinitesimally small.
Answer:
1. We integral $x_1$. For $x_1 = t$, then volume of the remaining ball is $V(d-1) (1-t^2)^((d-1)/2)$.
Therefore, we have $V(d) = integral_(-1)^1 (1-t^2)^((d-1)/2) V(d-1)"dt"$.
2. $V(1) = 2$, $V(2) = 2 integral_(-1)^1 sqrt(1-t^2)"dt" = 2integral_(-pi/2)^(pi/2)cos(t) "d"(sin t) = integral_(-pi/2)^(pi/2) (cos(2t)+1)"dt" = sin(2t)/2+t|_(-pi/2)^(pi/2) = pi$ and $V(3) = integral_(-1)^1 (1-t^2)pi"dt" = pi(t-t^3/3)|_(-1)^1 = 4/3 pi$.


= Problem 2.22
// Answer:
// We assume the height is $h$, then the face of the cylinder is a ball of dimension $d-1$ and radius $sqrt(1-h^2)$, so the volume of the cylinder is $h (1-h^2)^((d-1)/2) V(d-1)$.

// To maximize the volume, we denote $f(x) = h(1-h^2)^((d-1)/2)$.

// $
// f'(h) = (1-h^2)^((d-1)/2) + h (d-1)/2 (-2h) (1-h^2)^((d-3)/2) \  
// = (1-h^2)^((d-1)/2) - h^2 (d-1)(1-h^2)^((d-3)/2) = (1-h^2)^((d-3)/2)(1- d h^2)
// $.
// Since $h<=1$, we have $f'(h) >= 0$ for $h<=1/sqrt(d)$ and $f'(h) <= 0$ for $h>=1/sqrt(d)$. Therefore, the maximum volume is achieved when $h = 1/sqrt(d)$.
Answer:
We assume the height is $h$, then the face of the hypercube is a ball of dimension $d-1$ and radius $sqrt(1-(h/2)^2)$, so the volume of the cylinder is $h (1-(h/2)^2)^((d-1)/2) V(d-1)$.
$
f'(h) = (1-h^2/4)^((d-1)/2) + h (d-1)/2 (-h/2) (1-h^2/4)^((d-3)/2) \  
= (1-h^2/4)^((d-1)/2) - h^2 (d-1)/4(1-h^2/4)^((d-3)/2) = (1-h^2)^((d-3)/2)(1- (d h^2)/4).
$
Since $h<=1$, we have $f'(h) >= 0$ for $h<=2/sqrt(d)$ and $f'(h) <= 0$ for $h>=2/sqrt(d)$. Therefore, the maximum volume is achieved when $h = 2/sqrt(d)$ and the volume is $h^d = (2/sqrt(d))^d$.
= Problem 2.43
// Answer:
// Since $x_1, x_2, ..., x_n$ are independent, 
// so $E[m_s] = 1/n sum_(i = 1)^n E[x_i] = mu$  and $"var"(m_s) = 1/n^2 sum_(i = 1)^n "var"(x_i) = (n sigma^2)/n^2 = sigma^2/n$.
// $
// E(sigma_s^2) = E[1/n sum_(i = 1)^n (x_i - m_s)^2] = E[1/n sum_(i = 1)^n ((x_i - mu) - (m_s - mu))^2]\  
// = E[1/n sum_(i = 1)^n (x_i - mu)^2 - 2/n sum_(i = 1)^n (x_i - mu)(m_s - mu) + 1/n sum_(i = 1)^n (m_s - mu)^2]\
// = E[1/n sum_(i = 1)^n (x_i - mu)^2 - 2/n (m_s - mu)sum_(i = 1)^n (x_i - mu) + 1/n sum_(i = 1)^n (m_s - mu)^2]\
// = E[1/n sum_(i = 1)^n (x_i - mu)^2 - 2 (m_s - mu)^2 + (m_s - mu)^2]\
// = E[1/n sum_(i = 1)^n (x_i - mu)^2 - (m_s - mu)^2]\
// = E[1/n sum_(i = 1)^n (x_i - mu)^2] - E[(m_s - mu)^2]\
// = (n sigma^2)/n - "var"(m_s)\  
// = sigma^2 - sigma^2/n \  
// = (n-1)/n sigma^2.
// $
Answer:
1.We assume there are $n$ samples, then $||mu - m_s||_infinity= max(abs(mu_1- m_(s 1)), abs(mu_2 - m_(s, 2)), ..., abs(mu_d - m_(s d)))$. Union bound gives us $Pr(||mu - m_s||_infinity>=epsilon) <= d Pr(abs(mu_i - m_(s i))>= epsilon)$.
We assume that $m_(s i) = (x_1 + x_2 + ... +x_n)/n$, then $Pr(abs(mu_i - m_(s i))>= epsilon) = Pr(sum_(i = 1)^n (x_i - mu_i)>= n epsilon)$.
Let $y_i = x_i - mu_i$, then $Pr(sum_(i = 1)^n (x_i - mu_i)>= n epsilon)= Pr(sum_(i = 1)^n y_i>= n epsilon)$.

$y_i$ has normal distribution with mean 0 and variance 1, so we have $abs(E[y_i^(2r+1)]) = 0, abs(E[y_i^(2r)]) = E(abs(y_i^(2r))) = ((2r)!)/(2^r r!)<=(2r)!$. And we also know that $n epsilon in [0, sqrt(2)n]$, thus
$
Pr(sum_(i = 1)^n y_i>= n epsilon)<= 3e^(-(n^2 epsilon^2)/(12n)) = 3e^(-n epsilon^2/12).\  
Pr(||mu - m_s||_infinity>=epsilon)<= 3 d e^(-n epsilon^2/12)
$

Take $n > (1200 ln d)/epsilon^2$ and we can see that $Pr(||mu - m_s||_infinity>=epsilon)<3 e^(-100)<0.01$, thus $Pr(||mu - m_s||_infinity>=epsilon)>99%$.


2.Let $z_i = mu_i - m_(s i)$ and $Z:=sum_(i = 1)^d z_i^2$.
Then, since $z_i = 1/n sum_(i = 1)^n y_i$ and $y_i ~ N(0, 1)$, we know that $z_i ~ N(0, 1/n)$. Let $t_i = sqrt(n)z_i$ thus $t_i ~ N(0, 1)$.
Then, we have $Z = sum_(i = 1)^d z_i^2 = 1/n sum_(i = 1)^d t_i^2$.
so $n Z ~ chi_d^2$.

$E[chi_d^2] = d("var"[t_i] + E[t_i]) = d$ therefore $E[Z] = d/n$.
$
Pr(||mu-m_s||_2>=epsilon) =Pr(sqrt(sum_(i = 1)^d (mu_i - m_(s i))^2)>= epsilon) = Pr(sqrt(sum_(i = 1)^d z_i^2)>= epsilon)
= Pr(Z>= epsilon^2)<=E[Z]/epsilon^2 = d/(n epsilon^2).
$
When $n > 100d/epsilon^2$, we get $Pr(||mu-m_s||_2>=epsilon)<0.01, Pr(||mu-m_s||_2<=epsilon)>99%$.
So we can have $n = O(d/epsilon^2)$.

