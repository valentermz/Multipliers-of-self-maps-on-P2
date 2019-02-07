# python2

"""Auxiliary definitions for the Test"""


# Step 1: verify that the given imput is valid

def test_input(Input, td_format):
    """Test wether the input given is a list of 14 rational numbers,
    and check non-degeneracy conditions"""

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


# Step 2: Build necessary variables

def build_uv(Input, td_format):
    u = [0 for _ in range(7)]
    v = [0 for _ in range(7)]
    for i in range(7):
        u[i] = Input[2 * i]
        v[i] = Input[2 * i + 1]
    if td_format is True:
        for i in range(4):
            u[i] = None
            v[i] = None
    return (u, v)


def build_td(Input, td_format):
    t = [0 for _ in range(7)]
    d = [0 for _ in range(7)]
    if td_format is False:
        for i in range(4):
            t[i] = Input[2 * i] + Input[2 * i + 1]
            d[i] = Input[2 * i] * Input[2 * i + 1]
    else:
        for i in range(4):
            t[i] = Input[2 * i]
            d[i] = Input[2 * i + 1]
    for i in range(4, 7):
        t[i] = Input[2 * i] + Input[2 * i + 1]
        d[i] = Input[2 * i] * Input[2 * i + 1]
    return (t, d)


# Step 3: Print the value of the variables we work with

def print_variables(Input, td_format):
    print 'Input:', Input, '\n'
    print 'td_format is:', td_format, '\n'
    print 'Value of the variables:\n'

    u, v = build_uv(Input, td_format)
    t, d = build_td(Input, td_format)

    for i in range(4):
        print 't_{} ='.format(i), eval('t[{}]'.format(i))
        print 'd_{} ='.format(i), eval('d[{}]'.format(i)), '\n'
    for i in range(4, 7):
        print '\nu_{} ='.format(i), eval('u[{}]'.format(i))
        print 'v_{} ='.format(i), eval('v[{}]'.format(i)), '\n'


# Step 4 (optional): Check that the previously known relations are satisfied

def test_old_relations(Input, td_format):
    """Test if the given input satisfies the previously known relations.
    If this function returns False then the input is not realizable for
    obvious reasons"""

    u, v = build_uv(Input, td_format)
    t, d = build_td(Input, td_format)

    # Values that need to be checked:
    Lefschetz0 = sum(1 / d[i] for i in range(7))
    Lefschetz1 = sum(t[i] / d[i] for i in range(7))
    Lefschetz2 = sum(t[i]**2 / d[i] for i in range(7))
    Relative_Lefschetz = sum(v[i] / u[i] for i in range(4, 7))
    Tangential_Lefschetz = sum(1 / u[i] for i in range(4, 7))

    # Do the check
    input_ok = True
    error_message = 'Relation <{}> is not satisfied'
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
        return True
    return False


# Step 5: Print the final result

def print_result(J):
    if J.dimension() != -1:
        g = J.gens()
        dim = J.dimension() - 6  # (since we eliminated 6 variables)
        degs = [poly.degree() for poly in g]
        print 'Dimension of J =', dim, '\n'
        print 'Generators of J:\n'
        print 'Found a basis with {} generators'.format(len(g))
        print 'Degree of the generators:', degs, '\n'
        print 'List of generators:'
        print g, '\n'
        print 'Test PASSED'
        return True
    else:
        print 'Dimension of J = -1\n'
        print 'Test FAILED'
        return False
