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
  Exercise Sheet 14 Solution*
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
  February 7, 2023
]

#pagebreak()

== Exercise 1: Transition Systems, Program Graphs, Interleaving
#image("assets/CyberPhysicalEx14-1.jpg")

== Exercise 2: From LTL to NBA and Back
#image("assets/CyberPhysicalEx14-2.jpg")

#pagebreak()

== Exercise 3: LT Properties for a Program
$
"AP" = { x = 0 , x > 1 }
$

Assuming that "x is equal to 0" doesn't hold for $"AP" = { x = 0 , x > 1}$ and only holds for $"AP" = {x = 0}$. Similar assumption is made for "x differs from 0" as well.

=== Part A
- a) ${A_0 A_1 ... in (2^"AP")^omega | "false"}$
- b) ${A_0 A_1 ... in (2^"AP")^omega | {x = 0} = A_0}$
- c) ${A_0 A_1 ... in (2^"AP")^omega | {x > 1} = A_0}$
- d) ${A_0 A_1 ... in (2^"AP")^omega | {x = 0} = A_0 and exists i in NN_1 . {x = 1} = A_i}$
- e) ${A_0 A_1 ... in (2^"AP")^omega | limits(forall)^infinity i in NN . space {x > 1} != A_i}$
- f) ${A_0 A_1 ... in (2^"AP")^omega | limits(exists)^infinity i in NN . space {x > 1} = A_i}$
- g) ${A_0 A_1 ... in (2^"AP")^omega | "true"}$

=== Part B
- a) It's a safety property because it satisfies the condition that all traces that are not in the language has a bad prefix. Since there are no traces in the property, any finite trace is a bad prefix for this language.
- b) It's a safety property with $"BadPref" = {A_0 A_1 ... A_n in (2^"AP")^+ | {x = 0} != A_0}$
- c) It's a safety property with $"BadPref" = {A_0 A_1 ... A_n in (2^"AP")^+ | {x > 0} != A_0}$
- d) It's not a safety property. One counter example is $sigma = {x = 0}^omega$. $sigma$ does not satisfy this lt property, however all of it's finite prefixes can be extended to satisfy the property by appending ${x > 1}$ at some point. Therefore, this trace doesn't have any prefix that is a bad prefix of the language of this property.
- e) It's not a safety property because it's a liveness property. It's a liveness property because for any finite prefix we can extend it so that ${x > 1}$ does not appear infinitely often.
- f) Similar to part e), this is also a liveness property because we can extend any finite prefix such that ${x > 1}$ appears infinitely often. Therefore it's not a safety property.
- g) It's a safety property, because there are no traces that is not in the language of this property. Therefore it satisfies the safety property condition trivially.

== Exercise 4: Fair Equivalence
=== a)
If $phi_1 eq.triple_"fair" phi_2$ and $psi_1 eq.triple_"fair" psi_2$, then $(phi_1 or psi_1) eq.triple_"fair" (phi_2 or psi_2)$.

We know that $(phi_1 or psi_1) eq.triple_"fair" (phi_2 or psi_2)$ is equivalent to $"fair" -> (phi_1 or psi_1) eq.triple "fair" -> (phi_2 or psi_2)$.

We need to show that:
1. $"Words"("fair" -> (phi_1 or psi_1)) subset.eq "Words"("fair" -> (phi_2 or psi_2))$ 
2. $"Words"("fair" -> (phi_2 or psi_2)) subset.eq "Words"("fair" -> (phi_1 or psi_1))$

Then the equivalence holds.

Without loss of generality, we can prove just the lemma 1. Lemma 2. can be proven in the same fashion.

Let $sigma tack.double "Words"("fair" -> (phi_1 or psi_1))$. Then:
1. $sigma tack.double.not "fair"$: Then $sigma tack.double "fair" -> (phi_2 or psi_2)$ holds trivially.
2. $sigma tack.double "fair"$: Then we also know that $sigma tack.double (phi_1 or psi_1)$. Then we have the following cases:
  1. $sigma tack.double phi_1$: Then from $phi_1 eq.triple_"fair" phi_2$ we can claim $sigma tack.double phi_2$ as well. And therefore $sigma tack.double (phi_2 or psi_2)$. Hence, $sigma tack.double "fair" -> (phi_2 or psi_2)$.
  2. $sigma tack.double psi_1$: Then from $psi_1 eq.triple_"fair" psi_2$ we can claim $sigma tack.double psi_2$ as well. And therefore $sigma tack.double (psi_2 or psi_2)$. Hence, $sigma tack.double "fair" -> (phi_2 or psi_2)$.

Since $forall sigma in "Words"("fair" -> (phi_1 or psi_1)) . space sigma in "Words"("fair" -> (phi_2 or psi_2))$,  $"Words"("fair" -> (phi_1 or psi_1)) subset.eq "Words"("fair" -> (phi_2 or psi_2))$. Applying the same steps for the other direction we can conclude that $(phi_1 or psi_1) eq.triple_"fair" (phi_2 or psi_2)$ $qed$

=== b)
If $phi_1 eq.triple_"fair" phi_2$, then $(circle phi_1) eq.triple_"fair" (circle phi_2)$.

We know that $(circle phi_1) eq.triple_"fair" (circle phi_2)$ is equivalent to $"fair" -> (circle phi_1) eq.triple "fair" -> (circle phi_2)$.

We need to show that:
1. $"Words"("fair" -> (circle phi_1)) subset.eq "Words"("fair" -> (circle phi_2))$ 
2. $"Words"("fair" -> (circle phi_2)) subset.eq "Words"("fair" -> (circle phi_1))$

Then the equivalence holds.

Without loss of generality, we can prove just the lemma 1. Lemma 2. can be proven in the same fashion.

Let $sigma tack.double "fair" -> (circle phi_1)$. Then:
1. $sigma tack.double.not "fair"$: Then $sigma tack.double "fair" -> (circle phi_2)$ holds trivially.
2. $sigma tack.double "fair"$: Then we also know that $sigma tack.double (circle phi_1)$. Let $sigma' = sigma[1..]$. We know that $sigma' tack.double phi_1$. Also $sigma' tack.double "fair"$ because $sigma'$ is a suffix of $sigma$. So $sigma' tack.double "fair" -> phi_1$. From $phi_1 eq.triple_"fair" phi_2$, we can conclude that $sigma' tack.double "fair" -> phi_2$. And because $sigma' tack.double "fair"$, $sigma' tack.double phi_2$ also holds. Thus $sigma tack.double (circle phi_2)$. Hence we conclude $sigma tack.double "fair" -> (circle phi_2)$.

Since $forall sigma in "Words"("fair" -> (circle phi_1)) . space sigma in "Words"("fair" -> (circle phi_2))$,  $"Words"("fair" -> (circle phi_1)) subset.eq "Words"("fair" -> (circle phi_2))$. Applying the same steps for the other direction we can conclude that $(circle phi_1) eq.triple_"fair" (circle phi_2)$ $qed$

=== c)
If $phi_1 eq.triple_"fair" phi_2$ $psi_1 eq.triple_"fair" psi_2$, then $(phi_1 U psi_1) eq.triple_"fair" (phi_2 U psi_2)$.

We know that $(phi_1 U psi_1) eq.triple_"fair" (phi_2 U psi_2)$ is equivalent to $"fair" -> (phi_1 U psi_1) eq.triple "fair" ->  (phi_2 U psi_2)$.

We need to show that:
1. $"Words"("fair" -> (phi_1 U psi_1)) subset.eq "Words"("fair" -> (phi_2 U psi_2))$ 
2. $"Words"("fair" -> (phi_2 U psi_2)) subset.eq "Words"("fair" -> (phi_1 U psi_1))$

Then the equivalence holds.

Without loss of generality, we can prove just the lemma 1. Lemma 2. can be proven in the same fashion.

Let $sigma tack.double "fair" -> (phi_1 U psi_1)$. Then:
1. $sigma tack.double.not "fair"$: Then $sigma tack.double "fair" -> (phi_2 or psi_2)$ holds trivially.
2. $sigma tack.double "fair"$: Then it must follow that $sigma tack.double phi_1 U psi_1$. There exists an $i in NN$ such that $sigma[i..] tack.double psi_1$ and $forall j in NN . space j < i -> sigma[j..] tack.double phi_1$.

  Since every suffix of $sigma$ is also fair, from $phi_1 eq.triple_"fair" phi_2$ we can conclude $forall j in NN . space j < i -> sigma[j..] tack.double phi_2$. And similarly from $psi_1 eq.triple_"fair" psi_2$ we can conlude $sigma[i..] tack.double psi_2$. Therefore $sigma tack.double phi_2 U psi_2$ where the break point is $i$. Then $sigma tack.double "fair" -> phi_2 U psi_2$.

Since $forall sigma in "Words"("fair" -> (phi_1 U psi_1)) . space sigma in "Words"("fair" -> (phi_2 U psi_2))$,  $"Words"("fair" -> (phi_1 U psi_1)) subset.eq "Words"("fair" -> (phi_2 U psi_2))$. Applying the same steps for the other direction we can conclude that $(phi_1 U psi_1) eq.triple_"fair" (phi_2 U psi_2)$ $qed$
