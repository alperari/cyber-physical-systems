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
  Exercise Sheet 6 Solution*
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
  November 25, 2023
]

= Exercise 1: Linear Time Properties
== Part A
#block(
  $
  & bullet T_1 : {A_0 A_1 A_2 ... | forall i in N_(>0) space . space a in.not A_i} \
  & bullet T_2 : {A_0 A_1 A_2 ... | forall i in N space . space a in A_i -> b in A_(i + 1)} \
  & bullet T_3 : {A_0 A_1 A_2 ... | forall i in N space . space a in A_i -> b in.not A_i} \
  & bullet T_4 : {A_0 A_1 A_2 ... | limits(exists)^infinity i in N space . space a in A_i} \
  & bullet T_5 : {A_0 A_1 A_2 ... | limits(exists)^infinity i in N space . space a in.not A_i} \
  $
)

== Part B
#block(
  $
  & bullet T_1 : {A_0 A_1 A_2 ... | forall i in N space . space a in A_i} \
  & bullet T_2 : {A_0 A_1 A_2 ... | forall i in N space . space a in A_i -> a in A_(i + 1)} \
  & bullet T_3 : {A_0 A_1 A_2 ... | forall i in N space . space a in A_i and b in A_i} \
  & bullet T_4 : {A_0 A_1 A_2 ... | limits(exists)^infinity i in N space . space b in A_i} \
  & bullet T_5 : {A_0 A_1 A_2 ... | forall i in N space . space a in.not A_i} \
  $
)

= Exercise 2: Starvation Freedom
== Part A #label("2-part-a")
We can prove that $"LIVE"' subset.eq "LIVE"$ if we can show that all worlds in $"LIVE"'$ is also in $"LIVE"$.

Let $w in "LIVE"'$, we have the following cases:

Case 1: $w$ doesn't have infinitely many $"wait"_1$s

In this case $w in "LIVE"$ since $w$ doesn't satisfy the predicate $limits(exists)^infinity in N space . space "wait"_1 in A_i$, therefore doesn't need to satisfy $limits(exists)^infinity in N space . space "crit"_1 in A_i$.

Case 2: $w$ has infinitely many $"wait"_1$s

In this case, it follows that $w$ also has infinitely many $"crit"_1$s as well, because for all $"wait"_1 in A_i$ there must be a $"crit"_1 in A_j$ such that $j$ comes after $i$. There can't be a "last" $j$ that comes after all $"wait"_1$s, since there are infinitely many $"wait"_1$s. Which would mean that $"crit"_1$s can be finitely many in this case. Since this is not possible, we can conclude that $w in "LIVE"$. 

Same reasoning can be trivially applied to $"wait"_2$ and $"crit"_2$ as well.

$qed$

== Part B
Consider a language $"LIVE"''$ s.t.:
#block(
  $
  "LIVE"'' := cases(
    "set" "of" "all" "infinite" "traces" A_0 A_1 A_2 ... s.t. \
    forall i in N space . space (
      "wait"_1 in A_i -> exists j in N space . space j < i and "crit"_1 in A_j
    ) \
    forall i in N space . space (
      "wait"_2 in A_i -> exists j in N space . space j < i and "crit"_2 in A_j
    ) \
  )
  $
)

We can follow a similar proof to the #link(label("2-part-a"))[Part A] to conclude $"LIVE"'' subset.eq "LIVE"$. But $"LIVE"'' subset.eq.not "LIVE"'$ since ordering is reversed. Which means there is not necessarily a $"crit_1"$ after  each $"wait"_1$ (And same for $"crit"_2$ and $"wait"_2$). Therefore, $"LIVE"'$ is a _strictly stronger_ property than $"LIVE"$.

== Part C
No, because that system only enters $"crit"_i$ after a $"wait"_i$ is received. Therefore, ordering is always as described in $"LIVE"'$.

== Part D
No, because of #link(label("2-part-a"))[Part A], this is not a possible trace for any transition system.
