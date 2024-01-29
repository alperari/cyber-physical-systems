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
  Exercise Sheet 10 Solution*
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

= Exercise 1: Invariants
== A
*Proposition:* Let $E subset.eq (2^"AP")^omega$ be an LT property. $E$ is not an invariant if and only if there exists a trace $sigma = A_0 A_1 ... in (2^"AP")^omega$ such that $sigma in.not E$, but for every $i in NN$, the set $A_i$ also occurs some other trace $pi_i in E$.

*Proof:* Assume that $E$ is not an invariant and there exists a trace $sigma = A_0 A_1 ... in (2^"AP")^omega$ such that $sigma in.not E$, but for every $i in NN$, the set $A_i$ also occurs some other trace $pi_i in E$. 

Let $Phi$ be the invariant condition of $E$ then, by the definition of invariant we can conclude $forall i in NN dot.c forall sigma' in pi_i dot.c sigma' tack.double Phi$. Because $sigma in.not E$, it means that $exists i in NN dot.c A_i tack.double.not Phi$. And there exists a corresponding $A_i in pi_i and pi_i in E$. This means that $A_i tack.double Phi$ which is a contradiction. So $E$ must be an invariant given the properties it exhibits $qed$

#pagebreak()

== B
=== $E_1$
$
E_1 = { 
  A_0 A_1 ... in (2^"AP")^omega | 
  forall i in NN dot.c (a in A_i -> b in A_(i + 1))
} 
$

Let $w = A_0 A_1 ... = a^omega$ and $p_1 = "ab"^omega$. Clearly $w in.not E_1$ but $p_1 in E_1$. Also $forall i in NN dot.c A_i = a$ and $a in p_1$, hence $E_1$ is not an invariant.

=== $E_2$
$
E_2 = { 
  A_0 A_1 ... in (2^"AP")^omega | 
  forall i, j in NN dot.c A_i = A_j
}
$

$E = {a^omega, b^omega}$. Let $p_2 = A_0 A_1 ... = a(b^omega)$, $p_2 in.not E$. Since $A_0 in a^omega$ and $forall i > 0 dot.c A_j = b and A_j in b^omega$, all sets either contained in $a^omega$ or $b^omega$. Therefore $E_2$ is not an invariant.

=== $E_3$
$
E_3 = { 
  A_0 A_1 ... in (2^"AP")^omega | |{forall i in NN | a in A_i }| >= 2
}
$

Let $pi_3 = a a (b^omega) in E_3$ and $sigma = a a a (b^omega) in.not E_3$. Both $a$ and $b$ is in $pi_3$ and they also in $sigma$. Therefore, $E_3$ is not an invariant.

= Exercise 2: LT Properties
== $P_1$
=== Part A
$
P_1 = { A_0 A_1 ... in (2^"AP")^omega | forall i in NN dot.c a in A_i or b in A_i }
$

=== Part B
It's an invariant with invariant condition $Phi = a or b$.

=== Part C
Since every invariant is a safety property, this is also a safety property. Set of bad prefixes can be denoted as $"BadPref" = { A_0 A_1 ... A_n in (2^"AP")^+ | exists i in 0..n dot.c emptyset = A_i }$

=== Part D
It's not a liveness property, because $P_1$ contains prefixes that can't be extended to satisfy the language. For example $sigma = {a}emptyset{a}$ can't be extended so that it would satisfy the langage.

== $P_2$
=== Part A
$
P_2 = { 
  A_0 A_1 ... in (2^"AP")^omega | 
  (|{ i in NN dot.c a in A_i }| = 1) or
  (forall i in NN dot.c b in.not A_i)
}
$

=== Part B
$P_2$ is not an invariant since there is no such $Phi$ that we can check for individual states.

=== Part C
$P_2$ is a safety property because once the condition is violated in a prefix, it can't be extended to satisfy it. It has the bad prefixes 
$
"BadPref" = { 
  A_0 A_1 ... A_n in  (2^"AP")^+ |  
  (|{ i in 0..n dot.c a in A_i }| > 1) and
  (exists i in 0..n dot.c b in A_i)
}
$

=== Part D
$P_2$ is not a liveness property because it contains prefixes that can't be added into language by appending some trace. For example: $sigma = {a}{a, b}$.

== $P_3$
The wording "b will never hold in the next step" is ambiguous. It's not clear if b doesn't hold in the next (subsequent) step or for all later steps. I am assuming that it's only the next step.

=== Part A
$
P_3 = {
  A_0 A_1 ... in (2^"AP")^omega | 
  forall i in NN dot.c (a in A_i -> b in.not A_(i + 1))
}
$

=== Part B
$P_3$ is not an invariant because the constraint involves subsequent steps. Therefore, it's not possible to write a propositional logic formula $Phi$ that would be evaluated for each step.

=== Part C
$P_3$ is a safety property because it has bad prefixes. Set of bad prefixes are:
$
"BadPref" = {
  A_0 A_1 ... A_n in (2^"AP")^+ |  
  exists i in 1..n dot.c a in A_(i - 1) and b in A_i
}
$

=== Part D
$P_3$ is not a liveness property because there are bad prefixes for this language. Those bad prefixes can't be extended to satisfy the language, so the language doesn't satisfy of the condition of liveness properties having $(2^"AP")^+$ as the prefix set.

== $P_4$
=== Part A
$
P_4 = {
  A_0 A_1 ... in (2^"AP")^omega | 
  forall i in NN dot.c (
    a in A_i -> (
      exists j >= i dot.c b in A_j
    )
  )
}
$

=== Part B
$P_4$ is not an invariant because the language constraint involves multiple steps to check. Therefore, it's not possible to write a propositional logic formula $Phi$ that would be evaluated for each step.

#label("P_4_part_c")
=== Part C
$P_4$ is not a safety property, because for any prefix $sigma in (2^"AP")^+$ we can append $w = A_0 A_1 ... in (2^"AP")^omega dot.c (forall i in NN dot.c (a in A_i -> b in A_(i + 1)))$ which means $sigma w in P_4$. Hence $"BadPref" = emptyset$.

=== Part D
$P_4$ is a liveness property because as explained in #link(label("P_4_part_c"), "Part C") we can extend any finite prefix $sigma in (2^"AP")^+$ with a trace $w in (2^"AP")^omega$ so that $sigma w in P_4$.

== $P_5$
=== Part A
$
P_5 = {
  A_0 A_1 ... in (2^"AP")^omega | 
  forall i in NN dot.c {a, b} != A_i
}
$

=== Part B
$P_5$ is an invariant with the invariant condition $Phi = not (a and b)$.

=== Part C
Since $P_5$ is an invariant, it's automatically a safety property. The set of bad prefixes are:
$
"BadPref" = {
  A_0 A_1 ... A_n in (2^"AP")^+ |
  exists i in 0..n dot.c {a, b} = A_i
}
$

=== Part D
Since $P_5$ is a safety property, it can't be a liveness property. A counter example is prefix $sigma = {a, b}$. Because for any $forall w in (2^"AP")^omega dot.c sigma w in.not P_5$.

== $P_6$
=== Part A
$
P_6 = {
  A_0 A_1 ... in (2^"AP")^omega |
  (limits(exists)^infinity i in NN dot.c a in A_i) ->
  (limits(exists)^infinity i in NN dot.c b in A_i)
}
$

=== Part B
$P_6$ is not an invariant because condition requires checking multiple steps at the same time. Therefore there is no boolean proposition formula $Phi$ to check for a single step.

#label("P_6_part_c")
=== Part C
$P_6$ is not a safety property, because for any bad prefix $sigma in (2^"AP")^+$ we can append $w = A_0 A_1 ... in (2^"AP")^omega | limits(exists)^infinity i in NN dot.c b in A_i$ which means $sigma w in P_6$. Hence $"BadPref" = emptyset$.

=== Part D
$P_6$ is a liveness property because as explained in #link(label("P_6_part_c"), "Part C") we can extend any finite prefix $sigma in (2^"AP")^+$ with a trace $w in (2^"AP")^omega$ so that $sigma w in P_6$.

== $P_7$
=== Part A
$
P_7 = {
  A_0 A_1 ... in (2^"AP")^omega |
  exists i in NN dot.c 
  forall j > i dot.c
  a in.not A_j
}
$

=== Part B
$P_7$ is not an invariant because the condition involves checking multiple steps at the same time. Therefore there is no boolean proposition formula $Phi$ to check for a single step.

#label("P_7_part_c")
=== Part C
$P_7$ is not a safety property, because for any bad prefix $sigma in (2^"AP")^+$ we can append $w = A_0 A_1 ... in (2^"AP")^omega | forall i in NN dot.c a in.not A_i$ which means $sigma w in P_7$. Hence $"BadPref" = emptyset$.

=== Part D
$P_6$ is a liveness property because as explained in #link(label("P_7_part_c"), "Part C") we can extend any finite prefix $sigma in (2^"AP")^+$ with a trace $w in (2^"AP")^omega$ so that $sigma w in P_7$.

== $P_8$

=== Part A
$
P_8 = {
  A_0 A_1 ... in (2^"AP")^omega |
  "true"
}
$

=== Part B
$P_8$ is an invariant with the invariant condition $Phi = "true"$.

=== Part C
$P_8$ is a safety property, because even if it doesn't have any bad prefixes it doesn't have any traces that is not in the language either. So it doesn't need to have any bad prefixes.

=== Part D
$P_8$ is a liveness property, because $"pref"(P_8) = (2^"AP")^+$.

= Exercise 3: Mutual Exclusion
== Part A
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=1.5];

    start [fixedsize=true; width=0, height=0, label=""];
    ncrit_1ncrit_2 [label="ncrit_1 ncrit_2"];
    wait_1ncrit_2  [label="wait_1 ncrit_2"];
    ncrit_1wait_2  [label="ncrit_1 wait_2"];
    crit_1ncrit_2  [label="crit_1 ncrit_2"];
    wait_1wait_2   [label="wait_1 wait_2"];
    ncrit_1crit_2  [label="ncrit_1 crit_2"];
    crit_1wait_2   [label="crit_1 wait_2"];
    wait_1crit_2   [label="wait_1 crit_2"];
    crit_1crit_2   [label="crit_1 crit_2"];
    
    start -> ncrit_1ncrit_2         [xlabel="x == 0"];
    ncrit_1ncrit_2 -> wait_1ncrit_2 [xlabel="x := 2"];
    ncrit_1ncrit_2 -> ncrit_1wait_2 [xlabel="x := 1"];
    wait_1ncrit_2 -> crit_1ncrit_2  [xlabel="x == 1"];
    wait_1ncrit_2 -> wait_1wait_2   [xlabel="x := 1"];
    ncrit_1wait_2 -> wait_1wait_2   [xlabel="x := 2"];
    ncrit_1wait_2 -> ncrit_1crit_2  [xlabel="x == 2"];
    crit_1ncrit_2 -> crit_1wait_2   [xlabel="x := 1"];
    wait_1wait_2 -> crit_1wait_2    [xlabel="x == 1"];
    wait_1wait_2 -> wait_1crit_2    [xlabel="x == 2"];
    ncrit_1crit_2 -> wait_1crit_2   [xlabel="x := 2"];
    crit_1wait_2 -> crit_1crit_2    [xlabel="x == 2"];
    wait_1crit_2 -> crit_1crit_2    [xlabel="x == 1"];
  }
```]

== Part B
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=2, height=1];

    start [fixedsize=true; width=0, height=0, label=""];
    ncrit_1ncrit_2x0 [label="ncrit_1 ncrit_2\nx=0\n{}"];
    wait_1ncrit_2x2 [label="wait_1 ncrit_2\nx=2\n{}"];
    ncrit_1wait_2x1 [label="ncrit_1 wait_2\nx=1\n{}"];
    wait_1wait_2x1 [label="wait_1 wait_2\nx=1\n{}"];
    wait_1wait_2x2 [label="wait_1 wait_2\nx=2\n{}"];
    crit_1wait_2x1 [label="crit_1 wait_2\nx=1\n{crit_1}"];
    wait_1crit_2x2 [label="wait_1 crit_2\nx=2\n{crit_2}"];

    {rank=same; wait_1ncrit_2x2; ncrit_1wait_2x1}
    
    start -> ncrit_1ncrit_2x0 [label="x == 0"];
    ncrit_1ncrit_2x0 -> wait_1ncrit_2x2 [label="x := 2"];
    ncrit_1ncrit_2x0 -> ncrit_1wait_2x1 [label="x := 1"];
    wait_1ncrit_2x2 -> wait_1wait_2x1 [label="x := 1"];
    ncrit_1wait_2x1 -> wait_1wait_2x2 [label="x := 2"];
    wait_1wait_2x1 -> crit_1wait_2x1 [label="x == 1"];
    wait_1wait_2x2 -> wait_1crit_2x2 [label="x == 2"];
    crit_1wait_2x1 -> ncrit_1wait_2x1;
    wait_1crit_2x2 -> wait_1ncrit_2x2;
    
  }
```]

== Part C
Yes because in all states, invariatn $Phi = not "crit"_1 or not "crit"_2$ is satisfied.

== Part D
Yes, because both mutual exclusion and fairness is satisfied in this TS. Fairness is satisfied because the system forces alternating sequences of critical sequence entrance for both programs.

= Exercise 4: Mutual Exclusion without Request

== Part A
$"TS"_1 bar.triple "TS"_2$

#raw-render()[```dot
  digraph { 
    rankdir=TD;

    node [fixedsize=true, width=1];

    idle_idle [label="<idle, idle>"];
    crit_idle [label="<crit, idle>"];
    idle_crit [label="<idle, crit>"];
    crit_crit [label="<crit, crit>"];

    {rank=min; idle_idle}
    {rank=same; crit_idle; idle_crit;}
    {rank=max; crit_crit}

    idle_idle -> crit_idle [label=enter];
    idle_idle -> idle_crit [label=enter];
    crit_idle -> crit_crit [label=enter];
    idle_crit -> crit_crit [label=enter];
    crit_idle -> idle_idle [label=exit];
    idle_crit -> idle_idle [label=exit];
    crit_crit -> crit_idle [label=exit];
    crit_crit -> idle_crit [label=exit];
  }
```]

=== Transitions
$
& angle.l "idle", "idle" angle.r limits(-->)^"enter" angle.l "crit", "idle" angle.r : frac(
  "idle" attach(limits(-->)^"enter", br: 1) "crit", 
  angle.l "idle" \, "idle" angle.r limits(-->)^"enter" angle.l "crit" \, "idle" angle.r
) : "SOS"_1 \
& angle.l "idle", "idle" angle.r limits(-->)^"enter" angle.l "idle", "crit" angle.r : frac(
  "idle" attach(limits(-->)^"enter", br: 2) "crit", 
  angle.l "idle" \, "idle" angle.r limits(-->)^"enter" angle.l "idle" \, "crit" angle.r
) : "SOS"_2 \
& angle.l "crit", "idle" angle.r limits(-->)^"enter" angle.l "idle", "idle" angle.r : frac(
  "crit" attach(limits(-->)^"exit", br: 1) "idle", 
  angle.l "crit" \, "idle" angle.r limits(-->)^"exit" angle.l "idle" \, "idle" angle.r
) : "SOS"_1 \
& angle.l "idle", "crit" angle.r limits(-->)^"enter" angle.l "idle", "idle" angle.r : frac(
  "crit" attach(limits(-->)^"exit", br: 2) "idle", 
  angle.l "idle" \, "crit" angle.r limits(-->)^"exit" angle.l "crit" \, "idle" angle.r
) : "SOS"_2 \
& angle.l "crit", "idle" angle.r limits(-->)^"enter" angle.l "crit", "crit" angle.r : frac(
  "idle" attach(limits(-->)^"enter", br: 2) "crit", 
  angle.l "crit" \, "idle" angle.r limits(-->)^"enter" angle.l "crit" \, "crit" angle.r
) : "SOS"_2 \
& angle.l "idle", "crit" angle.r limits(-->)^"enter" angle.l "crit", "crit" angle.r : frac(
  "idle" attach(limits(-->)^"enter", br: 1) "crit", 
  angle.l "idle" \, "crit" angle.r limits(-->)^"enter" angle.l "crit" \, "crit" angle.r
) : "SOS"_1 \
& angle.l "crit", "crit" angle.r limits(-->)^"exit" angle.l "idle", "crit" angle.r : frac(
  "crit" attach(limits(-->)^"exit", br: 1) "idle", 
  angle.l "crit" \, "crit" angle.r limits(-->)^"exit" angle.l "idle" \, "crit" angle.r
) : "SOS"_1 \
& angle.l "crit", "crit" angle.r limits(-->)^"exit" angle.l "crit", "idle" angle.r : frac(
  "crit" attach(limits(-->)^"exit", br: 2) "idle", 
  angle.l "crit" \, "crit" angle.r limits(-->)^"exit" angle.l "crit" \, "idle" angle.r
) : "SOS"_2 \
$ 

== Part B
#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=2];

    idle_idle_unlock [label="<idle, idle, unlock>"];
    crit_idle_lock [label="<crit, idle, lock>"];
    idle_crit_lock [label="<idle, crit, lock>"];

    idle_idle_unlock -> crit_idle_lock [label="enter"];
    idle_idle_unlock -> idle_crit_lock [label="enter"];
    crit_idle_lock -> idle_idle_unlock [label="exit"];
    idle_crit_lock -> idle_idle_unlock [label="exit"];
  }
```]

=== Transitions

All relations are formed via $"SOS"_3$, which is the rule:
$
frac(
  s limits(-->_1)^alpha s' and q limits(-->_2)^alpha q',
  angle.l s \, q angle.r limits(-->)^alpha angle.l s' \, q' angle.r,
)
$

$
& angle.l "idle" \, "idle" \, "unlock" angle.r 
  limits(-->)^"enter"
  angle.l "crit" \, "idle" \, "lock" angle.r :
  frac(
    angle.l "idle" \, "idle" angle.r attach(limits(-->)^"enter", br: 1) angle.l "crit" \, "idle" angle.r and
    "unlock" limits(attach(-->, br: 2))^"enter" "lock",
    angle.l "idle" \, "idle" \, "unlock" angle.r 
    limits(-->)^"enter"
    angle.l "crit" \, "idle" \, "lock" angle.r,
  ) : "SOS"_3, \
& angle.l "idle" \, "idle" \, "unlock" angle.r 
  limits(-->)^"enter"
  angle.l "idle" \, "crit" \, "lock" angle.r :
  frac(
    angle.l "idle" \, "idle" angle.r 
    attach(limits(-->)^"enter", br: 1) 
    angle.l "crit" \, "idle" angle.r and
    "unlock" limits(attach(-->, br: 2))^"enter" "lock",
    angle.l "idle" \, "idle" \, "unlock" angle.r 
    limits(-->)^"enter"
    angle.l "crit" \, "idle" \, "lock" angle.r,
  ) : "SOS"_3, \
  & angle.l "idle" \, "crit" \, "lock" angle.r 
  limits(-->)^"exit"
  angle.l "idle" \, "idle" \, "unlock" angle.r :
  frac(
    angle.l "idle" \, "crit" angle.r 
    attach(limits(-->)^"exit", br: 1) 
    angle.l "idle" \, "idle" angle.r and
    "lock" limits(attach(-->, br: 2))^"exit" "unlock",
    angle.l "idle" \, "crit" \, "lock" angle.r 
    limits(-->)^"exit"
    angle.l "idle" \, "idle" \, "unlock" angle.r,
  ) : "SOS"_3, \
  & angle.l "crit" \, "idle" \, "lock" angle.r 
  limits(-->)^"exit"
  angle.l "idle" \, "idle" \, "unlock" angle.r :
  frac(
    angle.l "crit" \, "idle" angle.r 
    attach(limits(-->)^"exit", br: 1) 
    angle.l "idle" \, "idle" angle.r and
    "lock" limits(attach(-->, br: 2))^"exit" "unlock",
    angle.l "crit" \, "idle" \, "lock" angle.r 
    limits(-->)^"exit"
    angle.l "idle" \, "idle" \, "unlock" angle.r,
  ) : "SOS"_3, \
$

= Exercise 5: Hardware Circuit
$
r' = x and (not r) \ 
y = x or r
$

#raw-render()[```dot
  digraph {
    rankdir=TD;

    node [fixedsize=true, width=1, height=1];

    start1 [fixedsize=true; width=0, height=0, label=""];
    start2 [fixedsize=true; width=0, height=0, label=""];
    x0r0 [label="x=0\nr=0\n{}"];
    x1r0 [label="x=1\nr=0\n{X, Y}"];
    x1r1 [label="x=1\nr=1\n{X, Y, R}"];

    {rank=same; start1; start2}
    {rank=same; x0r0; x1r0}

    start1 -> x0r0;
    start2 -> x1r0;
    x0r0 -> x0r0;
    x0r0 -> x1r1;
    x1r0 -> x0r0;
    x1r0 -> x1r1;
    x1r1 -> x0r0;
    x1r1 -> x1r0;
  }
```]
