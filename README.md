# Spectra of quadratic endomorphisms with an invariant line

This repository is ancilliary to the paper

* A. Guillot and V. Ramírez. _Title TBD_ [arxiv](https://arxiv.org) 2018.

This paper is about quadratic endomorphisms on the complex projective plane having an invariant line. We describe the algebraic relations among the multipliers of the fixed points and prove that these multipliers completely determine the linear equivalence class of the endomorphism.

This repository contains the following files:

    .
    |-- Case-study/
    |   |-- case-study.ipynb
    |   |-- case-study_gb-computations.m2
    |   |-- case-study_gb-computations_OUTPUT
    |   |-- README.md
    |-- Jacobi-system/
    |   |-- analysis-jacobi-ideal.m2
    |   |-- analysis-jacobi-ideal_OUTPUT
    |   |-- README.md
    |-- LICENSE
    |-- README.md

**Case\-study:** A specific endomorphism is defined and studied in depth. We find its fixed points, compute the multipliers, find all other endomorphisms that share the same multipliers that are not on the invariant line, and compute the *hidden relations* for certain invariant functions of the multipliers for the fixed points on the invariant line.

**Jacobi\-system:** We analyze the polynomial equations obtained from the Jacobi formula. We prove that the variable `b` satisfies a quadratic equation and that the value of the variable `a` and the position of the fourth fixed point can be recovered from the value of `b`.
