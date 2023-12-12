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
  Exercise Sheet 8 Solution*
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
  December 10, 2023
]

= Exercise 1: Prefixes and Closure I
== Part A #label("part-a")
$
P subset.eq "cl"(P)
$
=== Solution
Let $omega in P$, then $"pref"(omega) subset.eq "pref"(P)$  trivially. Since $"pref"(omega) subset.eq "pref"(P)$ is the predicate for closure, then we can conclude $forall omega in P -> omega in "cl"(P)$, thefore $P subset.eq "cl"(P)$.

== Part B
$
"pref"("cl"(P)) = "pref"(P)
$

=== Solution
If we prove both $"pref"("cl"(P)) subset.eq "pref"(P)$ and $"pref"(P) subset.eq "pref"("cl"(P))$, then we can conclude $"pref"("cl"(P)) = "pref"(P)$.
==== Direction 1: $"pref"("cl"(P)) subset.eq "pref"(P)$ 
Let $omega in "pref"("cl"(P))$, then $exists sigma in "cl"(P) -> omega in "pref"(sigma)$. By the definition of closure, $forall sigma in "cl"(P) -> "pref"(sigma) subset.eq "pref"(P)$. Hence, $w in "pref"(P)$. Which concludes that $forall omega in "pref"("cl"(P)) -> omega in "pref"(P)$.

==== Direction 2: $"pref"(P) subset.eq "pref"("cl"(P))$
Let $omega in "pref"(P)$, then $exists sigma in P -> omega in "pref"(sigma)$. By proof in #link(label("part-a"))[part a], we can claim $forall sigma in P -> sigma in "cl"(P)$. Therefore, $omega in "pref"(P) -> omega in "pref"("cl"(P))$.

#pagebreak()

= Exercise 2: Prefixes and Closure II
== Part A
$
& P_1 = {A_0 A_1 ... | exists S subset.eq N dot (|S| = 1 and forall i in S a in A_i)} \
& P_2 = {A_0 A_1 ... | forall i dot (a in A_i -> b in A_(i + 1))} \
& P_3 = {A_0 A_1 ... | exists i dot (forall j dot (j >= i -> a in.not A_j))} \
& P_4 = {A_0 A_1 ... | a in A_0 and limits(exists)^infinity i dot a in A_i} \
$

== Part B
$
& "pref"(P_1) = {A_0 A_1 ... A_k | exists S subset.eq N dot (|S| <= 1 and forall i in S a in A_i)} \
& "pref"(P_2) = {A_0 A_1 ... A_k | forall i dot (i < k and a in A_i -> b in A_(i + 1))} \
& "pref"(P_3) = {A_0 A_1 ... A_k | "true"} \
& "pref"(P_4) = {A_0 A_1 ... A_k | a in A_0} \
$

== Part C
$
& "cl"(P_1) = {A_0 A_1 ... | exists S subset.eq N dot (|S| <= 1 and forall i in S a in A_i)} \
& "cl"(P_2) = {A_0 A_1 ... | forall i dot (a in A_i -> b in A_(i + 1))} \
& "cl"(P_3) = {A_0 A_1 ... | "true" } \
& "cl"(P_4) = {A_0 A_1 ... | a in A_0} \
$
