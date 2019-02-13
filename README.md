# Multipliers at fixed points of self-maps of the projective plane


This repository is ancilliary to the paper

* A. Guillot and V. Ramírez. _On the multipliers at fixed points of self-maps of the projective plane._ [arXiv: 1902.04433](https://arxiv.org/abs/1902.04433) (2019).

This paper is about quadratic endomorphisms on the complex projective plane having an invariant line. We describe the algebraic relations among the multipliers of the fixed points and prove that these multipliers completely determine the linear equivalence class of the endomorphism.


    
## Directories

**Case\-study:** A specific quadratic self-map is defined and studied in depth. We find its fixed points, compute the multipliers, find all other endomorphisms that share the same multipliers that are not on the invariant line, and compute the *hidden relations* for certain invariant functions of the multipliers for the fixed points on the invariant line.

**Jacobi\-system:** We analyze the polynomial equations obtained from the Jacobi formula. We prove that the variable `b` satisfies a quadratic equation and that the value of the variable `a` and the position of the fourth fixed point can be recovered from the value of `b`.

**Test:** Given a collection of fourteen numbers `u_i, v_i`, `i=0,...,6`, test whether or not the collection may be realized as the multipliers of a quadratic endomorphism with an invariant line. 

**Compute-h:** Given a collection of eight numbers `t_0, d_0, ..., t_3, d_3`, and a rational invariant function `sigma` on the variables `u_4, ..., v_6`, compute the degree four polynomial `h` that defines `sigma` as a multivalued function of `t, d`.

**Painleve-analysis:** As an application to the results established for self-maps on the projective plane, we have studied some ordinary differential equations in the complex domain and tried to determine those, within a particular class, which do not have multivalued solutions. This directory contains all the computations related to this application.



## Software used

Most of the computations have been carried out using *SageMath*, except some additional Gröbner basis computations, which were done using *Macaulay2*. You can get a distribution of these software here:  
https://www.sagemath.org/  
https://faculty.math.illinois.edu/Macaulay2/

&nbsp;

<sub>Copyright 2018 Adolfo Guillot and Valente Ramírez. Licensed under the Apache License, Version 2.0.</sub>

