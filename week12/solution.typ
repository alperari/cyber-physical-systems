#import "@preview/diagraph:0.1.2": *

#set text(
  size: 15pt,
)
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
)

#align(center, text(21pt)[
  *Cyber Physical Systems - Discrete Models \ 
  Exercise Sheet 12 Solution*
])

#grid(
  columns: (1fr, 1fr),
  align(center)[
    Alper Ari \
    aa508\@uni-freiburg.edu
  ],
  align(center)[
    Onur Sahin \
    os141\@uni-freiburg.de
  ]
)

#align(center)[
  January 21, 2023
]

== Exercise 2: LTL Properties
=== (a)
$
&phi_1 = a and circle b : tau = {a}{b}^omega tack.double phi_1 \
&phi_2 : tau = {a}{a}{a}{b}^omega \
&phi_3 : tau = {a}{a}{b}{a}^omega \
&phi_4 : tau = {b}{b}{c}{a}^omega \
&phi_5 : tau = {c}{c}{a}^omega \
&phi_6 : tau = {b}{b}({a}{c})^omega \
$
=== (b)
$
& not phi_1 : tau = {a}^omega \
& not phi_2 : tau = {c}^omega \
& not phi_3 : tau = {a}{b}^omega \
& not phi_4 : tau = {c}^omega \
& not phi_5 : tau = ({b}{a})^omega \
& not phi_1 : tau = {c}{a}^omega \
$
=== (c)
Let $T$ be the Transition System
- $T tack.double.not phi_1$. Counterexample: $"trace"(s_0 s_2 ...) = {b} {a} ...$
- $T tack.double phi_2$. Because first trace is ${b} {a} ...$ which immediately starts with $b$ therefore satisfies and the second trace is ${a, c} {a} {a, b} ...$ which also contains $a$ until $b$.
- $T tack.double.not phi_3$. Counterexample: $"trace"(s_1 s_2 s_3^omega) = {a, c} {a} {a, b}^omega$. Which satisfies $a union square b$ therefore violates $phi_3$.
- $T tack.double.not phi_4$. Counterexample: $"trace"(s_0 s_2 s_3) = {b} {a} {a, b}^omega$ doesn't contain $a$ in the initial state and also there is no eventually $c$ for the first state. Therefore it is not in $"Words"(phi_4)$.
- $T tack.double phi_5$. The infinite parts of each trace satisfies "always $a$". Therefore, all traces are in $"Words"(phi_5)$.
- $T tack.double.not phi_6$. Counterexample: $"trace"(s_0 s_2 s_3^omega) = {b} {a} {a, b}^omega$ doesn't have $c$ at all. Therefore, "eventually $c$" can't be satisfied.
=== (d)
$
& "Words"(phi_1) = \
& {A_0 A_1 ... in (2^"AP")^omega | a in A_0 and b in A_1} \
& "Words"(phi_2) = \
&  {A_0 A_1 ... in (2^"AP")^omega | exists i in NN . space (forall j < i . space a in A_j) and b in A_i} \
& "Words"(phi_3) = \
&  {A_0 A_1 ... in (2^"AP")^omega | forall i in NN . space (exists j < i . space a in.not A_j) or (exists j >= i . space b in.not A_j)} \
& "Words"(phi_4) = \
&  {A_0 A_1 ... in (2^"AP")^omega | exists i in NN . space (forall j < i . space (exists k >= j . space c in A_k)) and (forall j >= i . space a in A_j)} \
& "Words"(phi_5) = \
&  {A_0 A_1 ... in (2^"AP")^omega | exists i in NN . space (forall j >= i . space a in A_j)} \
& "Words"(phi_6) = \
&  {A_0 A_1 ... in (2^"AP")^omega | forall i in NN . space exists j >= i . space c in A_j} \
$

== Exercise 3: Stating properties in LTL
$
& phi_a = not "Peter"."use" or not "Betsy"."use" \
& phi_b = (diamond square not "Peter"."use") and (diamond square not "Betsy"."use")  \
& phi_c = ("Peter"."request" -> diamond "Peter"."use") and ("Betsy"."request" -> diamond "Betsy"."use") \
& phi_d = (square diamond "Peter"."request" -> square diamond "Peter"."use") and (square diamond "Betsy"."request" -> square diamond "Betsy"."use") \
& phi_e = ("Peter.use" -> (not "Peter.use") union "Betsy.use") and ("Betsy.use" -> (not "Betsy.use") union "Peter.use") 
$

#pagebreak()

== Exercise 4: Equivalence of LTL formulas
Note: Atomic propositions of the Transition System are notated under the state name.

- $square a and circle diamond a limits(eq.triple)^? square a = "true"$

- $diamond a and circle square a limits(eq.triple)^? diamond a = "false"$. Counter example TS:
#raw-render()[```dot
  digraph {
    rankdir=LR;

    node [fixedsize=true, width=0.75, height=0.75];

    start [fixedsize=true; width=0, height=0, label=""];

    s0 [label="s0\n{a}"];
    s1 [label="s1\n{b}"];

    start -> s0;
    s0 -> s1;
    s1 -> s1;
  }
```]
satisfies $diamond a$ but not for $circle square a$

- $square a -> diamond b limits(eq.triple)^? a union (b or not a) = "true"$.

- $a union "false" limits(eq.triple)^? square a = "false"$. Counter example TS:
#raw-render()[```dot
  digraph {
    rankdir=LR;

    node [fixedsize=true, width=0.75, height=0.75];

    start [fixedsize=true; width=0, height=0, label=""];

    s0 [label="s0\n{a}"];

    start -> s0;
    s0 -> s0;
  }
```]
satisfies $square a$ but not for $a union "false"$.

- $square circle b limits(eq.triple)^? square b = "false"$. Counter example: 
#raw-render()[```dot
  digraph {
    rankdir=LR;

    node [fixedsize=true, width=0.75, height=0.75];

    start [fixedsize=true; width=0, height=0, label=""];

    s0 [label="s0\n{a}"];
    s1 [label="s1\n{b}"];

    start -> s0;
    s0 -> s1;
    s1 -> s1;
  }
```]
satisfies $square circle b$ but not for $square b$.

=== Proofs
==== Proof 1: $square a and circle diamond a eq.triple square a$
Assuming $"Words"(square a) subset.eq "Words"(circle square a)$, $square a and circle diamond a eq.triple square a$ because intersection with a subset results with the subset.

Proving $"Words"(square a) subset.eq "Words"(circle diamond a)$:
$
"Words"(square a) = { A_0 A_1 ... in (2^"AP")^omega | forall i in NN . space a in A_i } \
"Words"(circle diamond a) = { A_0 A_1 ... in (2^"AP")^omega | forall i > 0 . space exists j >= i . space a in A_i } \
$
Let $sigma in "Words"(square a)$. $sigma in "Words"(circle diamond a)$ because for any $sigma$, we can take $i = 1$ and $j = 1$ which contains $a$ and therefore $sigma tack.double circle diamond a$.

$qed$

==== Proof 2: $square a -> diamond b eq.triple a union (b or not a)$
$a union (b or not a) eq.triple ("true" union (b or not a))$, because $a$ must necessarily hold until $b or not a$ occurs otherwise $b or not a$ would hold earlier. Also $"true" union (b or not a) eq.triple diamond (b or not a)$ from the definition of $diamond$ operator.

For $square a -> diamond b $:
$
square a -> diamond b 
  & eq.triple not square a or diamond b \
  & eq.triple diamond not a or diamond b \
  & eq.triple diamond (not a or b)
$

Since both equations are equivalent for another LTL formula they are equivalent to each other as well.

$qed$
