# python2

"""Auxiliary definitions for TEST.ipynb"""


# Verify that the imput is valid

def test_input(Input, td_format):
    message = 'Input must be a list of 14 rational numbers'
    assert isinstance(Input, list), message
    assert len(Input) == 14, message
    for i in range(14):
        assert isinstance(Input[i], sage.rings.integer.Integer) or isinstance(
            Input[i], sage.rings.rational.Rational), message
    message = 'Eigenvalues cannot be zero'
    if td_format is False:
        for i in range(14):
            assert Input[i] != 0, message
    else:
        for i in range(4):
            assert Input[2 * i + 1] != 0, message
        for i in range(8, 14):
            assert Input[i] != 0, message
    return 'Input OK'


# Check that the previously known relations are satisfied

def test_old_relations(Input, td_format):
    u, v = build_uv(Input, td_format)
    t, d = build_td(Input, td_format)
    # Values that need to be checked:
    Lefschetz0 = sum(1 / d[i] for i in range(7))
    Lefschetz1 = sum(t[i] / d[i] for i in range(7))
    Lefschetz2 = sum(t[i]**2 / d[i] for i in range(7))
    Relative_Lefschetz = sum(v[i] / u[i] for i in range(4, 7))
    Tangential_Lefschetz = sum(1 / u[i] for i in range(4, 7))
    # Do the check
    message = 'Relation <{}> is not satisfied'
    assert Lefschetz0 == 1, message.format('Lefschetz0')
    assert Lefschetz1 == 4, message.format('Lefschetz1')
    assert Lefschetz2 == 16, message.format('Lefschetz2')
    assert Relative_Lefschetz == 1, message.format('Relative_Lefschetz')
    assert Tangential_Lefschetz == 1, message.format('Tangential_Lefschetz')
    # If no error print OK
    return 'All the previously known relations are satisfied'


# Build necessary variables

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


# Print the value of the variables we work with

def print_variables(Input, td_format):
    print 'Input:', Input, '\n'
    print 'td_format is:', td_format, '\n'
    print 'Value of the variables:'

    u, v = build_uv(Input, td_format)
    t, d = build_td(Input, td_format)

    for i in range(4):
        print '\nt_{} ='.format(i), eval('t[{}]'.format(i))
        print 'd_{} ='.format(i), eval('d[{}]'.format(i))
    for i in range(4, 7):
        print '\nu_{} ='.format(i), eval('u[{}]'.format(i))
        print 'v_{} ='.format(i), eval('v[{}]'.format(i))


# Print the final result

def print_result(dim, g):
    print 'Dimension of J =', dim, '\n'
    print 'Generators of J:\n', g, '\n'
    if dim == -1:
        print 'Test FAILED'
    else:
        print 'Test PASSED'
