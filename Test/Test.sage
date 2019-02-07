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
        self.t = [None for _ in range(7)]
        self.d = [None for _ in range(7)]

    # We first verify that the Input is valid

    def test_input(self):
        """Test wether the input given is a list of 14 rational numbers,
        and check that non-degeneracy conditions are satisfied"""

        Input = self.Input
        td_format = self.td_format

        error_message = 'Input must be a list of 14 rational numbers'
        if isinstance(Input, list) is False:
            print error_message
            return False

        if len(Input) != 14:
            print error_message
            return False

        for i in range(14):
            if (isinstance(Input[i], sage.rings.integer.Integer) or isinstance(
                    Input[i], sage.rings.rational.Rational)) is False:
                print error_message
                return False

        error_message = 'Eigenvalues cannot be zero'
        if td_format is False:
            for i in range(14):
                if Input[i] == 0:
                    print error_message
                    return False
        else:
            for i in range(4):
                if Input[2 * i + 1] == 0:
                    print error_message
                    return False
            for i in range(8, 14):
                if Input[i] == 0:
                    print error_message
                    return False

        print 'Input OK'
        return True

    # Construct the variables u,v,t,d from Input

    def build_vars(self):
        Input = self.Input
        if self.td_format is False:
            for i in range(7):
                self.u[i] = Input[2 * i]
                self.v[i] = Input[2 * i + 1]
            for i in range(7):
                self.t[i] = Input[2 * i] + Input[2 * i + 1]
                self.d[i] = Input[2 * i] * Input[2 * i + 1]
        else:  # td_format is True
            for i in range(4, 7):
                self.u[i] = Input[2 * i]
                self.v[i] = Input[2 * i + 1]
            for i in range(4):
                self.t[i] = Input[2 * i]
                self.d[i] = Input[2 * i + 1]
            for i in range(4, 7):
                self.t[i] = Input[2 * i] + Input[2 * i + 1]
                self.d[i] = Input[2 * i] * Input[2 * i + 1]

    # Print to console the values of u,v,t,d that we will work with

    def print_variables(self):
        print 'Input:', Input, '\n'
        print 'td_format is:', td_format, '\n'
        print 'Value of the variables:\n'
        
        t, d = self.t[:4], self.d[:4]
        u, v = self.u[4:], self.v[4:]

        for i in range(4):
            print 't_{} ='.format(i), eval('t[{}]'.format(i))
            print 'd_{} ='.format(i), eval('d[{}]'.format(i)), '\n'
        for i in range(3):
            print 'u_{} ='.format(i), eval('u[{}]'.format(i))
            print 'v_{} ='.format(i), eval('v[{}]'.format(i)), '\n'

    # Check that the previously known relations are satisfied

    def test_old_relations(self):
        """Test if the given input satisfies the previously known relations.
        If this function returns False then the input is not realizable for
        obvious reasons"""

        u, v = self.u, self.v
        t, d = self.t, self.d

        # Values that need to be checked:
        Lefschetz0 = sum(1 / d[i] for i in range(7))
        Lefschetz1 = sum(t[i] / d[i] for i in range(7))
        Lefschetz2 = sum(t[i]**2 / d[i] for i in range(7))
        Relative_Lefschetz = sum(v[i] / u[i] for i in range(4, 7))
        Tangential_Lefschetz = sum(1 / u[i] for i in range(4, 7))

        # Do the check
        input_ok = True
        error_message = 'Warning: Relation <{}> is not satisfied'
        if Lefschetz0 != 1:
            print error_message.format('Lefschetz0')
            input_ok = False
        if Lefschetz1 != 4:
            print error_message.format('Lefschetz1')
            input_ok = False
        if Lefschetz2 != 16:
            print error_message.format('Lefschetz2')
            input_ok = False
        if Relative_Lefschetz != 1:
            print error_message.format('Relative_Lefschetz')
            input_ok = False
        if Tangential_Lefschetz != 1:
            print error_message.format('Tangential_Lefschetz')
            input_ok = False

        # If no error print OK
        if input_ok is True:
            print 'All the previously known relations are satisfied'

    # Construct the ideals of relations

    def build_ideals(self):
        """Use all the equations available to build I and J, ideals of R.
        This requires the files 'formulas_td.txt' and formulas_eij.txt'"""

        t_0, t_1, t_2, t_3 = self.t[:4]
        d_0, d_1, d_2, d_3 = self.d[:4]
        u_4, u_5, u_6 = self.u[4:]
        v_4, v_5, v_6 = self.v[4:]

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

        # Build ideals and return (I, J)
        Gens = [eval(expr) for expr in Formulas_td + Formulas_eij]
        self.I = ideal(Gens + gc)
        self.J = ideal(Gens + degen)

    # The Test

    def Test(self):
        if self.I.dimension() != -1:
            I_elim = self.I.elimination_ideal(w)
            g = I_elim.gens()
            dim = I_elim.dimension()
            degs = [poly.degree() for poly in g]
            print 'Dimension of I =', dim, '\n'
            print 'Generators of I:\n'
            print 'Found a basis with {} generators'.format(len(g))
            print 'Degree of the generators:', degs, '\n'
            print 'List of generators:'
            print g, '\n'
            print 'Test PASSED'
        else:
            print 'Dimension of I = -1\n'
            print 'Test FAILED'


# ##### End of Class Sample #####


R = QQ['w,c_0,c_1,c_2,c_3,c_4,c_5,a,b']
(w, c_0, c_1, c_2, c_3, c_4, c_5, a, b) = R.gens()


def Perform_Full_Test(Input, td_format):
    sample = Sample(Input, td_format)

    valid = sample.test_input()
    if not valid:
        return

    sample.build_vars()
    sample.print_variables()
    sample.test_old_relations()
    sample.build_ideals()
    sample.Test()


# Main function

if __name__ == '__main__':
    Input = sage_eval(sys.argv[1])
    td_format = eval(sys.argv[2])

    Perform_Full_Test(Input, td_format)
