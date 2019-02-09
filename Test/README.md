# The Test

Given a collection of fourteen numbers `u_i, v_i`, `i=0,...,6`, test whether or not the collection may be realized as the multipliers of a quadratic endomorphism with an invariant line.  

In order to run this program, the user has to define rational values for the imput variables and a boolean to specify the format.  
There are two options:

* Choose `u_i, v_i` for `i = 0,...,6` then run: `sage Test.sage '[u_0,v_0,...,u_6,v_6]' False`,

* Choose `t_k, d_k` for `i = 0,...,3` and `u_i, v_i` for `i = 4,5,6` then run `sage Test.sage '[t_0,d_0,...,t_3,d_3,u_4,v_4,...,u_6,v_6]' True`.

You can also just run `sage Test.sage` to print the 'usage' message.

