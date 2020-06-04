#Code by GVV Sharma
#Dec 16, 2019
#released under GNU GPL
#Check whether a system of linear equations has a solution

import numpy as np
import matplotlib.pyplot as plt
from coeffs import *

#if using termux
import subprocess
import shlex
#end if



#Lines
n1 = np.array([1,0]) 
n2 = np.array([0.365,-1]) 
c =  np.array([2,0]) 

#Intercepts
A1,B1 =  line_icepts(n1,c[0])
A2,B2 =  line_icepts(n2,c[1])


#Matrix Ranks
N=np.vstack((n1,n2))
M =np.vstack((N.T, c)).T
#M =np.vstack((n1,n2, c))
rank_N = np.linalg.matrix_rank(N)
rank_M = np.linalg.matrix_rank(M)
m,n = np.shape(N)
##Generating all lines
k1 = 0
k2 = 3
D1=np.linalg.inv(N)@c
print("sol.",D1)
x_A1D1 = line_gen(A1,D1)
x_A2D1 = line_gen(A2,D1)

#Plotting all lines
plt.plot(x_A1D1[0,:],x_A1D1[1,:],label='Rain initially')
plt.plot(x_A2D1[0,:],x_A2D1[1,:],label='Rain with wind')
#
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
plt.axis('equal')

#if using termux
#plt.savefig('./line/figs/line_check_sol.pdf')
#plt.savefig('./line/figs/line_check_sol.eps')
#subprocess.run(shlex.split("termux-open ./line/figs/line_check_sol.pdf"))
#else
plt.show()

