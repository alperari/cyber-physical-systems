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
  Exercise Sheet 13 Solution*
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
  January 29, 2023
]

== Exercise 1: LTL and Set Notation
=== (a)
$
"Words"(phi_1) = \ {
  A_0 A_1 ... in (2^"AP")^omega |
  forall i in NN . space (a in A_i -> exists j in NN . space j >= i and b in A_j)
}
$

=== (b)
$
"Words"(phi_2) = \ {
  A_0 A_1 ... in (2^"AP")^omega |
  exists i in NN . space (b in A_(i + 1) and (forall j in NN . space j < i -> a in A_j))
}
$

=== (c)
$
phi_3 = diamond (a and circle b)
$

=== (d)
It's not possible to notate this property in LTL. A close formulation is $a and (a -> circle circle a$). But it also forces if $a$ occurs in index one, then $a$ must occur in index 3 as well and so on. But in the original language $a$ only occurs in index one and not continue for odd numbers. 

=== (e)
$
phi_5 = square ( \
  &(a and b -> circle circle (a and b)) and \
  &(a and not b -> circle circle (a and not b)) and \
  &(not a and b -> circle circle (not a and b)) and \
  &(not a and not b -> circle circle (not a and not b)) \
)
$

== Exercise 2: From LTL to NBA
=== (a)
#raw-render()[```dot
  digraph {
    rankdir=LR;

    start [style="invis"];
    s0 [shape="rect"];

    start -> s0;
    s0 -> s0 [label="a"];
    s0 -> s1 [label="true"];
    s1 -> s0 [label="! b"];
  }
```]

=== (b)
#raw-render()[```dot
  digraph {
    rankdir=LR;

    start [style="invis"];
    start2 [style="invis"];
    s1 [shape="rect"];
    s3 [shape="rect"];

    start -> s0;
    s0 -> s0 [label="true"];
    s0 -> s1 [label="a"];
    s1 -> s1 [label="true"];

    start2 -> s2;
    s2 -> s2 [label="true"];
    s2 -> s3 [label="a <-> b"];
    s3 -> s2 [label="true"];
  }
```]

=== (c)
#raw-render()[```dot
  digraph {
    rankdir=LR;

    start [style="invis"];
    s3 [shape="rect"];
    s5 [shape="rect"];

    start -> s1 [label="true"];
    s1 -> s2 [label="true"];
    s2 -> s3 [label="a"];
    s3 -> s3 [label="true"];
    s2 -> s4 [label="true"];
    s4 -> s4 [label="true"];
    s4 -> s5 [label="true"];
    s5 -> s5 [label="b"];
  }
```]

#pagebreak()

== Exercise 3: LTL Equivalence
=== Part 1: $"Words"(phi) = "Words"(psi) -> forall tau . space tau tack.double phi <=> tau tack.double psi$
Let $phi$ and $psi$ be LTL properties and a Transition System $tau$. 

Assume $"Words"(phi) = "Words"(psi)$.

If $tau tack.double phi$ then it means $"Traces"(tau) subset.eq "Words"(phi)$. Since $"Words"(phi) = "Words"(psi)$, we can substitute $"Words"(psi)$, therefore $"Traces"(tau) subset.eq "Words"(psi) eq.triple tau tack.double psi space qed$

=== Part 2: $forall tau . space tau tack.double phi <=> tau tack.double psi -> "Words"(phi) = "Words"(psi)$
Let $phi$ and $psi$ be LTL properties.

We can prove it via proof by contraposition. Assume $"Words"(phi) != "Words"(psi)$. If we find that this implies $not (forall tau . space tau tack.double phi <=> tau tack.double psi)$ then we prove the original claim.

Then there exists a word $omega$ such that one of the two holds:
1. $omega in "Words"(phi) and omega in.not "Words"(psi)$ 
2. $omega in.not "Words"(phi) and omega in "Words"(psi)$

Without loss of generality we will only consider the first case. The second case can be handled in the same way.

Then there exists a Transition System $tau$ such that $"Traces"(tau) = {omega}$. It immediately follows that $"Traces"(omega) subset.eq "Words"(phi) and "Traces"(omega) subset.eq.not "Words"(psi)$. Which means $tau tack.double phi and tau tack.double.not psi$. So $not (forall tau : tau tack.double phi <=> tau tack.double psi)$ holds from the counter example we found.

Since $"Words"(phi) != "Words"(psi) -> not (forall tau : tau tack.double phi <=> tau tack.double psi)$, we conclude that $forall tau : tau tack.double phi <=> tau tack.double psi -> "Words"(phi) = "Words"(psi) space qed$

