import numpy as np
import matplotlib.pyplot as plt
a=5
b=-3
M1 = np.array([[a,-b],[b,a]])
A=M1@M1@M1
print("Product is ")
print(np.array([A[0][0],A[1][0]]))


