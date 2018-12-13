# Calculate the Kowalevski exponents of a quadratic vector field in the seventh family having a radial orbit with exponents (-2,-1) and an invariant line tangent to the exponent -1



sols=0
d=[0,0,0,0,0,0,2]
u=[0,0,0,0,1,1,-1]
v=[0,0,0,0,0,0,-2]
l=[0,0,0,0]
e=[0,0,0,0,0]

for e[0] in [3..10]:
    for e[1] in [e[0]..floor(4/(1/2-1/e[0]))]:
        if 1/2+1/e[0]+1/e[1] <> 1:
            if 1/2+1/e[0]+1/e[1]<1:
                min_2=e[1]
                max_2=floor(3/(1/2-1/e[0]-1/e[1]))
            else:
                min_2=ceil(3/(1/2-1/e[0]-1/e[1]))
                max_2=-1
            for e[2] in [min_2..max_2]:
                pos_min=e[1]
                neg_max=-1
                if e[2]>0:
                    pos_min=e[2]
                else:
                    neg_max=e[2]
                if 1/2+1/e[0]+1/e[1]+1/e[2] <> 1:
                    if 1/2+1/e[0]+1/e[1]+1/e[2]<1:
                        min_3=pos_min
                        max_3=floor(2/(1/2-1/e[0]-1/e[1]-1/e[2]))
                    else:
                        min_3=ceil(2/(1/2-1/e[0]-1/e[1]-1/e[2]))
                        max_3=neg_max
                    for e[3] in [min_3..max_3]:
                        if e[3]>0:
                            pos_min=e[3]
                        else:
                            neg_max=e[3]
                        if 1/2+1/e[0]+1/e[1]+1/e[2]+1/e[3] <> 1:
                            e[4]=1/(1/2-1/e[0]-1/e[1]-1/e[2]-1/e[3])
                            if (e[4] in ZZ) and ((e[4] >= pos_min) or (e[4] <= neg_max)):
                                #print e   # uncomment to monitor progress
                                for i in range(5):
                                    if (1+4*e[i]).is_square():
                                        m=-1/2+sqrt(1+4*e[i])/2
                                        v[4]=m
                                        v[5]=-m-1
                                        d[4]=u[4]*v[4]
                                        d[5]=u[5]*v[5]
                                        for j in range(4):
                                            d[j]=e[(j+i+1) % 5]
                                        for l[0] in [j for j in divisors(d[0]) if j^2 <= abs(d[0])]:
                                            for l[1] in [j for j in divisors(d[1]) if j^2 <= abs(d[1])]:
                                                for l[2] in [j for j in divisors(d[2]) if j^2 <= abs(d[2])]:
                                                    for l[3] in [j for j in divisors(d[3]) if j^2 <= abs(d[3])]:
                                                        for choice in Subsets(range(4)):
                                                            s=[1,1,1,1]
                                                            for x in choice:
                                                                s[x]=-1
                                                            for r in range(4):
                                                                u[r]=s[r]*l[r]
                                                                v[r]=d[r]/u[r]
                                                            R_1=sum([(u[q]+v[q])/u[q]/v[q] for q in range(7)])
                                                            R_2=sum([(u[q]+v[q])^2/u[q]/v[q] for q in range(7)])
                                                            if R_1 == 4 and R_2 == 16:
                                                                # test to see if it really belongs to the seventh family
                                                                seventh=True
                                                                for sub_sum in [2..5]:
                                                                    S=Subsets(range(7),sub_sum)
                                                                    for part in S:
                                                                        if sum([1/d[q] for q in part])==1:
                                                                            seventh=False
                                                                if seventh:
                                                                    sols=sols+1
                                                                    print u,',',v
                
print 'there are', sols, 'solutions'
