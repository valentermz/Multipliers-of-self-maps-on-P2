#!/usr/bin/env sage

"""Compute h:
Compute the functions h relative to the four invariant functions:
    p = u_4 + u_5 + u_6
    q = u_4*u_5*u_6
    r = v_4 + v_5 + v_6
    s = u_4*(v_5 + v_6) + u_5*(v_4 + v_6) + u_6*(v_4 + v_5)
"""


# Provide input here
Input = [-4, 3, -3/5, -4/25, 4/3, 1/3, 9, -60]  # Case study example
td_format = True

# Declare variables to use:
t_0, d_0, t_1, d_1, t_2, d_2, t_3, d_3 = Input


# Definition of all the relations among these variables #

# Define multivariate polynomial ring with rational coefficients
R = QQ['w_0,w_1,w_2,w_3,x,y,c_0,c_1,c_2,c_3,c_4,c_5,a,b,p,q,r,s']
(w_0, w_1, w_2, w_3, x, y, c_0, c_1, c_2, c_3, c_4, c_5, a, b, p, q, r, s) = R.gens()

# Relations coming from Jacobi formula:
Rel = [0 for i in range(5)]
Rel[0] = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3
Rel[1] = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3
Rel[2] = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3
Rel[3] = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3
Rel[4] = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3

# Traces and determinants of auxiliary vector field H
T = [0 for i in range(4)]
D = [0 for i in range(4)]
T[0] = t_0
T[1] = t_1*(a+1)
T[2] = t_2*(b+1)
D[0] = d_0
D[1] = d_1*(a+1)^2
D[2] = d_2*(b+1)^2

# Comparing with the known formulas for T_i, D_i we get these equations:
Eq = [0 for i in range(6)]
Eq[0] = T[0] - (-c_0-c_5)
Eq[1] = T[1] - (c_0+c_4-c_5)
Eq[2] = T[2] - (-c_0+c_1+c_5)
Eq[3] = D[0] - (-c_2*c_3+c_0*c_5)
Eq[4] = D[1] - (-c_1*c_3+c_2*c_3+c_0*c_4-c_0*c_5)
Eq[5] = D[2] - (c_2*c_3-c_2*c_4-c_0*c_5+c_1*c_5)

# Formulas for the invariant functions p,q,r,s (after lifting denominators)
Fp = p*(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (-9*c_3^2*c_2^2 - a*c_0*b*c_5 + a*c_4*b*c_5 - c_0^2*b^2 - c_0^2*c_5^2 - c_4^2*b^2 + 3*b^2*c_3*c_5 + 2*c_0^2*b*c_5 - 4*c_5^2*c_3*b + 2*a*c_0*c_5^2 + 2*c_0*c_4*b^2 + c_4^2*b*c_5 - 3*c_0*c_4*b*c_5 - c_1^2*c_4*c_0 - c_5*c_4^2*c_1 - 5*c_1^2*c_3*c_5 + 3*c_5*c_4*c_0*c_1 - 4*c_2*c_0*c_1*c_3 + 10*c_2*c_0*c_5*c_3 + 7*c_2*c_4*c_1*c_3 - 4*c_2*c_4*c_5*c_3 + 4*c_1*c_5^2*c_3 + 4*c_2*c_0^2*c_4 - 5*c_2*c_0*c_4^2 + 2*c_1^2*c_3*b + c_4^2*c_1*b - 3*c_1*b^2*c_3 + c_1^3*c_3 + c_2*c_4^3 - 6*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - 3*c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - 3*c_1*c_5*c_0*a - c_1*c_5*c_4*a - 3*c_2*c_3*c_1*a - 6*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a - c_1*c_4*b*a + 9*c_2*c_3*b*a + c_1*c_0*b*a - c_5^2*a^2 + 3*c_0*c_2*a^2 - 3*c_4*c_2*a^2 + 2*c_2*c_4^2*a + 2*c_1*c_5*a^2 - a^2*c_1^2 - 4*a*c_2*c_0^2 + a*c_1^2*c_4 + a*c_1^2*c_0)
Fq = q*-(-a*b^2*c_0 + b^2*c_0^2 + a^2*b*c_1 - a*b*c_0*c_1 - a^3*c_2 + a^2*c_0*c_2 - b^3*c_3 + 2*b^2*c_1*c_3 - b*c_1^2*c_3 - 3*a*b*c_2*c_3 + 2*b*c_0*c_2*c_3 + a*c_1*c_2*c_3 + c_2^2*c_3^2 + a*b^2*c_4 - b^2*c_0*c_4 - a*b*c_1*c_4 + b*c_0*c_1*c_4 + 2*a^2*c_2*c_4 - 2*a*c_0*c_2*c_4 + b*c_2*c_3*c_4 - c_1*c_2*c_3*c_4 - a*c_2*c_4^2 + c_0*c_2*c_4^2 - a^2*b*c_5 + 3*a*b*c_0*c_5 - 2*b*c_0^2*c_5 - a^2*c_1*c_5 + a*c_0*c_1*c_5 + b^2*c_3*c_5 - 2*b*c_1*c_3*c_5 + c_1^2*c_3*c_5 + 2*a*c_2*c_3*c_5 - 2*c_0*c_2*c_3*c_5 - a*b*c_4*c_5 + b*c_0*c_4*c_5 + a*c_1*c_4*c_5 - c_0*c_1*c_4*c_5 + a^2*c_5^2 - 2*a*c_0*c_5^2 + c_0^2*c_5^2) - (c_0^2*c_1^2 - 4*c_0^3*c_2 + 4*c_1^3*c_3 - 18*c_0*c_1*c_2*c_3 - 27*c_2^2*c_3^2 - 2*c_0*c_1^2*c_4 + 12*c_0^2*c_2*c_4 + 18*c_1*c_2*c_3*c_4 + c_1^2*c_4^2 - 12*c_0*c_2*c_4^2 + 4*c_2*c_4^3 - 2*c_0^2*c_1*c_5 - 12*c_1^2*c_3*c_5 + 18*c_0*c_2*c_3*c_5 + 4*c_0*c_1*c_4*c_5 - 18*c_2*c_3*c_4*c_5 - 2*c_1*c_4^2*c_5 + c_0^2*c_5^2 + 12*c_1*c_3*c_5^2 - 2*c_0*c_4*c_5^2 + c_4^2*c_5^2 - 4*c_3*c_5^3)
Fr = r*-(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (3*c_3^2*c_2^2 + 3*a*c_0*b*c_5 - a*c_4*b*c_5 + c_0^2*b^2 + 3*c_0^2*c_5^2 + b^2*c_3*c_5 - 4*c_0^2*b*c_5 - 4*a*c_0*c_5^2 - c_0*c_4*b^2 + 2*c_0*c_4*b*c_5 + 3*c_1^2*c_3*c_5 - 3*c_5*c_4*c_0*c_1 - 6*c_2*c_0*c_5*c_3 - 3*c_2*c_4*c_1*c_3 + 3*c_2*c_0*c_4^2 - 2*c_1^2*c_3*b + 2*c_1*b^2*c_3 + 4*c_2*c_0*c_3*b + 2*b*c_4*c_0*c_1 + 2*c_2*c_4*c_3*b - 4*c_1*c_3*b*c_5 + 2*c_1*c_5*c_0*a + 2*c_1*c_5*c_4*a + 2*c_2*c_3*c_1*a + 4*c_2*c_3*c_5*a - 4*c_2*c_0*c_4*a - c_1*c_4*b*a - 3*c_2*c_3*b*a - c_1*c_0*b*a + c_5^2*a^2 + c_0*c_2*a^2 + 2*c_4*c_2*a^2 - 2*c_2*c_4^2*a - c_1*c_5*a^2)
Fs = s*-(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (18*c_3^2*c_2^2 + 2*c_0^2*c_5^2 - 2*c_0^2*b*c_5 + 4*c_5^2*c_3*b - 2*a*c_0*c_5^2 - c_4^2*b*c_5 + 3*c_0*c_4*b*c_5 + 2*c_1^2*c_4*c_0 + 2*c_5*c_4^2*c_1 + 10*c_1^2*c_3*c_5 - 6*c_5*c_4*c_0*c_1 + 8*c_2*c_0*c_1*c_3 - 20*c_2*c_0*c_5*c_3 - 14*c_2*c_4*c_1*c_3 + 8*c_2*c_4*c_5*c_3 - 8*c_1*c_5^2*c_3 - 8*c_2*c_0^2*c_4 + 10*c_2*c_0*c_4^2 - 2*c_1^2*c_3*b - c_4^2*c_1*b - 2*c_1^3*c_3 - 2*c_2*c_4^3 + 6*c_2*c_0*c_3*b + b*c_4*c_0*c_1 + 3*c_2*c_4*c_3*b - 2*c_1*c_3*b*c_5 + 3*c_1*c_5*c_0*a + c_1*c_5*c_4*a + 3*c_2*c_3*c_1*a + 6*c_2*c_3*c_5*a - 2*c_2*c_0*c_4*a - 2*c_2*c_4^2*a + 4*a*c_2*c_0^2 - a*c_1^2*c_4 - a*c_1^2*c_0)

# Genericity assumptions: a+1, b+1, a+b+1 and x+y-1 are non-zero
gc = [(a+1)*w_0-1, (b+1)*w_1-1, (a+b+1)*w_2-1, (x+y-1)*w_3-1]

# Define the relevant ideals
I = ideal(Rel + Eq + gc)
Ip = I + ideal(Fp)
Iq = I + ideal(Fq)
Ir = I + ideal(Fr)
Is = I + ideal(Fs)


# Main computations #

elim_vars = [w_0,w_1,w_2,w_3,x,y,a,b,c_0,c_1,c_2,c_3,c_4,c_5]

Jp = Ip.elimination_ideal(elim_vars)
Jq = Iq.elimination_ideal(elim_vars)
Jr = Ir.elimination_ideal(elim_vars)
Js = Is.elimination_ideal(elim_vars)

assert len(Jp.gens()) == 1
assert len(Jq.gens()) == 1
assert len(Jr.gens()) == 1
assert len(Js.gens()) == 1

hp = Jp.gens()[0]
hq = Jq.gens()[0]
hr = Jr.gens()[0]
hs = Js.gens()[0]


# Final result #

print 'Final result:\n'
for k in range(4):
    print 'h{} ='.format(['p', 'q', 'r', 's'][k]), [hp, hq, hr, hs][k], '\n'
