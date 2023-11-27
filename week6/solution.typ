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

#pagebreak()

= Exercise 3: Trace Inclusion
== Part A #label("3-a")
=== $tau_P_1$
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=1];

    start1 [style=invis, width=0, height=0, fixedsize=true];
    start2 [style=invis, width=0, height=0, fixedsize=true];

    l0x_eq_0 [label="l_0\nx = 0", xlabel="{x = 0}", shape=circle];
    l0x_gt_0 [label="l_0\nx > 0", xlabel="{x > 0}", shape=circle];
    l1x_eq_0 [label="l_1\nx = 0", xlabel="{x = 0}", shape=circle];

    start1 -> l0x_eq_0;
    start2 -> l0x_gt_0;
    l0x_gt_0 -> l0x_gt_0;
    l0x_eq_0 -> l1x_eq_0;
    l1x_eq_0 -> l1x_eq_0;
    l0x_gt_0 -> l1x_eq_0;
  }
```]

=== $tau_P_2$
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=1];

    start1 [style=invis, width=0, height=0, fixedsize=true];
    start2 [style=invis, width=0, height=0, fixedsize=true];

    l0x_eq_0 [label="l_0\nx = 0", xlabel="{x = 0}", shape=circle];
    l0x_gt_0 [label="l_0\nx > 0", xlabel="{x > 0}", shape=circle];
    l1x_eq_0 [label="l_1\nx = 0", xlabel="{x = 0}", shape=circle];

    start1 -> l0x_eq_0;
    start2 -> l0x_gt_0;
    l0x_gt_0 -> l0x_gt_0;
    l0x_eq_0 -> l1x_eq_0;
    l1x_eq_0 -> l1x_eq_0;
    l0x_gt_0 -> l1x_eq_0;
  }
```]

=== $tau_(P_(3a) bar.triple P_(3b))$
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=1];

    start1 [style=invis, width=0, height=0, fixedsize=true];

    l0l2x_gt_0 [label="l_0 l_2\nx > 0", xlabel="{x > 0}", shape=circle];
    l0l3_x_eq_0 [label="l_0 l_3\n x = 0", xlabel="{x = 0}", shape=circle];
    l1l3x_eq_0 [label="l_1 l_3\n x = 0", xlabel="{x = 0}", shape=circle];

    start1 -> l0l2x_gt_0;
    l0l2x_gt_0 -> l0l2x_gt_0;
    l0l2x_gt_0 -> l0l3_x_eq_0;
    l0l3_x_eq_0 -> l1l3x_eq_0;
    l1l3x_eq_0 -> l1l3x_eq_0;
  }
```]

== Part B
- $(tau_P_1, tau_P_2) = "true"$ and $(tau_P_2, tau_P_1) = "true"$

Their transition systems are identical from #link(label("3-a"))[Part A]. Therefore, their traces are equivalent as well. Therefore, they are subset of each other in both directions.
- $(tau_P_1, tau_(P_(3a) bar.triple P_(3b))) = "false"$ and $(tau_P_2, tau_(P_(3a) bar.triple P_(3b))) = "false"$

Both $tau_P_1$ and $tau_P_2$ has the trace ${x = 0}^omega$ but $tau_(P_(3a) bar.triple P_(3b))$ doesn't.

- $(tau_P_1, tau_4) = "false"$ and $(tau_P_2, tau_4) = "false"$
Both $tau_P_1$ and $tau_P_2$ has the trace ${x = 0}^omega$ but $tau_4$ doesn't.

- $(tau_(P_(3a) bar.triple P_(3b)), tau_4) = "true"$ and $(tau_4, tau_(P_(3a) bar.triple P_(3b))) = "true"$

Both has the same set of traces:
  
#pad(left: 15pt)[
  - ${x > 0}^omega$
  - ${x > 0}^n {x = 0}^omega$ where $n in N_(>0)$
]

Therefore, they are subset of each other.

- $(tau_(P_(3a) bar.triple P_(3b)), tau_P_1) = "true"$ and $(tau_(P_(3a) bar.triple P_(3b)), tau_P_2) = "true"$
Both $tau_P_1$ and $tau_P_2$ has all the traces $tau_(P_(3a) bar.triple P_(3b))$ have so it satisfies the subset relation.

#pad(left: 15pt)[
  - ${x > 0}^omega$ : path $q_1^omega$
  - ${x > 0}^n {x = 0}^omega$ : path $q_1^n q_2^omega$ where $n in N_(>0)$. 
]

- $(tau_4, tau_P_1) = "true"$ and $(tau_4, tau_P_2) = "true"$

Both $tau_P_1$ and $tau_P_2$ has all the traces $tau_4$ have so it satisfies the subset relation.

#pad(left: 15pt)[
  - ${x > 0}^omega$ : path $q_1^omega$
  - ${x > 0}^n {x = 0}^omega$ : path $q_1^n q_2^omega$ where $n in N_(>0)$. 
]

== Part C
This is not possible, because $tau_(P_(3a) bar.triple P_(3b))$ and $tau_4$ are subsets of $tau_P_1$ and $tau_P_2$. So each $E$ that satisfies the latter must necesarily satisfy the former ones due to transitivity.
