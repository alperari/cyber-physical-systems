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
