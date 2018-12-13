# Calculate the sets of integers in the seventh family satisfying the three known relations such that d_i  is at least three for every i


file_out = open('7th_geq3.out','w')

sols=0

d=[0,0,0,0,0,0,0]
l=[0,0,0,0,0,0,0]
u=[0,0,0,0,0,0,0]
v=[0,0,0,0,0,0,0]
p_s=[0,0,0,0,0,0]

for d[0] in [3..7]:
    p_s[0]=sum([1/d[j] for j in range(1)])
    for d[1] in [d[0]..floor(6/(1-p_s[0]))]:
        p_s[1]=sum([1/d[j] for j in range(2)])
        for d[2] in [d[1]..floor(5/(1-p_s[1]))]:
            p_s[2]=sum([1/d[j] for j in range(3)])
            if p_s[2]<> 1:
                for d[3] in [d[2]..floor(4/(1-p_s[2]))]:
                    p_s[3]=sum([1/d[j] for j in range(4)])
                    if p_s[3] <> 1:
                        if p_s[3] > 1:
                            min_4=ceil(3/(1-p_s[3]))
                            max_4=-1
                        else:
                            min_4=d[3]
                            max_4=floor(3/(1-p_s[3]))
                        for d[4] in [min_4..max_4]:
                            p_s[4]=sum([1/d[j] for j in range(5)])
                            if p_s[4] <> 1:
                                min_pos_4=max(d[3],d[4])
                                max_neg_4=min(-1,d[4])
                                if p_s[4] > 1:
                                    min_5=ceil(2/(1-p_s[4]))
                                    max_5=max_neg_4
                                else:
                                    min_5=min_pos_4
                                    max_5=floor(2/(1-p_s[4]))
                                for d[5] in [min_5..max_5]:
                                    p_s[5]=sum([1/d[j] for j in range(6)])
                                    if p_s[5] <> 1:
                                        min_pos_5=max([d[3],d[4],d[5]])
                                        max_neg_5=min([d[4],d[5],-1])
                                        d[6]=1/(1-p_s[5])
                                        if (d[6] in ZZ) and ((d[6] >= min_pos_5) or (d[6] <= max_neg_5)):
                                            # print d # uncomment to monitor progress
                                            for l[0] in [j for j in divisors(d[0]) if j^2 <= abs(d[0])]:
                                                for l[1] in [j for j in divisors(d[1]) if j^2 <= abs(d[1])]:
                                                    for l[2] in [j for j in divisors(d[2]) if j^2 <= abs(d[2])]:
                                                        for l[3] in [j for j in divisors(d[3]) if j^2 <= abs(d[3])]:
                                                            for l[4] in [j for j in divisors(d[4]) if j^2 <= abs(d[4])]:
                                                                for l[5] in [j for j in divisors(d[5]) if j^2 <= abs(d[5])]:
                                                                    for l[6] in [j for j in divisors(d[6]) if j^2 <= abs(d[6])]:
                                                                        for choice in Subsets(range(7)):
                                                                            s=[1,1,1,1,1,1,1]
                                                                            for j in choice:
                                                                                s[j]=-1
                                                                            for r in range(7):
                                                                                u[r]=s[r]*l[r]
                                                                                v[r]=d[r]/u[r]
                                                                            R_1=sum([(u[q]+v[q])/u[q]/v[q] for q in range(7)])
                                                                            R_2=sum([(u[q]+v[q])^2/u[q]/v[q] for q in range(7)])
                                                                            if R_1 == 4 and R_2 == 16:
                                                                                seventh = True
                                                                                for sub_sum in [4..5]:
                                                                                    S=Subsets(range(7),sub_sum)
                                                                                    for part in S:
                                                                                        if sum([1/d[q] for q in part])==1:
                                                                                            seventh = False
                                                                                if seventh:
                                                                                    sols=sols+1
                                                                                    file_out.write(str(u)+";"+str(v)+"\n")
print 'there are', sols, 'solutions'
file_out.close
