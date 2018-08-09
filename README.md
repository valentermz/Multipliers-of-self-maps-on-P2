# Spectra of quadratic endomorphisms with an invariant line

This repository is ancilliary to the paper

* A. Guillot and V. Ramírez. _Title TBD_ [arxiv](https://arxiv.org) 2018.

This paper is about quadratic endomorphisms on the complex projective plane having an invariant line. We describe the algebraic relations among the multipliers of the fixed points and prove that these multipliers completely determine the linear equivalence class of the endomorphism.

This repository contains the following files:

    .
    |-- Case-study/
    |   |-- case-study.ipynb
    |   |-- case-study_gb-computations_OUTPUT
    |   |-- README.md
    |-- Jacobi-system/
    |   |-- analysis-jacobi-ideal.m2
    |   |-- README.md
    |-- Test/
    |   |-- compute-h.m2
    |   |-- test-realizability.m2
    |   |-- README.md
    |-- README.md
    
## Directories

**Case\-study:** A specific endomorphism is defined and studied in depth. We find its fixed points, compute the multipliers, find all other endomorphisms that share the same multipliers that are not on the invariant line, and compute the *hidden relations* for certain invariant functions of the multipliers for the fixed points on the invariant line.

**Jacobi\-system:** We analyze the polynomial equations obtained from the Jacobi formula. We prove that the variable `b` satisfies a quadratic equation and that the value of the variable `a` and the position of the fourth fixed point can be recovered from the value of `b`.

**Test:** We provide the code for the following procedures: 1) Given a collection of fourteen numbers `u_i, v_i`, `i=0,...,6`, test whether or not the collection may be realized as the multipliers of a quadratic endomorphism with an invariant line. 2) Given a collection of eight numbers `t_0, d_0, ..., t_3, d_3`, and a rational invariant function `sigma` on the variables `u_4, ..., v_6`, compute the degree four polynomial `h` that defines `sigma` as a multivalued function of `t, d`.
