# within the sets in the file '7th_geq3.out', select those that fulfill the alignment conditions 
# the output has repetitions

E=[[2,5],[-5,12],[1,3],[1,3],[5,-1],[-5,4],[1,2]]
 
 

lista=open('7th_geq3.out','r')
r=lista.readlines()
l=[eval(r[j].replace('[','').replace(']','').replace(';',',')) for j in range(168)]

 

cont=0

for t in range(168):
    for k in range(7):
        E[k][0]=l[t][k]
        E[k][1]=l[t][k+7]

    for pick_3 in Subsets(range(7),3):
        for one_for_each in Subsets(range(3)):
            s=[0,0,0]
            for j in one_for_each:
                s[j]=1;
            if sum([1/E[pick_3[i]][s[i]] for i in range(3)])==1 and sum([E[pick_3[i]][1-s[i]]*(1/E[pick_3[i]][s[i]]) for i in range(3)])==1:
                comp=Set(range(7)).difference(pick_3)
                u=[E[i][0] for i in comp]+[E[pick_3[i]][s[i]] for i in range(3)]
                v=[E[i][1] for i in comp]+[E[pick_3[i]][1-s[i]] for i in range(3)]
                print t,',',u,',',v,',', [u[i]*v[i] for i in range(7)]
                cont = cont + 1
                
print 'there are ', cont
