#import "template.typ": *
#show: project.with(
  title: "Mathematics for Computer Science: Homework 8",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)
#show image: set align(center)

= Exercise 3.7
Answer: Notice that orthonormal rows imply that
$
A A^T = I.
$
Therefore $A^(-1) = A^T$, we have $A^T A = I$, so the columns of $A$ are orthonormal.

= Exercise 3.12
Answer:
(1)
From Singular Value Decomposition, we have
$A = sum_(i = 1)^r sigma_i u_i v_i^T$, so
$
A^T A = (sum_(i = 1)^r sigma_i v_i u_i^T) (sum_(i = 1)^r sigma_i u_i v_i^T) = sum_(i, j) sigma_i sigma_j v_i (u_i^T u_j) v_j^T = sum_(i = 1)^r sigma_i^2 v_i v_i^T.
$
(2)
For arbitrary $v_j$, we have 
$
A^T A v_j = sum_(i = 1)^r sigma_i^2 v_i v_i^T v_i = sigma_i^2 v_j v_j^T v_j = sigma^2 v_j.
$
Therefore, $v_j$ is an eigenvector of $A^T A$ with eigenvalue $sigma^2$. 

(3)
If two singular vectors are not unique up to a sign, we assume they are $v_i$ and $v_j$.
Since they are also eigenvectors of $A^T A$, they must be unique up to multiplicative constants, which is impossible because $v_i = plus.minus v_j$.

= Exercise 3.13
Answer:
(1)
$
||A_k||_F^2 = sum_(i j) a_(i j)^2 = sum_(i = 1)^n abs(a_i)^2 = sum_(i = 1)^n sum_(j = 1)^k (a_i dot v_j)^2 = sum_(j = 1)^k sum_(i = 1)^n (a_i dot v_j)^2 = sum_(j = 1)^k abs(A_k v_j)^2 = sum_(i = 1)^k sigma_i^2.
$
(2)
Let's assume that $x = sum_(i = 1)^k c_i v_i$. Then
$
||A_k||_2 = max_(abs(x)<=1) abs(A_k x) = max_(abs(x)<=1) abs((sum_(i = 1)^k sigma_i u_i v_i^T) (sum_(i = 1)^k c_i v_i)) = max_(abs(x)<=1) abs(sum_(i = 1)^k sigma_i c_i u_i) = max_(abs(x)<=1) sqrt(sum_(i = 1)^k sigma_i^2 c_i^2) = sigma_1.
$
Thus, $||A_k||_2^2 = sigma_1^2$.

(3)
$A- A_k = sum_(i = k+1)^r sigma_i u_i v_i^T$, so 
$
||A-A_k||_F^2 &= sum_(i j) a'_(i j)^2 \  
&= sum_(i = 1)^n abs(a'_i)^2 \  
&= sum_(i = 1)^n sum_(j = k+1)^r (a'_i dot v_j)^2 \  
&=  sum_(j = k+1)^r sum_(i = 1)^n (a'_i dot v_j)^2 \  
&= sum_(j = k+1)^r abs((A-A_k) v_j)^2 \  
&= sum_(i = k+1)^r sigma_i^2.
$

(4)
Let's assume that $x = sum_(i = 1)^r c_i v_i$. Then
$
||A - A_k||_2 &= max_(abs(x)<=1) abs((A-A_k) x) \  
&= max_(abs(x)<=1) abs((sum_(i = k+1)^r sigma_i u_i v_i^T) (sum_(i = 1)^r c_i v_i)) \  
&= max_(abs(x)<=1) abs(sum_(i = k+1)^r sigma_i c_i u_i) \  
&= max_(abs(x)<=1) sqrt(sum_(i = k+1)^r sigma_i^2 c_i^2) \  
&= sigma_(k+1).
$
Thus, $||A-A_k||_2^2 = sigma_(k+1)^2$.

= Exercise 3.21
Answer:
We assume that $x = sum_(i = 1)^r c_i v_i$.
Then
$
B A x &= (sum_(i = 1)^r 1/sigma_i v_i u_i^T)(sum_(i = 1)^r sigma_i u_i v_i^T) (sum_(i = 1)^r c_i v_i) \  
&= (sum_(i, j) v_i u_i^T u_i v_i^T) (sum_(i = 1)^r c_i v_i) \  
&= (sum_(i = 1)^r v_i v_i^T)(sum_(i = 1)^r c_i v_i) \  
&= sum_(i, j) v_i v_i^T c_j v_j \  
&= sum_(i = 1)^r c_i v_i \  
&= x.
$
= Exercise 3.22
Answer: (1)
$||A||_F^2 = sum_(i = 1)^r sigma_i^2 >= sum_(i = 1)^k sigma_i^2 >= k sigma_k^2$. So $sigma_k <= (||A||_F)/sqrt(k)$.

(2) Let $B = sum_(i = 1)^(k-1) sigma_i u_i v_i^T$, then
$||A-B||_2 = sigma_(k)<= (||A||_F)/sqrt(k)$.

(3) No. If we can, since $||A-B||_F^2>=||A-A_k||_F^2 = sum_(i = k+1)^r sigma_i^2$, we must have 
$
(sum_(i = 1)^r sigma_i^2)/k = (||A||_F^2)/k>= sum_(i = k+1)^r sigma_i^2.
$
This is not necessarily true. For example, if $sigma_i = 1, r>=5$ and $k = 2$, then this is false.
Thus, we cannot replace 2-norm by Frobenius norm.