-- OBJECTIVE: find (a,b) in terms of d_0..d_3, t_0..t_3, then find (x,y)
------------------------------------------------------------------------

-- This is done in a series of sessions.
-- We never compute the whole Gröbner basis,
-- but instead stop whenever it is convenient.
-- The output of the previous session is added
-- as a generator of the ideal of the next session.
-- Note that the order of the variables and
-- the monomial order changes from session to session.


-- Part1: 
-- Get the quadratic equation on b 
----------------------------------

printWidth = 0
gbTrace = 2

kk = QQ
R = kk[x,y, z_0..z_3,r,s,h, a,b, t_0..t_3,d_0..d_3, MonomialOrder => Eliminate 10]

-- Equationes derived from Jacobi formula using g = l, x, y, 1, tr DH
E_0 = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_1 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3;
E_2 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3;
E_3 = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_4 = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3;

-- Non-degeneracy assumptions: d_k, a+1, b_1, x+y-1 are never zero
gc_0 = d_0*z_0-1;
gc_1 = d_1*z_1-1;
gc_2 = d_2*z_2-1;
gc_3 = d_3*z_3-1;
gc_4 = (a+1)*r-1;
gc_5 = (b+1)*s-1;
gc_6 = (x+y-1)*h-1;
GC = {gc_0,gc_1,gc_2,gc_3,gc_4,gc_5,gc_6};

-- J is the idea of relations plus genericity conditions
J = ideal(E_0,E_1,E_2,E_3,E_4) + ideal(GC);

-- Looking for the quadratic equation in b only
time GB = gens gb(J, SubringLimit => 1);  --stop as soon as one element is found
q = GB_(0,0);
toString factor q
--output appended at the end of this file

restart



-- Part2:
-- Get a linear equation on a,b
-------------------------------

printWidth = 0
gbTrace = 2

kk = QQ
R = kk[z_0..z_3,r,s,h, x,y, a,b, t_0..t_3,d_0..d_3, MonomialOrder => Eliminate 9]

-- Equationes derived from Jacobi formula using g = l, x, y, 1, tr DH
E_0 = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_1 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3;
E_2 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3;
E_3 = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_4 = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3;

-- Non-degeneracy assumptions: d_k, a+1, b_1, x+y-1 are never zero
gc_0 = d_0*z_0-1;
gc_1 = d_1*z_1-1;
gc_2 = d_2*z_2-1;
gc_3 = d_3*z_3-1;
gc_4 = (a+1)*r-1;
gc_5 = (b+1)*s-1;
gc_6 = (x+y-1)*h-1;
GC = {gc_0,gc_1,gc_2,gc_3,gc_4,gc_5,gc_6};

-- Input from previous session
q = b^2*t_1^2*d_0*d_2^2-2*b^2*t_1*t_3*d_0*d_2^2+b^2*t_3^2*d_0*d_2^2+b^2*t_0^2*d_1*d_2^2-2*b^2*t_0*t_3*d_1*d_2^2+b^2*t_3^2*d_1*d_2^2+b^2*t_0^2*d_2^2*d_3-2*b^2*t_0*t_1*d_2^2*d_3+b^2*t_1^2*d_2^2*d_3+2*b*t_0*t_2*d_0*d_1*d_2-2*b*t_0*t_3*d_0*d_1*d_2-2*b*t_2*t_3*d_0*d_1*d_2+2*b*t_3^2*d_0*d_1*d_2+2*b*t_1^2*d_0*d_2^2-4*b*t_1*t_3*d_0*d_2^2+2*b*t_3^2*d_0*d_2^2+2*b*t_0^2*d_1*d_2^2-4*b*t_0*t_3*d_1*d_2^2+2*b*t_3^2*d_1*d_2^2-2*b*t_0*t_1*d_0*d_2*d_3+2*b*t_1^2*d_0*d_2*d_3+2*b*t_0*t_2*d_0*d_2*d_3-2*b*t_1*t_2*d_0*d_2*d_3+2*b*t_0^2*d_2^2*d_3-4*b*t_0*t_1*d_2^2*d_3+2*b*t_1^2*d_2^2*d_3+t_2^2*d_0^2*d_1-2*t_2*t_3*d_0^2*d_1+t_3^2*d_0^2*d_1+t_1^2*d_0^2*d_2-2*t_1*t_3*d_0^2*d_2+t_3^2*d_0^2*d_2+2*t_0*t_2*d_0*d_1*d_2-2*t_0*t_3*d_0*d_1*d_2-2*t_2*t_3*d_0*d_1*d_2+2*t_3^2*d_0*d_1*d_2+t_1^2*d_0*d_2^2-2*t_1*t_3*d_0*d_2^2+t_3^2*d_0*d_2^2+t_0^2*d_1*d_2^2-2*t_0*t_3*d_1*d_2^2+t_3^2*d_1*d_2^2+t_1^2*d_0^2*d_3-2*t_1*t_2*d_0^2*d_3+t_2^2*d_0^2*d_3-2*t_0*t_1*d_0*d_2*d_3+2*t_1^2*d_0*d_2*d_3+2*t_0*t_2*d_0*d_2*d_3-2*t_1*t_2*d_0*d_2*d_3+t_0^2*d_2^2*d_3-2*t_0*t_1*d_2^2*d_3+t_1^2*d_2^2*d_3;

-- J is the idea of relations plus genericity conditions
J = ideal(E_0,E_1,E_2,E_3,E_4) + ideal(GC);

-- I is the idea of relations plus the newly found q
I = J + ideal(q); 

time GB = gens gb(I, DegreeLimit => 17);  --deg 17 is enough to get the linear equation
l = GB_(0,1);
toString factor l
--output appended at the end of this file

restart



-- Part3:
-- Get a linear equation on x,y
-------------------------------

printWidth = 0
gbTrace = 2

kk = QQ
R = kk[z_0..z_3,r,s,h, x,y,a,b, t_0..t_3,d_0..d_3, MonomialOrder => Eliminate 7]

-- Equationes derived from Jacobi formula using g = l, x, y, 1, tr DH
E_0 = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_1 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3;
E_2 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3;
E_3 = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_4 = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3;

-- Non-degeneracy assumptions: d_k, a+1, b_1, x+y-1 are never zero
gc_0 = d_0*z_0-1;
gc_1 = d_1*z_1-1;
gc_2 = d_2*z_2-1;
gc_3 = d_3*z_3-1;
gc_4 = (a+1)*r-1;
gc_5 = (b+1)*s-1;
gc_6 = (x+y-1)*h-1;
GC = {gc_0,gc_1,gc_2,gc_3,gc_4,gc_5,gc_6};

-- Input from previous sessions
q = b^2*t_1^2*d_0*d_2^2-2*b^2*t_1*t_3*d_0*d_2^2+b^2*t_3^2*d_0*d_2^2+b^2*t_0^2*d_1*d_2^2-2*b^2*t_0*t_3*d_1*d_2^2+b^2*t_3^2*d_1*d_2^2+b^2*t_0^2*d_2^2*d_3-2*b^2*t_0*t_1*d_2^2*d_3+b^2*t_1^2*d_2^2*d_3+2*b*t_0*t_2*d_0*d_1*d_2-2*b*t_0*t_3*d_0*d_1*d_2-2*b*t_2*t_3*d_0*d_1*d_2+2*b*t_3^2*d_0*d_1*d_2+2*b*t_1^2*d_0*d_2^2-4*b*t_1*t_3*d_0*d_2^2+2*b*t_3^2*d_0*d_2^2+2*b*t_0^2*d_1*d_2^2-4*b*t_0*t_3*d_1*d_2^2+2*b*t_3^2*d_1*d_2^2-2*b*t_0*t_1*d_0*d_2*d_3+2*b*t_1^2*d_0*d_2*d_3+2*b*t_0*t_2*d_0*d_2*d_3-2*b*t_1*t_2*d_0*d_2*d_3+2*b*t_0^2*d_2^2*d_3-4*b*t_0*t_1*d_2^2*d_3+2*b*t_1^2*d_2^2*d_3+t_2^2*d_0^2*d_1-2*t_2*t_3*d_0^2*d_1+t_3^2*d_0^2*d_1+t_1^2*d_0^2*d_2-2*t_1*t_3*d_0^2*d_2+t_3^2*d_0^2*d_2+2*t_0*t_2*d_0*d_1*d_2-2*t_0*t_3*d_0*d_1*d_2-2*t_2*t_3*d_0*d_1*d_2+2*t_3^2*d_0*d_1*d_2+t_1^2*d_0*d_2^2-2*t_1*t_3*d_0*d_2^2+t_3^2*d_0*d_2^2+t_0^2*d_1*d_2^2-2*t_0*t_3*d_1*d_2^2+t_3^2*d_1*d_2^2+t_1^2*d_0^2*d_3-2*t_1*t_2*d_0^2*d_3+t_2^2*d_0^2*d_3-2*t_0*t_1*d_0*d_2*d_3+2*t_1^2*d_0*d_2*d_3+2*t_0*t_2*d_0*d_2*d_3-2*t_1*t_2*d_0*d_2*d_3+t_0^2*d_2^2*d_3-2*t_0*t_1*d_2^2*d_3+t_1^2*d_2^2*d_3;
l = a*t_1*t_2^2*d_0*d_1-2*a*t_1*t_2*t_3*d_0*d_1-a*t_2^2*t_3*d_0*d_1+a*t_1*t_3^2*d_0*d_1+2*a*t_2*t_3^2*d_0*d_1-a*t_3^3*d_0*d_1+b*t_1^2*t_2*d_0*d_2-b*t_1^2*t_3*d_0*d_2-2*b*t_1*t_2*t_3*d_0*d_2+2*b*t_1*t_3^2*d_0*d_2+b*t_2*t_3^2*d_0*d_2-b*t_3^3*d_0*d_2+a*t_0^2*t_1*d_1*d_2+b*t_0^2*t_2*d_1*d_2-a*t_0^2*t_3*d_1*d_2-b*t_0^2*t_3*d_1*d_2-2*a*t_0*t_1*t_3*d_1*d_2-2*b*t_0*t_2*t_3*d_1*d_2+2*a*t_0*t_3^2*d_1*d_2+2*b*t_0*t_3^2*d_1*d_2+a*t_1*t_3^2*d_1*d_2+b*t_2*t_3^2*d_1*d_2-a*t_3^3*d_1*d_2-b*t_3^3*d_1*d_2+a*t_0^2*t_1*d_1*d_3-2*a*t_0*t_1*t_2*d_1*d_3+a*t_1*t_2^2*d_1*d_3-a*t_0^2*t_3*d_1*d_3+2*a*t_0*t_2*t_3*d_1*d_3-a*t_2^2*t_3*d_1*d_3+b*t_0^2*t_2*d_2*d_3-2*b*t_0*t_1*t_2*d_2*d_3+b*t_1^2*t_2*d_2*d_3-b*t_0^2*t_3*d_2*d_3+2*b*t_0*t_1*t_3*d_2*d_3-b*t_1^2*t_3*d_2*d_3+t_0*t_2^2*d_0*d_1+t_1*t_2^2*d_0*d_1-2*t_0*t_2*t_3*d_0*d_1-2*t_1*t_2*t_3*d_0*d_1-2*t_2^2*t_3*d_0*d_1+t_0*t_3^2*d_0*d_1+t_1*t_3^2*d_0*d_1+4*t_2*t_3^2*d_0*d_1-2*t_3^3*d_0*d_1+t_0*t_1^2*d_0*d_2+t_1^2*t_2*d_0*d_2-2*t_0*t_1*t_3*d_0*d_2-2*t_1^2*t_3*d_0*d_2-2*t_1*t_2*t_3*d_0*d_2+t_0*t_3^2*d_0*d_2+4*t_1*t_3^2*d_0*d_2+t_2*t_3^2*d_0*d_2-2*t_3^3*d_0*d_2+t_0^2*t_1*d_1*d_2+t_0^2*t_2*d_1*d_2-2*t_0^2*t_3*d_1*d_2-2*t_0*t_1*t_3*d_1*d_2-2*t_0*t_2*t_3*d_1*d_2+4*t_0*t_3^2*d_1*d_2+t_1*t_3^2*d_1*d_2+t_2*t_3^2*d_1*d_2-2*t_3^3*d_1*d_2+t_0*t_1^2*d_0*d_3-2*t_0*t_1*t_2*d_0*d_3+t_0*t_2^2*d_0*d_3-t_1^2*t_3*d_0*d_3+2*t_1*t_2*t_3*d_0*d_3-t_2^2*t_3*d_0*d_3+t_0^2*t_1*d_1*d_3-2*t_0*t_1*t_2*d_1*d_3+t_1*t_2^2*d_1*d_3-t_0^2*t_3*d_1*d_3+2*t_0*t_2*t_3*d_1*d_3-t_2^2*t_3*d_1*d_3+t_0^2*t_2*d_2*d_3-2*t_0*t_1*t_2*d_2*d_3+t_1^2*t_2*d_2*d_3-t_0^2*t_3*d_2*d_3+2*t_0*t_1*t_3*d_2*d_3-t_1^2*t_3*d_2*d_3;

-- J is the idea of relations plus genericity conditions
J = ideal(E_0,E_1,E_2,E_3,E_4) + ideal(GC);

-- I is the idea of relations plus the newly found q and l
I = J + ideal(q,l); 

time g = gb(I, DegreeLimit => 14);  --deg 14 enough to find the linear relation we want
GB = selectInSubring(1, gens g);
L_0 = GB_(0,0);
toString factor L_0
--output appended at the end of this file

restart



-- Part4:
-- Get a linear equation on x only
----------------------------------

printWidth = 0
gbTrace = 2

kk = QQ
R = kk[z_0..z_3,r,s,h, y, x,a,b, t_0..t_3,d_0..d_3, MonomialOrder => Eliminate 8]

-- Equationes derived from Jacobi formula using g = l, x, y, 1, tr DH
E_0 = a^2*b*d_1*d_2*d_3*x + a*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_3*x + a*b*d_0*d_2*d_3*x + a^2*d_1*d_2*d_3*x + a*b*d_1*d_2*d_3*x + a*b*d_0*d_1*d_3*y + b^2*d_0*d_2*d_3*y + a*b*d_1*d_2*d_3*y + b^2*d_1*d_2*d_3*y + a*b*d_0*d_1*d_2 + a*b*d_1*d_2*d_3 + a*d_0*d_1*d_3*x + a*d_0*d_2*d_3*x + a*d_1*d_2*d_3*x + b*d_0*d_1*d_3*y + b*d_0*d_2*d_3*y + b*d_1*d_2*d_3*y + a*d_0*d_1*d_2 + b*d_0*d_1*d_2 + a*d_0*d_1*d_3 + b*d_0*d_2*d_3 + a*d_1*d_2*d_3 + b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_1 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + a^2*d_1*x + 2*a*d_1*x + 2*a*d_3*x + 2*b*d_3*y + d_1*x + d_3;
E_2 = a^2*d_3*x^2 + 2*a*b*d_3*x*y + b^2*d_3*y^2 + b^2*d_2*y + 2*a*d_3*x + 2*b*d_2*y + 2*b*d_3*y + d_2*y + d_3;
E_3 = a^4*b^2*d_1*d_2*d_3*x^2 + 2*a^3*b^3*d_1*d_2*d_3*x*y + a^2*b^4*d_1*d_2*d_3*y^2 + 2*a^4*b*d_1*d_2*d_3*x^2 + 2*a^3*b^2*d_1*d_2*d_3*x^2 + 4*a^3*b^2*d_1*d_2*d_3*x*y + 4*a^2*b^3*d_1*d_2*d_3*x*y + 2*a^2*b^3*d_1*d_2*d_3*y^2 + 2*a*b^4*d_1*d_2*d_3*y^2 + 2*a^3*b^2*d_1*d_2*d_3*x + a^4*d_0*d_1*d_3*x^2 + a^2*b^2*d_0*d_2*d_3*x^2 + a^4*d_1*d_2*d_3*x^2 + 4*a^3*b*d_1*d_2*d_3*x^2 + a^2*b^2*d_1*d_2*d_3*x^2 + 2*a^2*b^3*d_1*d_2*d_3*y + 2*a^3*b*d_0*d_1*d_3*x*y + 2*a*b^3*d_0*d_2*d_3*x*y + 2*a^3*b*d_1*d_2*d_3*x*y + 8*a^2*b^2*d_1*d_2*d_3*x*y + 2*a*b^3*d_1*d_2*d_3*x*y + a^2*b^2*d_0*d_1*d_3*y^2 + b^4*d_0*d_2*d_3*y^2 + a^2*b^2*d_1*d_2*d_3*y^2 + 4*a*b^3*d_1*d_2*d_3*y^2 + b^4*d_1*d_2*d_3*y^2 + 4*a^3*b*d_1*d_2*d_3*x + 4*a^2*b^2*d_1*d_2*d_3*x + 2*a^3*d_0*d_1*d_3*x^2 + 2*a^2*b*d_0*d_2*d_3*x^2 + 2*a^3*d_1*d_2*d_3*x^2 + 2*a^2*b*d_1*d_2*d_3*x^2 + 4*a^2*b^2*d_1*d_2*d_3*y + 4*a*b^3*d_1*d_2*d_3*y + 4*a^2*b*d_0*d_1*d_3*x*y + 4*a*b^2*d_0*d_2*d_3*x*y + 4*a^2*b*d_1*d_2*d_3*x*y + 4*a*b^2*d_1*d_2*d_3*x*y + 2*a*b^2*d_0*d_1*d_3*y^2 + 2*b^3*d_0*d_2*d_3*y^2 + 2*a*b^2*d_1*d_2*d_3*y^2 + 2*b^3*d_1*d_2*d_3*y^2 + a^2*b^2*d_0*d_1*d_2 + a^2*b^2*d_1*d_2*d_3 + 2*a^3*d_0*d_1*d_3*x + 2*a*b^2*d_0*d_2*d_3*x + 2*a^3*d_1*d_2*d_3*x + 8*a^2*b*d_1*d_2*d_3*x + 2*a*b^2*d_1*d_2*d_3*x + a^2*d_0*d_1*d_3*x^2 + a^2*d_0*d_2*d_3*x^2 + a^2*d_1*d_2*d_3*x^2 + 2*a^2*b*d_0*d_1*d_3*y + 2*b^3*d_0*d_2*d_3*y + 2*a^2*b*d_1*d_2*d_3*y + 8*a*b^2*d_1*d_2*d_3*y + 2*b^3*d_1*d_2*d_3*y + 2*a*b*d_0*d_1*d_3*x*y + 2*a*b*d_0*d_2*d_3*x*y + 2*a*b*d_1*d_2*d_3*x*y + b^2*d_0*d_1*d_3*y^2 + b^2*d_0*d_2*d_3*y^2 + b^2*d_1*d_2*d_3*y^2 + 2*a^2*b*d_0*d_1*d_2 + 2*a*b^2*d_0*d_1*d_2 + 2*a^2*b*d_1*d_2*d_3 + 2*a*b^2*d_1*d_2*d_3 + 4*a^2*d_0*d_1*d_3*x + 4*a*b*d_0*d_2*d_3*x + 4*a^2*d_1*d_2*d_3*x + 4*a*b*d_1*d_2*d_3*x + 4*a*b*d_0*d_1*d_3*y + 4*b^2*d_0*d_2*d_3*y + 4*a*b*d_1*d_2*d_3*y + 4*b^2*d_1*d_2*d_3*y + a^2*d_0*d_1*d_2 + 4*a*b*d_0*d_1*d_2 + b^2*d_0*d_1*d_2 + a^2*d_0*d_1*d_3 + b^2*d_0*d_2*d_3 + a^2*d_1*d_2*d_3 + 4*a*b*d_1*d_2*d_3 + b^2*d_1*d_2*d_3 + 2*a*d_0*d_1*d_3*x + 2*a*d_0*d_2*d_3*x + 2*a*d_1*d_2*d_3*x + 2*b*d_0*d_1*d_3*y + 2*b*d_0*d_2*d_3*y + 2*b*d_1*d_2*d_3*y + 2*a*d_0*d_1*d_2 + 2*b*d_0*d_1*d_2 + 2*a*d_0*d_1*d_3 + 2*b*d_0*d_2*d_3 + 2*a*d_1*d_2*d_3 + 2*b*d_1*d_2*d_3 + d_0*d_1*d_2 + d_0*d_1*d_3 + d_0*d_2*d_3 + d_1*d_2*d_3;
E_4 = a^2*b*d_1*d_2*d_3*t_0*x + a*b^2*d_1*d_2*d_3*t_0*y + a^2*d_1*d_2*d_3*t_0*x + a*b*d_1*d_2*d_3*t_0*x + a*b*d_0*d_2*d_3*t_1*x + a^2*d_0*d_1*d_3*t_2*x + a*b*d_1*d_2*d_3*t_0*y + b^2*d_1*d_2*d_3*t_0*y + b^2*d_0*d_2*d_3*t_1*y + a*b*d_0*d_1*d_3*t_2*y + a*b*d_1*d_2*d_3*t_0 + a*b*d_0*d_1*d_2*t_3 + a*d_1*d_2*d_3*t_0*x + a*d_0*d_2*d_3*t_1*x + a*d_0*d_1*d_3*t_2*x + b*d_1*d_2*d_3*t_0*y + b*d_0*d_2*d_3*t_1*y + b*d_0*d_1*d_3*t_2*y + a*d_1*d_2*d_3*t_0 + b*d_1*d_2*d_3*t_0 + b*d_0*d_2*d_3*t_1 + a*d_0*d_1*d_3*t_2 + a*d_0*d_1*d_2*t_3 + b*d_0*d_1*d_2*t_3 + d_1*d_2*d_3*t_0 + d_0*d_2*d_3*t_1 + d_0*d_1*d_3*t_2 + d_0*d_1*d_2*t_3;

-- Non-degeneracy assumptions: d_k, a+1, b_1, x+y-1 are never zero
gc_0 = d_0*z_0-1;
gc_1 = d_1*z_1-1;
gc_2 = d_2*z_2-1;
gc_3 = d_3*z_3-1;
gc_4 = (a+1)*r-1;
gc_5 = (b+1)*s-1;
gc_6 = (x+y-1)*h-1;
GC = {gc_0,gc_1,gc_2,gc_3,gc_4,gc_5,gc_6};

-- Input from previous sessions
q = b^2*t_1^2*d_0*d_2^2-2*b^2*t_1*t_3*d_0*d_2^2+b^2*t_3^2*d_0*d_2^2+b^2*t_0^2*d_1*d_2^2-2*b^2*t_0*t_3*d_1*d_2^2+b^2*t_3^2*d_1*d_2^2+b^2*t_0^2*d_2^2*d_3-2*b^2*t_0*t_1*d_2^2*d_3+b^2*t_1^2*d_2^2*d_3+2*b*t_0*t_2*d_0*d_1*d_2-2*b*t_0*t_3*d_0*d_1*d_2-2*b*t_2*t_3*d_0*d_1*d_2+2*b*t_3^2*d_0*d_1*d_2+2*b*t_1^2*d_0*d_2^2-4*b*t_1*t_3*d_0*d_2^2+2*b*t_3^2*d_0*d_2^2+2*b*t_0^2*d_1*d_2^2-4*b*t_0*t_3*d_1*d_2^2+2*b*t_3^2*d_1*d_2^2-2*b*t_0*t_1*d_0*d_2*d_3+2*b*t_1^2*d_0*d_2*d_3+2*b*t_0*t_2*d_0*d_2*d_3-2*b*t_1*t_2*d_0*d_2*d_3+2*b*t_0^2*d_2^2*d_3-4*b*t_0*t_1*d_2^2*d_3+2*b*t_1^2*d_2^2*d_3+t_2^2*d_0^2*d_1-2*t_2*t_3*d_0^2*d_1+t_3^2*d_0^2*d_1+t_1^2*d_0^2*d_2-2*t_1*t_3*d_0^2*d_2+t_3^2*d_0^2*d_2+2*t_0*t_2*d_0*d_1*d_2-2*t_0*t_3*d_0*d_1*d_2-2*t_2*t_3*d_0*d_1*d_2+2*t_3^2*d_0*d_1*d_2+t_1^2*d_0*d_2^2-2*t_1*t_3*d_0*d_2^2+t_3^2*d_0*d_2^2+t_0^2*d_1*d_2^2-2*t_0*t_3*d_1*d_2^2+t_3^2*d_1*d_2^2+t_1^2*d_0^2*d_3-2*t_1*t_2*d_0^2*d_3+t_2^2*d_0^2*d_3-2*t_0*t_1*d_0*d_2*d_3+2*t_1^2*d_0*d_2*d_3+2*t_0*t_2*d_0*d_2*d_3-2*t_1*t_2*d_0*d_2*d_3+t_0^2*d_2^2*d_3-2*t_0*t_1*d_2^2*d_3+t_1^2*d_2^2*d_3;
l = a*t_1*t_2^2*d_0*d_1-2*a*t_1*t_2*t_3*d_0*d_1-a*t_2^2*t_3*d_0*d_1+a*t_1*t_3^2*d_0*d_1+2*a*t_2*t_3^2*d_0*d_1-a*t_3^3*d_0*d_1+b*t_1^2*t_2*d_0*d_2-b*t_1^2*t_3*d_0*d_2-2*b*t_1*t_2*t_3*d_0*d_2+2*b*t_1*t_3^2*d_0*d_2+b*t_2*t_3^2*d_0*d_2-b*t_3^3*d_0*d_2+a*t_0^2*t_1*d_1*d_2+b*t_0^2*t_2*d_1*d_2-a*t_0^2*t_3*d_1*d_2-b*t_0^2*t_3*d_1*d_2-2*a*t_0*t_1*t_3*d_1*d_2-2*b*t_0*t_2*t_3*d_1*d_2+2*a*t_0*t_3^2*d_1*d_2+2*b*t_0*t_3^2*d_1*d_2+a*t_1*t_3^2*d_1*d_2+b*t_2*t_3^2*d_1*d_2-a*t_3^3*d_1*d_2-b*t_3^3*d_1*d_2+a*t_0^2*t_1*d_1*d_3-2*a*t_0*t_1*t_2*d_1*d_3+a*t_1*t_2^2*d_1*d_3-a*t_0^2*t_3*d_1*d_3+2*a*t_0*t_2*t_3*d_1*d_3-a*t_2^2*t_3*d_1*d_3+b*t_0^2*t_2*d_2*d_3-2*b*t_0*t_1*t_2*d_2*d_3+b*t_1^2*t_2*d_2*d_3-b*t_0^2*t_3*d_2*d_3+2*b*t_0*t_1*t_3*d_2*d_3-b*t_1^2*t_3*d_2*d_3+t_0*t_2^2*d_0*d_1+t_1*t_2^2*d_0*d_1-2*t_0*t_2*t_3*d_0*d_1-2*t_1*t_2*t_3*d_0*d_1-2*t_2^2*t_3*d_0*d_1+t_0*t_3^2*d_0*d_1+t_1*t_3^2*d_0*d_1+4*t_2*t_3^2*d_0*d_1-2*t_3^3*d_0*d_1+t_0*t_1^2*d_0*d_2+t_1^2*t_2*d_0*d_2-2*t_0*t_1*t_3*d_0*d_2-2*t_1^2*t_3*d_0*d_2-2*t_1*t_2*t_3*d_0*d_2+t_0*t_3^2*d_0*d_2+4*t_1*t_3^2*d_0*d_2+t_2*t_3^2*d_0*d_2-2*t_3^3*d_0*d_2+t_0^2*t_1*d_1*d_2+t_0^2*t_2*d_1*d_2-2*t_0^2*t_3*d_1*d_2-2*t_0*t_1*t_3*d_1*d_2-2*t_0*t_2*t_3*d_1*d_2+4*t_0*t_3^2*d_1*d_2+t_1*t_3^2*d_1*d_2+t_2*t_3^2*d_1*d_2-2*t_3^3*d_1*d_2+t_0*t_1^2*d_0*d_3-2*t_0*t_1*t_2*d_0*d_3+t_0*t_2^2*d_0*d_3-t_1^2*t_3*d_0*d_3+2*t_1*t_2*t_3*d_0*d_3-t_2^2*t_3*d_0*d_3+t_0^2*t_1*d_1*d_3-2*t_0*t_1*t_2*d_1*d_3+t_1*t_2^2*d_1*d_3-t_0^2*t_3*d_1*d_3+2*t_0*t_2*t_3*d_1*d_3-t_2^2*t_3*d_1*d_3+t_0^2*t_2*d_2*d_3-2*t_0*t_1*t_2*d_2*d_3+t_1^2*t_2*d_2*d_3-t_0^2*t_3*d_2*d_3+2*t_0*t_1*t_3*d_2*d_3-t_1^2*t_3*d_2*d_3;
L_0 = x*a*t_1+y*b*t_2-x*a*t_3-y*b*t_3-x*t_0-y*t_0+x*t_1+y*t_2+t_0-t_3;

-- J is the idea of relations plus genericity conditions
J = ideal(E_0,E_1,E_2,E_3,E_4) + ideal(GC);

-- I is the idea of relations plus the newly found q, l, L_0
I = J + ideal(q,l,L_0); 

time g = gb(I, DegreeLimit => 13); 
GB = selectInSubring(1, gens g);

L_1 = GB_(0,1);
toString factor L_1
--output appended at the end of this file

exit


-- OUTPUT: 
----------

q = b^2*t_1^2*d_0*d_2^2-2*b^2*t_1*t_3*d_0*d_2^2+b^2*t_3^2*d_0*d_2^2+b^2*t_0^2*d_1*d_2^2-2*b^2*t_0*t_3*d_1*d_2^2+b^2*t_3^2*d_1*d_2^2+b^2*t_0^2*d_2^2*d_3-2*b^2*t_0*t_1*d_2^2*d_3+b^2*t_1^2*d_2^2*d_3+2*b*t_0*t_2*d_0*d_1*d_2-2*b*t_0*t_3*d_0*d_1*d_2-2*b*t_2*t_3*d_0*d_1*d_2+2*b*t_3^2*d_0*d_1*d_2+2*b*t_1^2*d_0*d_2^2-4*b*t_1*t_3*d_0*d_2^2+2*b*t_3^2*d_0*d_2^2+2*b*t_0^2*d_1*d_2^2-4*b*t_0*t_3*d_1*d_2^2+2*b*t_3^2*d_1*d_2^2-2*b*t_0*t_1*d_0*d_2*d_3+2*b*t_1^2*d_0*d_2*d_3+2*b*t_0*t_2*d_0*d_2*d_3-2*b*t_1*t_2*d_0*d_2*d_3+2*b*t_0^2*d_2^2*d_3-4*b*t_0*t_1*d_2^2*d_3+2*b*t_1^2*d_2^2*d_3+t_2^2*d_0^2*d_1-2*t_2*t_3*d_0^2*d_1+t_3^2*d_0^2*d_1+t_1^2*d_0^2*d_2-2*t_1*t_3*d_0^2*d_2+t_3^2*d_0^2*d_2+2*t_0*t_2*d_0*d_1*d_2-2*t_0*t_3*d_0*d_1*d_2-2*t_2*t_3*d_0*d_1*d_2+2*t_3^2*d_0*d_1*d_2+t_1^2*d_0*d_2^2-2*t_1*t_3*d_0*d_2^2+t_3^2*d_0*d_2^2+t_0^2*d_1*d_2^2-2*t_0*t_3*d_1*d_2^2+t_3^2*d_1*d_2^2+t_1^2*d_0^2*d_3-2*t_1*t_2*d_0^2*d_3+t_2^2*d_0^2*d_3-2*t_0*t_1*d_0*d_2*d_3+2*t_1^2*d_0*d_2*d_3+2*t_0*t_2*d_0*d_2*d_3-2*t_1*t_2*d_0*d_2*d_3+t_0^2*d_2^2*d_3-2*t_0*t_1*d_2^2*d_3+t_1^2*d_2^2*d_3

l = a*t_1*t_2^2*d_0*d_1-2*a*t_1*t_2*t_3*d_0*d_1-a*t_2^2*t_3*d_0*d_1+a*t_1*t_3^2*d_0*d_1+2*a*t_2*t_3^2*d_0*d_1-a*t_3^3*d_0*d_1+b*t_1^2*t_2*d_0*d_2-b*t_1^2*t_3*d_0*d_2-2*b*t_1*t_2*t_3*d_0*d_2+2*b*t_1*t_3^2*d_0*d_2+b*t_2*t_3^2*d_0*d_2-b*t_3^3*d_0*d_2+a*t_0^2*t_1*d_1*d_2+b*t_0^2*t_2*d_1*d_2-a*t_0^2*t_3*d_1*d_2-b*t_0^2*t_3*d_1*d_2-2*a*t_0*t_1*t_3*d_1*d_2-2*b*t_0*t_2*t_3*d_1*d_2+2*a*t_0*t_3^2*d_1*d_2+2*b*t_0*t_3^2*d_1*d_2+a*t_1*t_3^2*d_1*d_2+b*t_2*t_3^2*d_1*d_2-a*t_3^3*d_1*d_2-b*t_3^3*d_1*d_2+a*t_0^2*t_1*d_1*d_3-2*a*t_0*t_1*t_2*d_1*d_3+a*t_1*t_2^2*d_1*d_3-a*t_0^2*t_3*d_1*d_3+2*a*t_0*t_2*t_3*d_1*d_3-a*t_2^2*t_3*d_1*d_3+b*t_0^2*t_2*d_2*d_3-2*b*t_0*t_1*t_2*d_2*d_3+b*t_1^2*t_2*d_2*d_3-b*t_0^2*t_3*d_2*d_3+2*b*t_0*t_1*t_3*d_2*d_3-b*t_1^2*t_3*d_2*d_3+t_0*t_2^2*d_0*d_1+t_1*t_2^2*d_0*d_1-2*t_0*t_2*t_3*d_0*d_1-2*t_1*t_2*t_3*d_0*d_1-2*t_2^2*t_3*d_0*d_1+t_0*t_3^2*d_0*d_1+t_1*t_3^2*d_0*d_1+4*t_2*t_3^2*d_0*d_1-2*t_3^3*d_0*d_1+t_0*t_1^2*d_0*d_2+t_1^2*t_2*d_0*d_2-2*t_0*t_1*t_3*d_0*d_2-2*t_1^2*t_3*d_0*d_2-2*t_1*t_2*t_3*d_0*d_2+t_0*t_3^2*d_0*d_2+4*t_1*t_3^2*d_0*d_2+t_2*t_3^2*d_0*d_2-2*t_3^3*d_0*d_2+t_0^2*t_1*d_1*d_2+t_0^2*t_2*d_1*d_2-2*t_0^2*t_3*d_1*d_2-2*t_0*t_1*t_3*d_1*d_2-2*t_0*t_2*t_3*d_1*d_2+4*t_0*t_3^2*d_1*d_2+t_1*t_3^2*d_1*d_2+t_2*t_3^2*d_1*d_2-2*t_3^3*d_1*d_2+t_0*t_1^2*d_0*d_3-2*t_0*t_1*t_2*d_0*d_3+t_0*t_2^2*d_0*d_3-t_1^2*t_3*d_0*d_3+2*t_1*t_2*t_3*d_0*d_3-t_2^2*t_3*d_0*d_3+t_0^2*t_1*d_1*d_3-2*t_0*t_1*t_2*d_1*d_3+t_1*t_2^2*d_1*d_3-t_0^2*t_3*d_1*d_3+2*t_0*t_2*t_3*d_1*d_3-t_2^2*t_3*d_1*d_3+t_0^2*t_2*d_2*d_3-2*t_0*t_1*t_2*d_2*d_3+t_1^2*t_2*d_2*d_3-t_0^2*t_3*d_2*d_3+2*t_0*t_1*t_3*d_2*d_3-t_1^2*t_3*d_2*d_3

L_0 = x*a*t_1+y*b*t_2-x*a*t_3-y*b*t_3-x*t_0-y*t_0+x*t_1+y*t_2+t_0-t_3

L_1 = x*a*b^2*t_1*d_2-x*a*b^2*t_3*d_2-x*b^2*t_0*d_2+2*x*a*b*t_1*d_2+x*b^2*t_1*d_2-2*x*a*b*t_3*d_2+x*a*t_1*d_0-x*b*t_2*d_0-x*a*t_3*d_0+x*b*t_3*d_0-2*x*b*t_0*d_2+b^2*t_0*d_2+x*a*t_1*d_2+2*x*b*t_1*d_2-x*a*t_3*d_2-b^2*t_3*d_2+x*t_1*d_0-x*t_2*d_0+b*t_2*d_0-b*t_3*d_0-x*t_0*d_2+2*b*t_0*d_2+x*t_1*d_2-2*b*t_3*d_2+t_2*d_0-t_3*d_0+t_0*d_2-t_3*d_2
