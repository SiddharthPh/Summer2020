import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
#Bernoulli Distribution

data_bern = bernoulli.rvs(size=1000,p=0.130)
ax = sns.distplot(data_bern,
	                 kde=True,
	                color='crimson',
                  hist_kws={"linewidth": 20,'alpha':1})

plt.show()
