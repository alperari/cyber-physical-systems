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
  Exercise Sheet 4 Solution*
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
  November 12, 2023
]

= Exercise 1: Railroad Crossing
== A
Because train's _enter_ action and gate's _lower_ action are not synchronized, the model allows to train to enter before the gate is lowered.

== B
#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    raw-render(height: 3in, width: 2in)[```dot
      digraph {
        rankdir=TD;

        label="Train'";

        node [fixedsize=true, width=0.75];

        start_train [style=invis; width=0, height=0, fixedsize=true];
        far [shape=circle];
        near [shape=circle];
        in [shape=circle];

        {rank=same; start_train; far; near}

        start_train -> far;
        far -> near [label="approach"];
        near -> in [label="enter"];
        in -> far [label="exit"];
      }
    ```],
    raw-render(height: 3in, width: 2in)[```dot
      digraph {
        rankdir=TD;
        
        label="Controller'";

        node [fixedsize=true, width=0.75];
        
        start_controller [style=invis; width=0, height=0, fixedsize=true];
        0 [shape=circle];
        1 [shape=circle];
        2 [shape=circle];
        3 [shape=circle];
        dummy [style=invis];
        4 [shape=circle];

        {rank=same; 0}
        {rank=same; 4; 1}
        {rank=same; 2; 3}

        start_controller -> 0;
        0 -> 1 [label="approach"];
        1 -> 2 [label="lower"];
        3 -> 2 [label="enter", dir=back];
        3 -> 4 [label="exit"];
        4 -> 0 [xlabel="raise"];
        
        # for layout
        0 -> dummy [style=invis];
      }
    ```],
    raw-render(height: 3in, width: 2in)[```dot
      digraph {
        rankdir=TD;

        label="Gate'";

        node [fixedsize=true, width=0.75];

        start_gate [style=invis; width=0, height=0, fixedsize=true];
        up [shape=circle];
        down [shape=circle];

        {rank=min; start_gate}
        
        start_gate -> up
        up -> down [xlabel="lower"];
        up -> down [style=invis];
        up -> down [label="raise", dir=back];
      }
    ```]
  )
]

== C
#raw-render[```dot
  digraph {
    rankdir=TD;

    label="Train' || Controller' || Gate'"

    node [fixedsize=true, width=1];

    start [style=invis, width=0, height=0, fixedsize=true];
    node [shape=Mrecord];
    far0up [label="<f0> far | <f1> 0 | <f2> up"];
    near1up [label="<f0> near | <f1> 1 | <f2> up"];
    near2down [label="<f0> near | <f1> 2 | <f2> down"];
    in3down [label="<f0> in | <f1> 3 | <f2> down"];
    far4down [label="<f0> far | <f1> 4 | <f2> down"];

    {rank=min; start}
    
    start -> far0up;
    far0up -> near1up [label="approach"];
    near1up -> near2down [label="lower"];
    near2down -> in3down [label="enter"];
    in3down -> far4down [label="exit"];
    far4down -> far0up [label="raise"];
  }
```]

= Exercise 2: Hardware Circuit and Transition System
#raw-render()[```dot
digraph {
  rankdir=LR;

  node [fixedsize=true, width=1];

  start1 [style=invis, width=0, height=0, fixedsize=true];
  start2 [style=invis, width=0, height=0, fixedsize=true];

  x0r0 [shape=circle, label="x = 0 \n r = 0", xlabel="{y}"];
  x0r1 [shape=circle, label="x = 0 \n r = 1", xlabel="{r}"];
  x1r0 [shape=circle, label="x = 1 \n r = 0", xlabel="{x, y}"];
  x1r1 [shape=circle, label="x = 1 \n r = 1", xlabel="{x, r, y}"];

  {rank=min; start1; start2}
  {rank=same; x0r1; x1r1}
  {rank=same; x0r0; x1r0}
  start1 -> x0r1;
  start2 -> x1r1;
  x1r1 -> x0r1;
  x0r1 -> x0r0;
  x1r0 -> x0r0;
  x0r0 -> x1r0;
  x0r1 -> x1r0;
  x0r0:s -> x0r0:s [];
  x1r0 -> x1r0;
  x1r1 -> x1r1;
  

}
```]

= Exercise 3: Paralellism - Interleaving
== Part A
#align(center)[
  #grid(
    columns: (1fr, 1fr),
    raw-render()[```dot
      digraph {
        rankdir=TD;

        label = "P1";

        node [fixedsize=true, width=1];

        start [style=invis, width=0, height=0, fixedsize=true];
        L11 [shape=circle];
        L12 [shape=circle];
        L13 [shape=circle];

        start -> L11;
        L11 -> L12 [label="r1 := x + 1"];
        L12 -> L13 [label="x := r1"];
      }
    ```],
    raw-render()[```dot
      digraph {
        rankdir=TD;

        label = "P2";

        node [fixedsize=true, width=1];

        start [style=invis, width=0, height=0, fixedsize=true];
        L21 [shape=circle];
        L22 [shape=circle];
        L23 [shape=circle];

        start -> L21;
        L21 -> L22 [label="r2 := 3 * x"];
        L22 -> L23 [label="x := r2"];
      }
    ```],
  )
]

== Part B
#raw-render()[```dot
  digraph {
    rankdir=TD;

    label = "P1 ||| P2";

    node [fixedsize=true, width=1.2];

    start [style=invis, width=0, height=0, fixedsize=true];
    L11L21 [label="L11, L21", shape=circle];
    L12L21 [label="L12, L21", shape=circle];
    L11L22 [label="L11, L22", shape=circle];
    L13L21 [label="L13, L21", shape=circle];
    L12L22 [label="L12, L22", shape=circle];
    L11L23 [label="L11, L23", shape=circle];
    L13L22 [label="L13, L22", shape=circle];
    L12L23 [label="L12, L23", shape=circle];
    L13L23 [label="L13, L23", shape=circle];

    {rank=min; start}
    {rank=same; L11L21}
    {rank=same; L12L21; L11L22}
    {rank=same; L13L21; L12L22; L11L23}
    {rank=same; L13L22; L12L23}
  
    start -> L11L21;
    L11L21 -> L12L21 [label="r1 := x + 1;"];
    L11L21 -> L11L22 [label="r2 := 3 * x;"];
    L12L21 -> L13L21 [label="x := r1;"];
    L12L21 -> L12L22 [label="r2 := 3 * x;"];
    L11L22 -> L12L22 [label="r1 := x + 1;"];
    L11L22 -> L11L23 [label="x := r2;"];
    L13L21 -> L13L22 [label="r2 := 3 * x;"];
    L12L22 -> L13L22 [label="x := r1;"];
    L12L22 -> L12L23 [label="x := r2;"];
    L11L23 -> L12L23 [label="r1 := x + 1;"];
    L13L22 -> L13L23 [label="x := r2;"];
    L12L23 -> L13L23 [label="x := r1;"];
  }
```]

== Part C
// Labels if necessary

#raw-render()[```dot
  digraph {
    rankdir=TD;

    label = "T(P1 ||| P2)";

    node [fixedsize=true, width=1.2];

    start [style=invis, width=0, height=0, fixedsize=true];
    
    L11L21x1r0r0 [label="L11, L21 \n x = 1 \n r1 = 0, r2 = 0", shape=circle];
    L12L21x1r2r0 [label="L12, L21 \n x = 1 \n r1 = 2, r2 = 0", shape=circle];
    L11L22x1r0r3 [label="L11, L22 \n x = 1 \n r1 = 0, r2 = 3", shape=circle];
    L13L21x2r2r0 [label="L13, L21 \n x = 2 \n r1 = 2, r2 = 0", shape=circle];
    L12L22x1r2r3 [label="L12, L22 \n x = 1 \n r1 = 2, r2 = 3", shape=circle];
    L11L23x3r0r3 [label="L11, L23 \n x = 3 \n r1 = 0, r2 = 3", shape=circle];
    L13L22x2r2r6 [label="L13, L22 \n x = 2 \n r1 = 2, r2 = 6", shape=circle];
    L13L22x2r2r3 [label="L13, L22 \n x = 2 \n r1 = 2, r2 = 3", shape=circle];
    L12L23x3r2r3 [label="L12, L23 \n x = 3 \n r1 = 2, r2 = 3", shape=circle];
    L12L23x3r4r3 [label="L12, L23 \n x = 3 \n r1 = 4, r2 = 3", shape=circle];
    L13L23x6r2r6 [label="L13, L23 \n x = 6 \n r1 = 2, r2 = 6", shape=circle];
    L13L23x3r2r3 [label="L13, L23 \n x = 3 \n r1 = 2, r2 = 3", shape=circle];
    L13L23r2r2r3 [label="L13, L23 \n x = 2 \n r1 = 2, r2 = 3", shape=circle];
    L13L23x4r4r3 [label="L13, L23 \n x = 4 \n r1 = 4, r2 = 3", shape=circle];

    {rank=min; start}
    {rank=same; L12L21x1r2r0; L11L22x1r0r3}
    {rank=same; L13L21x2r2r0;L12L22x1r2r3; L11L23x3r0r3}
    {rank=same; L13L22x2r2r6; L13L22x2r2r3; L12L23x3r2r3; L12L23x3r4r3}
    {rank=same; L13L23x6r2r6; L13L23x3r2r3; L13L23r2r2r3; L13L23x4r4r3}

    start -> L11L21x1r0r0;
    L11L21x1r0r0 -> L12L21x1r2r0;
    L11L21x1r0r0 -> L11L22x1r0r3;
    L12L21x1r2r0 -> L13L21x2r2r0;
    L12L21x1r2r0 -> L12L22x1r2r3;
    L11L22x1r0r3 -> L12L22x1r2r3;
    L11L22x1r0r3 -> L11L23x3r0r3;
    L13L21x2r2r0 -> L13L22x2r2r6;
    L12L22x1r2r3 -> L13L22x2r2r3;
    L12L22x1r2r3 -> L12L23x3r2r3;
    L11L23x3r0r3 -> L12L23x3r4r3;
    L13L22x2r2r6 -> L13L23x6r2r6;
    L13L22x2r2r3 -> L13L23x3r2r3;
    L12L23x3r2r3 -> L13L23r2r2r3;
    L12L23x3r4r3 -> L13L23x4r4r3;
  }
```]
// Edges with labels:
/* L11L21x1r0r0 -> L12L21x1r2r0 [label="r1 := x + 1;"];
L11L21x1r0r0 -> L11L22x1r0r3 [label="r2 = 3 * x;"];
L12L21x1r2r0 -> L13L21x2r2r0 [label="x := r1;"];
L12L21x1r2r0 -> L12L22x1r2r3 [label="r2 := 3 * x;"];
L11L22x1r0r3 -> L12L22x1r2r3 [label="r1 := x + 1;"];
L11L22x1r0r3 -> L11L23x3r0r3 [label="x := r2;"];
L13L21x2r2r0 -> L13L22x2r2r6 [label="r2 := 3 * x;"];
L12L22x1r2r3 -> L13L22x2r2r3 [label="x := r1;"];
L12L22x1r2r3 -> L12L23x3r2r3 [label="x := r2;"];
L11L23x3r0r3 -> L12L23x3r4r3 [label="r1 := x + 1;"];
L13L22x2r2r6 -> L13L23x6r2r6 [label="x := r2;"];
L13L22x2r2r3 -> L13L23x3r2r3 [label="x := r2;"];
L12L23x3r2r3 -> L13L23r2r2r3 [label="x := r1;"];
L12L23x3r4r3 -> L13L23x4r4r3 [label="x := r1;"]; */
