import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
length_sequence=1000
sample_size=6
event_size=3.14/4
ratio=event_size/sample_size
Z=round(ratio*length_sequence)

def rand_bin_array(K, N):
    arr = np.zeros(N)
    arr[:K]  = 1
    np.random.shuffle(arr)
    return arr
inp1=rand_bin_array(Z,length_sequence)
def ser(N):
	arr=np.arange(1,N+1)
	return arr
inp=ser(length_sequence)

data = {'Serial no.': inp ,
        'Values': inp1
        }
df=pd.DataFrame(data,columns=['Serial no.', 'Values'])
#plt.figure(figsize=(10,8))
#sns.distplot(df['Values'], hist = True, kde = True,
                 #kde_kws = {'linewidth': 1},
                 #)
#plt.plot(df['Serial no.'],(df['Values']))
plt.hist(df['Values'], color = 'blue', edgecolor = 'black',
         bins = int(1000))
plt.xlabel('$Values$')
plt.ylabel('$Number of dice throws$')
plt.show()
