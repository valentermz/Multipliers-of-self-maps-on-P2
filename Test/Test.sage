#! /usr/bin/env sage

import sys


class Sample:

    """Instances of this class are 'samples' to be submitted to the Test"""

    def __init__(self, Input, td_format):
        """Initialize by providing a list of 14 rational numbers"""
        self.Input = Input
        self.td_format = td_format
        self.u = [None for _ in range(7)]
        self.v = [None for _ in range(7)]
        self.t = [None for _ in range(4)]
        self.d = [None for _ in range(4)]

    # Construct the variables u,v,t,d from Input

    def build_vars(self):
        Input = self.Input
        if self.td_format is False:
            for i in range(7):
                self.u[i] = Input[2 * i]
                self.v[i] = Input[2 * i + 1]
            for i in range(4):
                self.t[i] = Input[2 * i] + Input[2 * i + 1]
                self.d[i] = Input[2 * i] * Input[2 * i + 1]
        else:
            for i in range(4, 7):
                self.u[i] = Input[2 * i]
                self.v[i] = Input[2 * i + 1]
            for i in range(4):
                self.t[i] = Input[2 * i]
                self.d[i] = Input[2 * i + 1]

    # Construct the ideal of relations

    def build_ideals(self):
        """Use all the equations available to build I and J, ideals of R"""

        u_4, u_5, u_6 = self.u[4:]
        v_4, v_5, v_6 = self.v[4:]
        t_0, t_1, t_2, t_3 = self.t
        d_0, d_1, d_2, d_3 = self.d

        # Import formulas for t,d as a list of strings
        Formulas_td = [line.rstrip('\n') for line in open('formulas_td.txt')]

        # Definition of the invariant functions e_{ij}
        e10 = u_4+u_5+u_6
        e20 = u_4*u_5+u_5*u_6+u_6*u_4
        e30 = u_4*u_5*u_6
        e01 = v_4+v_5+v_6
        e11 = u_4*(v_5+v_6)+u_5*(v_6+v_4)+u_6*(v_4+v_5)
        e12 = u_4*(v_5*v_6)+u_5*(v_6*v_4)+u_6*(v_4*v_5)
        e02 = v_4*v_5+v_5*v_6+v_6*v_4
        e21 = v_4*(u_5*u_6)+v_5*(u_6*u_4)+v_6*(u_4*u_5)
        e03 = v_4*v_5*v_6

        # Import formulas for e_{i,j} as a list of strings
        Formulas_eij = [line.rstrip('\n') for line in open('formulas_eij.txt')]

        # Genericity assumption and degenerate case
        gc = [1 - w*(c_1^2*c_3*c_5+c_2*c_0*c_4^2+c_3^2*c_2^2-c_1*c_0*c_4*c_5-2*c_3*c_0*c_2*c_5+c_0^2*c_5^2-c_1*c_4*c_3*c_2)]
        degen = [c_1^2*c_3*c_5+c_2*c_0*c_4^2+c_3^2*c_2^2-c_1*c_0*c_4*c_5-2*c_3*c_0*c_2*c_5+c_0^2*c_5^2-c_1*c_4*c_3*c_2,
            c_0^2*c_5^2+c_0*c_5*c_2*c_4-2*c_3*c_0*c_2*c_5-c_0*c_5^2*c_1-c_3*c_2^2*c_4+c_3^2*c_2^2+c_3*c_1*c_5*c_2,
            c_0^2*c_4*c_5-c_0*c_3*c_1*c_5-c_3^2*c_2^2+c_1*c_2*c_3^2-c_0^2*c_5^2+2*c_3*c_0*c_2*c_5-c_0*c_4*c_3*c_2]

        # Build the ideals
        Gens = [eval(expr) for expr in Formulas_td + Formulas_eij]
        self.I = ideal(Gens + gc)
        self.J = ideal(Gens + degen)

    def Test(self):
        print self.I.dimension()
        print self.J.dimension()


# ##### The Test #####

# Define multivariate polynomial ring with rational coefficients
R = QQ['w,c_0,c_1,c_2,c_3,c_4,c_5,a,b']
(w, c_0, c_1, c_2, c_3, c_4, c_5, a, b) = R.gens()




# Main function

if __name__ == '__main__':
    Input = sage_eval(sys.argv[1])
    td_format = sage_eval(sys.argv[2])
    sample = Sample(Input, td_format)

    sample.build_vars()
    sample.build_ideals()
    sample.Test()
