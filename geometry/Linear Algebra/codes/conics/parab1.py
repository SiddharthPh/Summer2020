import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-1,1)
a=3 
b=0
c=-1
y=a*x**2+b*x+c
x1=(-b+np.sqrt(b**2-4*a*c))/(2*a)
x2=(-b-np.sqrt(b**2-4*a*c))/(2*a)
A=np.array([x1,0])
B=np.array([x2,0])
print(A,B)
plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) , 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1-0.5), B[1] * (1-0.1) , 'B')
plt.plot(x,y)
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
plt.axis('equal')
plt.show() 
