#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Mathematics for Computer Science: Homework 2",
  authors: (
    (name: "Yiming Liu", phone: "2023010747"),
  ),
)

= Problem 1
Answer: We create another game B: person 1 finds his dog first, when person 1 finds his dog, if person 1 has already found person 2's dog during the process, the game ends, otherwise, person 2 continues to search for his dog until he finds it. If person 1 and 2 finds their dogs all within $n/2$ steps, they win, else they lose.


We put dogs they found into a sequence, like $3,6,7,1,8,10,2,5,9,...$. And then note that the probability of winning game B is always the same no matter what strategy person 1 and 2 take. It is because the probability of the sequence is fixed(always $1/(n!)$) and whether win or not is only determined by the sequence order. 

Also note that the probability of winning game B is the same as the probability of person 1 and 2's dogs are in the same cycle or in different cycles with length $<= n/2$, since we can find a bijection between the sequence of dogs and the cycle($<=n/2$) of dogs. We already known the method to change a sequence into cycles with length $<=n/2$ is just by slicing after 1 and 2, like 
$
3,6,7,1,8,2,5,9,...->( 3,6,7,1 )( 8,2 )59...
$
And for cycles with length $<= n/2$, like $(13,2,3)69(4,5,7,1,8,10)...$, we can reorder inside each cycle and reorder the cycles based on the last element to change it into a sequence, like 
$
(2,3)69(4,5,7,1,8)... -> (3,2)69(8,7,5,4,1)... -> (8,7,5,4,1)(3,2)69 -> 8,7,5,4,1,3,2,6,9.
$


Then we calculate this probability by considering the length of person 1's dog's cycle and person 2's dog's cycle. We have the following cases:

Person 1's dog and person 2's dog are in the same cycle(length $<= n/2$):
$
sum_(i<=n/2)1/n dot (i - 1)/(n-1) = (n - 2)/(8(n-1)).
$
Person 1's dog and person 2's dog are in different cycles and the two cycle's length $<=n/2$:
$
sum_(i, j<=n/2)Pr{"point 1 and 2 are in different cycles with length i and j"} = sum_(i, j <=n/2)1/(n(n-1)) =  n/(4(n-1)).
$

Together, the probability of winning game B is:
$
(n-2)/(8(n-1)) + n/(4(n-1)) = (3n - 2)/(8(n-1)) -> 3/8("when" n -> infinity).
$

After calculating the probability of winning game B, we then prove that the probability of winning original game is always less than the probability of winning game B. It is because for any strategy in original game can be directly applied to choose elements in the sequence for game B. Therefore, winning rate in original game is equal or less than winning rate in game B.

Cycle-search strategy achieves the same winning rate as the probability of winning game B. Therefore, the best strategy is to take the cycle-search strategy.
= Problem 2
Answer: (a) Since X, Y are independent, $E[X-Y] = E[X] - E[Y] = 0$.

(b) Since X, Y are independent, variance is also linear.
$
"Var"[X - Y] = "Var"[X] + "Var"[-Y] = "Var"[X] + "Var"[Y] = 2"Var"[X].
$
$
"Var"[X] &= E[X^2] - E^2[X]\  
&= E[(sum X_i)^2] - n^2/4\  
&= n sum E[X_i^2] + sum_(i eq.not j) E[X_i X_j] - n^2/4\  
&= n sum E[X_i] + n(n-1)/2 - n^2/4\
&= n/2 + (n(n-1))/4 -n^2/4\  
&=n/4.
$
So $"Var"[X-Y] = n/2$.

(c)
$
s(n) &= Pr{S}\ &= sum_(i = 0) ^n Pr{X = i and Y = i}\
&=sum_(i = 0) ^n Pr{X = i}Pr{Y = i}\
&=sum_(i = 0) ^n (vec(n, i)/2^n)^2\
&=vec(2n, n)/4^n .
$

(d)
$
t(n) &= Pr{T}\ &= sum_(i = 1) ^n Pr{X = i and Y = i - 1}\
&=sum_(i = 1) ^n Pr{X = i}Pr{Y = i - 1}\
&=sum_(i = 1) ^n vec(n, i)/2^n dot vec(n, i-1)/2^n\
&=vec(2n, n-1)/4^n.
$

= Problem 3
Answer: (a) We denote $X_i = 1/k$ where k is the length of the cycle containing point i.

$
E(X_i^2) = sum_(j = 1) ^n 1/j^2 Pr{"point" i "in the cycle of length" j} = sum_(j = 1) ^n 1/(j^2 dot n),
$

$
&E(X_i X_j) = sum_(i = 1) ^n (1/i^2)Pr{"point i in the cycle of length" k_1 "and point j in the same cycle" k_1}\  
&+ sum_(k_1 + k_2 <=n) 1/(k_1 k_2) Pr{"point i in the cycle of length" k_1 "and point j in another cycle of length" k_2}\  
&= sum_(i = 1) ^n (1/i^2) dot 1/n dot (i-1)/(n-1) + sum_(k_1 = 1) ^(n-1) sum_(k_2 = 1) ^(n-k_1) 1/(k_1 k_2) dot 1/(n(n-1))\  
&= 1/(n(n-1))(H_n - H_n^((2)) + sum_(k_1 = 1) ^(n-1) sum_(k_2 = 1) ^(n-k_1) 1/(k_1 k_2)).\
$
Since $X = sum X_i$,
$
X^2 = (sum X_i)^2\  
arrow.r.double E(X^2) = E((sum X_i)^2)\  
arrow.r.double E(X^2) = E(sum X_i^2) + sum_(i eq.not j) E(X_i X_j)\
arrow.r.double E(X^2) = sum E(X_i^2) + sum_(i eq.not j) E(X_i X_j)\
arrow.l.r.double E(X^2) = n E(X_1^2) + n(n-1) E(X_1 X_2)\ 
arrow.r.double E(X^2) = H_n^((2))+H_n-H_n^((2)) + sum_(i = 1) ^(n-1) sum_(j = 1) ^(n-i) 1/(i j).
$
Therefore $"Var"[X] = E[X^2] - E^2[X] = H_n + sum_(i = 1) ^(n-1) sum_(j = 1) ^(n-i) 1/(i j) - H_n^(2) = sum_(i = 1) ^n 1/i - sum_(i = 1) ^n 1/i^2$. (The last transformation can be proved by induction.)

(b)$"Var"[X] = sum_(i = 1) ^n 1/i - sum_(i = 1) ^n 1/i^2$.

When $n -> infinity$, $sum_(i = 1) ^n 1/i^2$ converge to a constant, which is $pi^2/6$ specifically.

Let $g(n) = ln(n)$, $h(n) = 1$, then $"Var"[X] = g(n) + O(h(n))$, $h(n) = o(g(n))$.
= Problem 4
Answer: $f(t) = mu (e^t - 1) - t(1 + delta)mu$ thus $f'(t) = mu e^t - (1+delta)mu$.

Let f'(t) = 0, we have $t = ln(1+delta)$.

When $t > ln(1 + delta)$ $f'(t) > 0$, $f(t)$ is increasing.

When $t < ln(1 + delta)$ $f'(t) < 0$, $f(t)$ is decreasing.

Therefore, $f(t)$ achieves minimum at $t = ln(1+delta)$.

= Problem 5
Answer: We prove that:
$
Pr{X >= c E[x]} <= e^(-beta(c)E[x])
$
where $beta(c) = c ln(c) - c + 1$.

Proof: 

We first prove that $E[c^x] <= e^((c-1)E[x]) $.

Proof:

$E[c^x]  = E[c^(sum x_i)] = product E[c^(x_i)]$
and we know that $c^t = (1+(c-1))^t <= 1 + (c-1)t$ for all $c >= 0$ and $t>=0$, so
$
E[c^(x_i)] &= sum c^(t) Pr{x = t}\  
&<=sum (1+(c-1)t)Pr{x_i = t}\  
&=1 + (c-1)E[x_i]\  
&<= e^((c-1)E[x_i]).
$
Therefore, 
$
E[c^x] <= product e^((c-1)E[x_i])
= e^(sum (c-1)E[x_i])=e^((c-1)E[x]).
$
Then we are done.

Using inequality above and Markov's inequality, we have:
$
Pr{X >= c E[x]} &= Pr{c^x >= c^(c E[x])}\  
&<= E[c^x]/c^(c E[x])\
&= E[c^x]/(e^(c ln(c)E[x]))\  
&<= e^((c-1) E[x])/ (e^(c ln(c)E[x]))\
&= e^(-beta(c)E[x]).
$

We come back to the original problem:

(a) Let $c = 1 - delta$, we have:
$
Pr{X <=(1-delta) mu} <= e^(-((1-delta)ln(1-delta)+delta)E[x])
$
while
$
e^(-((1-delta)ln(1-delta)+delta)E[x]) = (e^(-delta)/((1-delta)^(1-delta)))^E[x],
$
so we have proved the inequality (a).

(b) Let $c = 1 + delta$, we have:
$
Pr{X >=(1+delta) mu} <= e^(-((1+delta)ln(1+delta)-delta)E[x])
$ 
$
e^(-((1+delta)ln(1+delta)-delta)E[x]) <= e^(-E[x] delta^2/3)\  
arrow.l.r.double delta^2/3 <= (1+delta)ln(1+delta)-delta.
$
Let $f(delta) = (1+delta)ln(1+delta)-delta - delta^2/3$, we have:
$
f'(delta) = ln(1+delta) + 1 - 1 - (2delta)/3 = ln(1+delta) - (2delta)/3,\  
f''(delta) = 1/(1+delta) - 2/3.
$
So $f'(delta) <=f'(1/2) = ln(2/3) - 1/3 < 0", " f(delta) >= f(1) = 2ln(2) - 4/3 >0$.
Therefore, $f(delta) > 0$ for all $1>delta > 0$, we have proved the inequality (b).

(c)
We only need to prove 
$
e^(-((1-delta)ln(1-delta)+delta)E[x])<= e^(-E[x]delta^2/2)\  
arrow.l.r.double delta^2/2 <= (1-delta)ln(1-delta)+delta.
$
Let $f(delta) = (1-delta)ln(1-delta)+delta - delta^2/2$, we have:
$
f'(delta) = -ln(1-delta) - 1 + 1 - delta = -ln(1-delta) - delta,\
f''(delta) = 1/(1-delta) - 1 > 0.
$
So $f'(delta) >= f'(0) = 0$, $f(delta) >= f(0) = 0$. Therefore, $f(delta) > 0$ for all $0<delta<1$, we have proved the inequality (c).

= Problem 6
Answer: (a) A attracts B iff $Pr{B|A} > Pr{B}$ iff $Pr{B and A} > Pr{B}Pr{A}$ iff $Pr{A|B} > Pr{A}$ iff B attracts A.

(b)
(1) $Pr{B and A} > Pr{B}Pr{A}$.

(2) $Pr{A and C} > Pr{A}Pr{C}$.

(3) $Pr{B and C and A} < Pr{A}Pr{B and C}$.

$
Pr{A and (B or C)}> Pr{A} Pr{B or C}\  
arrow.l.r.double Pr{(A and B) or (A and C)} > Pr{A}Pr{B or C}\  
arrow.l.r.double Pr{A and B} + P{A and C} - Pr{A and B and C} > Pr{A}Pr{B or C}\
arrow.l.double Pr{A}Pr{B} + Pr{A}Pr{C} >= Pr{A}Pr{B and C} + Pr{A}Pr{B or C}\
arrow.l.r.double Pr{B} + Pr{C} >= Pr{B and C}+ Pr{B or C}.
$
Therefore, A attracts $B or C$.

(c)
$
Pr{A and B} = (4 dot 3)/(vec(52, 5) dot vec(47, 5)),\  
Pr{A} = Pr{B} = 4/vec(52, 5),\  
Pr{A} Pr{B} = 16/(vec(52, 5))^2 < 12/(vec(52, 5) dot vec(47, 5)) = Pr{A and B}.\
$
Therefore, A attracts B.

*Acknowledgements*: Zonghang Du, Yu Yue, MIT 6.042J Mathematics for Computer Science, _The Locker Puzzle_ by Eugene Curtin and Max Warshauer.