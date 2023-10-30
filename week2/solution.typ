#import "@preview/diagraph:0.1.0": *

= Exercise 1
- Group 1: a, d, g, i, j, k
- Group 2: b, e, h
- Group 3: c
- Group 4: f

= Exercise 2
#raw-render()[```dot
digraph {
    rankdir=LR;
    p0q0 [shape=circle]
    p0q1 [shape=circle]
    p0q2 [shape=square, width=0.75]
    p1q0 [shape=circle]
    p1q1 [shape=circle]
    p1q2 [shape=circle]
    p0q0 -> p0q0 [label=b]
    p0q0 -> p1q0 [label=a]
    p0q0 -> p1q1 [label=a]
    p0q1 -> p0q2 [label=b]
    p0q2 -> p0q2 [label=b]
    p0q2 -> p1q2 [label=a]
    p1q0 -> p0q0 [label=a]
    p1q0 -> p1q0 [label=b]
    p1q0 -> p0q1 [label=a]
    p1q1 -> p1q2 [label=b]
    p1q2 -> p1q2 [label=b]
    p1q2 -> p0q2 [label=a]
}
```]

= Exercise 3
== Language $L_1$
=== Part A
$
L_1 = {
    x_0x_1... |
    (forall i in N_0 space . space x_i in sum)
    and 
    (exists i in N_0 space . space x_i = a)
}
$
=== Part B
#raw-render()[```dot
digraph {
    rankdir=LR;
    q0 [shape=circle]
    q1 [shape=square]
    start -> q0
    q0 -> q0 [label="a, b"]
    q0 -> q1 [label=b]
    q1 -> q1 [label=b]
}
```]
=== Part C
$
L_1 = (Q_1, sum, delta_1, Q_1^"init", F_1) \
Q_1 = {q_0, q_1} \
sum = {a, b} \
Q_1^"init" = {q_0} \
F_1 = {q_1} \
delta_1 = {
    (q_0, a, q_0),
    (q_0, b, q_0),
    (q_0, b, q_1),
    (q_1, b, q_1)
}
$

== Language $L_2$
=== Part A
$
L_2 = {
    x_0 x_1 ... | 
    (forall i in N_0 space . space x_i in sum)and 
    (forall i in N_0 space . space i mod 2 eq 1 space . space x_i = a)
}
$
=== Part B
#raw-render()[```dot
digraph {
    rankdir=LR;
    q0 [shape=square]
    q1 [shape=circle]
    start -> q0
    q0 -> q1 [label="a, b"]
    q1 -> q0 [label=a]
}
```]
=== Part C
$
L_2 = (Q_2, sum, delta_2, Q_2^"init", F_2) \
Q_2 = {q_0, q_1} \
sum = {a, b} \
Q_2^"init" = {q_0} \
F_2 = {q_2} \
delta_1 = {
    (q_0, a, q_1),
    (q_0, b, q_1),
    (q_1, b, q_0)
}
$