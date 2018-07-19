-- A case study : Gröbner basis for the Jacobi ideal and the polynomials h 
--------------------------------------------------------------------------

gbTrace = 3; 
printWidth = 0;

kk = QQ;
R = kk[w_0..w_2, x,y, c_0..c_5,a,b, p,q,r,s,L, MonomialOrder => {3, 10, 5}];

-- These is the spectra of our case study:
------------------------------------------
t_0 = -4
t_1 = -3/5
t_2 = 4/3
t_3 = 9
d_0 = 3
d_1 = -4/25
d_2 = 1/3
d_3 = -60


-- Below are all the equations relating the above numbers to the variables a,b,c_k:
-----------------------------------------------------------------------------------
-- Relations coming from Jacobi formula:
Rel_0 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3;
Rel_1 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3;
Rel_2 = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
Rel_3 = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3;
Rel_4 = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
Rels = {Rel_0, Rel_1, Rel_2, Rel_3, Rel_4};

-- This gives the following values for the spectra (T_k,D_k) of the associated vector field:
T_0 = t_0;
T_1 = t_1*(a+1);
T_2 = t_2*(b+1);
D_0 = d_0;
D_1 = d_1*(a+1)^2;
D_2 = d_2*(b+1)^2;
Eq_0 = T_0 - (-c_0-c_5);
Eq_1 = T_1 - (c_0+c_4-c_5);
Eq_2 = T_2 - (-c_0+c_1+c_5);
Eq_3 = D_0 - (-c_2*c_3+c_0*c_5) ;
Eq_4 = D_1 - (-c_1*c_3+c_2*c_3+c_0*c_4-c_0*c_5) ;
Eq_5 = D_2 - (c_2*c_3-c_2*c_4-c_0*c_5+c_1*c_5) ;
Eqs = {Eq_0, Eq_1, Eq_2, Eq_3, Eq_4, Eq_5};

-- Some non-degeneracy assumptions: a+1,b+1 and x+y-1 are non-zero
gc = {(a+1)*w_0-1, (b+1)*w_1-1, (x+y-1)*w_2-1};


-- Invariant functions p,q,r,s
------------------------------
-- p: sum of tangential eigenvalues
formula_p = p*(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (-9*c_3^2*c_2^2 - a*c_0*b*c_5 + a*c_4*b*c_5 - c_0^2*b^2 - c_0^2*c_5^2 - c_4^2*b^2 + 3*b^2*c_3*c_5 + 2*c_0^2*b*c_5 - 4*c_5^2*c_3*b + 2*a*c_0*c_5^2 + 2*c_0*c_4*b^2 + c_4^2*b*c_5 - 3*c_0*c_4*b*c_5 - c_1^2*c_4*c_0 - c_5*c_4^2*c_1 - 5*c_1^2*c_3*c_5 + 3*c_5*c_4*c_0*c_1 - 4*c_2*c_0*c_1*c_3 + 10*c_2*c_0*c_5*c_3 + 7*c_2*c_4*c_1*c_3 - 4*c_2*c_4*c_5*c_3 + 4*c_1*c_5^2*c_3 + 4*c_2*c_0^2*c_4 - 5*c_2*c_0*c_4^2 + 2*c_1^2*c_3*b + c_4^2*c_1*b - 3*c_1*b^2*c_3 + c_1^3*c_3 + c_2*c_4^3 - 6*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - 3*c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - 3*c_1*c_5*c_0*a - c_1*c_5*c_4*a - 3*c_2*c_3*c_1*a - 6*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a - c_1*c_4*b*a + 9*c_2*c_3*b*a + c_1*c_0*b*a - c_5^2*a^2 + 3*c_0*c_2*a^2 - 3*c_4*c_2*a^2 + 2*c_2*c_4^2*a + 2*c_1*c_5*a^2 - a^2*c_1^2 - 4*a*c_2*c_0^2 + a*c_1^2*c_4 + a*c_1^2*c_0);
-- q: product of tangential eigenvalues
formula_q = q*-(-a*b^2*c_0 + b^2*c_0^2 + a^2*b*c_1 - a*b*c_0*c_1 - a^3*c_2 + a^2*c_0*c_2 - b^3*c_3 + 2*b^2*c_1*c_3 - b*c_1^2*c_3 - 3*a*b*c_2*c_3 + 2*b*c_0*c_2*c_3 + a*c_1*c_2*c_3 + c_2^2*c_3^2 + a*b^2*c_4 - b^2*c_0*c_4 - a*b*c_1*c_4 + b*c_0*c_1*c_4 + 2*a^2*c_2*c_4 - 2*a*c_0*c_2*c_4 + b*c_2*c_3*c_4 - c_1*c_2*c_3*c_4 - a*c_2*c_4^2 + c_0*c_2*c_4^2 - a^2*b*c_5 + 3*a*b*c_0*c_5 - 2*b*c_0^2*c_5 - a^2*c_1*c_5 + a*c_0*c_1*c_5 + b^2*c_3*c_5 - 2*b*c_1*c_3*c_5 + c_1^2*c_3*c_5 + 2*a*c_2*c_3*c_5 - 2*c_0*c_2*c_3*c_5 - a*b*c_4*c_5 + b*c_0*c_4*c_5 + a*c_1*c_4*c_5 - c_0*c_1*c_4*c_5 + a^2*c_5^2 - 2*a*c_0*c_5^2 + c_0^2*c_5^2) - (c_0^2*c_1^2 - 4*c_0^3*c_2 + 4*c_1^3*c_3 - 18*c_0*c_1*c_2*c_3 - 27*c_2^2*c_3^2 - 2*c_0*c_1^2*c_4 + 12*c_0^2*c_2*c_4 + 18*c_1*c_2*c_3*c_4 + c_1^2*c_4^2 - 12*c_0*c_2*c_4^2 + 4*c_2*c_4^3 - 2*c_0^2*c_1*c_5 - 12*c_1^2*c_3*c_5 + 18*c_0*c_2*c_3*c_5 + 4*c_0*c_1*c_4*c_5 - 18*c_2*c_3*c_4*c_5 - 2*c_1*c_4^2*c_5 + c_0^2*c_5^2 + 12*c_1*c_3*c_5^2 - 2*c_0*c_4*c_5^2 + c_4^2*c_5^2 - 4*c_3*c_5^3);
-- r: sum of normal eigenvalues
formula_r = r*-(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (3*c_3^2*c_2^2 + 3*a*c_0*b*c_5 - a*c_4*b*c_5 + c_0^2*b^2 + 3*c_0^2*c_5^2 + b^2*c_3*c_5 - 4*c_0^2*b*c_5 - 4*a*c_0*c_5^2 - c_0*c_4*b^2 + 2*c_0*c_4*b*c_5 + 3*c_1^2*c_3*c_5 - 3*c_5*c_4*c_0*c_1 - 6*c_2*c_0*c_5*c_3 - 3*c_2*c_4*c_1*c_3 + 3*c_2*c_0*c_4^2 - 2*c_1^2*c_3*b + 2*c_1*b^2*c_3 + 4*c_2*c_0*c_3*b + 2*b*c_4*c_0*c_1 + 2*c_2*c_4*c_3*b - 4*c_1*c_3*b*c_5 + 2*c_1*c_5*c_0*a + 2*c_1*c_5*c_4*a + 2*c_2*c_3*c_1*a + 4*c_2*c_3*c_5*a - 4*c_2*c_0*c_4*a - c_1*c_4*b*a - 3*c_2*c_3*b*a - c_1*c_0*b*a + c_5^2*a^2 + c_0*c_2*a^2 + 2*c_4*c_2*a^2 - 2*c_2*c_4^2*a - c_1*c_5*a^2);
-- s: e_{1,1}
formula_s = s*-(-c_3^2*c_2^2 - 3*a*c_0*b*c_5 + a*c_4*b*c_5 + b^3*c_3 - c_0^2*b^2 - c_0^2*c_5^2 - b^2*c_3*c_5 + 2*c_0^2*b*c_5 + a*c_0*b^2 + 2*a*c_0*c_5^2 - a*c_4*b^2 + c_0*c_4*b^2 - c_0*c_4*b*c_5 - c_1^2*c_3*c_5 + c_5*c_4*c_0*c_1 + 2*c_2*c_0*c_5*c_3 + c_2*c_4*c_1*c_3 - c_2*c_0*c_4^2 + c_1^2*c_3*b - 2*c_1*b^2*c_3 - 2*c_2*c_0*c_3*b - b*c_4*c_0*c_1 - c_2*c_4*c_3*b + 2*c_1*c_3*b*c_5 - c_1*c_5*c_0*a - c_1*c_5*c_4*a - c_2*c_3*c_1*a - 2*c_2*c_3*c_5*a + 2*c_2*c_0*c_4*a + c_1*c_4*b*a + 3*c_2*c_3*b*a + c_1*c_0*b*a + c_2*a^3 - c_5^2*a^2 - c_0*c_2*a^2 - 2*c_4*c_2*a^2 + b*c_5*a^2 + c_2*c_4^2*a + c_1*c_5*a^2 - c_1*b*a^2) - (18*c_3^2*c_2^2 + 2*c_0^2*c_5^2 - 2*c_0^2*b*c_5 + 4*c_5^2*c_3*b - 2*a*c_0*c_5^2 - c_4^2*b*c_5 + 3*c_0*c_4*b*c_5 + 2*c_1^2*c_4*c_0 + 2*c_5*c_4^2*c_1 + 10*c_1^2*c_3*c_5 - 6*c_5*c_4*c_0*c_1 + 8*c_2*c_0*c_1*c_3 - 20*c_2*c_0*c_5*c_3 - 14*c_2*c_4*c_1*c_3 + 8*c_2*c_4*c_5*c_3 - 8*c_1*c_5^2*c_3 - 8*c_2*c_0^2*c_4 + 10*c_2*c_0*c_4^2 - 2*c_1^2*c_3*b - c_4^2*c_1*b - 2*c_1^3*c_3 - 2*c_2*c_4^3 + 6*c_2*c_0*c_3*b + b*c_4*c_0*c_1 + 3*c_2*c_4*c_3*b - 2*c_1*c_3*b*c_5 + 3*c_1*c_5*c_0*a + c_1*c_5*c_4*a + 3*c_2*c_3*c_1*a + 6*c_2*c_3*c_5*a - 2*c_2*c_0*c_4*a - 2*c_2*c_4^2*a + 4*a*c_2*c_0^2 - a*c_1^2*c_4 - a*c_1^2*c_0);


-- The ideals of all relations:
-------------------------------
-- J is the ideal of relations coming from Jacobi:
J = ideal(Rels) + ideal(gc);
-- I is obtained from J by adding the formulas for the spectra of the vector field
I = J + ideal(Eqs);


-- Main computations
--------------------
-- We compute a Gröbner basis for I:
gb(I)
-- Eliminate the auxiliary variables w_i:
GBI = selectInSubring(1, gens gb(I));
-- Save the elements of GBI as a python list:
gensI = new Array from flatten entries GBI;

-- We now compute the polynomials h one by one:
Ip = I + ideal(formula_p);
GBIp = selectInSubring(2, gens gb(Ip));
hp = GBIp_(0,0);

Iq = I + ideal(formula_q);
GBIq = selectInSubring(2, gens gb(Iq));
hq = GBIq_(0,0);

Ir = I + ideal(formula_r);
GBIr = selectInSubring(2, gens gb(Ir));
hr = GBIr_(0,0);

Is = I + ideal(formula_s);
GBIs = selectInSubring(2, gens gb(Is));
hs = GBIs_(0,0);


-- Print all the relevant results:
----------------------------------
print "OUTPUT:"
print toString gensI;
print toString hp;
print toString hq;
print toString hr;
print toString hs;


exit
