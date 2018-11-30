# python2

"""Auxiliary definitions for TEST.ipynb"""


# Verify that the imput is valid

def test_input(Input):
    message = 'Input must be a list of 14 rational numbers'
    assert isinstance(Input, list), message
    assert len(Input) == 14, message
    for i in range(14):
        assert isinstance(Input[i], sage.rings.integer.Integer) or isinstance(
            Input[i], sage.rings.rational.Rational), message
    message = 'Eigenvalues cannot be zero'
    if trace_determinant_format is False:
        for i in range(14):
            assert Input[i] != 0, message
    else:
        for i in range(4):
            assert Input[2 * i + 1] != 0, message
        for i in range(8, 14):
            assert Input[i] != 0, message
    print 'Input OK'


# Build necessary variables

def build_uv(Input):
    u = [0 for _ in range(7)]
    v = [0 for _ in range(7)]
    for i in range(7):
        u[i] = Input[2 * i]
        v[i] = Input[2 * i + 1]
    if trace_determinant_format is True:
        for i in range(4):
            u[i] = None
            v[i] = None
    return (u, v)


def build_td(Input):
    t = [0 for _ in range(4)]
    d = [0 for _ in range(4)]
    if trace_determinant_format is False:
        for i in range(4):
            t[i] = Input[2 * i] + Input[2 * i + 1]
            d[i] = Input[2 * i] * Input[2 * i + 1]
    else:
        for i in range(4):
            t[i] = Input[2 * i]
            d[i] = Input[2 * i + 1]
    return (t, d)


def print_variables(Input):
    pass


def print_result():
    if dim == -1:
        passed = False
    else:
        passed = True
    print 'Test passed:', passed, '\n'
    if passed:
        print 'Generators of J:\n', g
