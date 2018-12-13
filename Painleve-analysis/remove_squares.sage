# within the sets in the file '7th_geq3.out', select those where u_i <> v_i

lista=open('7th_geq3.out','r')
r=lista.readlines()
l=[eval(r[j].replace('[','').replace(']','').replace(';',',')) for j in range(168)]


cuantos=0
for i in range(168):
    no_cuadrado = True
    for k in range(7):
        if l[i][k]==l[i][k+7]:
            no_cuadrado = False
    if no_cuadrado:
        print  i, '\t', l[i][0:7],'\t',  [l[i][j]*l[i][j+7] for j in range(7)]
        # print  i, ' & ', [ '$'+str((l[i][j],l[i][j+7]))+'$' for j in range(7)] , '\\' # format to include (almost directly) into the .tex file
        cuantos = cuantos +1
print 'there are ', cuantos
