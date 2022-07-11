import numpy as np
from matplotlib import rcParams
rcParams['font.size'] = 14
rcParams['font.family'] = 'serif'
rcParams['figure.autolayout'] = True
rcParams['lines.linewidth'] = 2
rcParams['lines.markersize'] = 6
rcParams['axes.titlesize'] = 15
rcParams['axes.labelsize'] = 14
rcParams['text.usetex'] = True    # This will use Latex fonts (slow)
import os
import matplotlib.pyplot as plt

k = 3
nd = k + 1

def annotate(ax, label, location):
    ax.annotate(label, xy=location,  xycoords='data',
    xytext=location, textcoords='data', fontsize='8',
    horizontalalignment='center', verticalalignment='center', color='black',
    size=17)

# Solution points
xg, wg = np.polynomial.legendre.leggauss(nd)
# Transform to [0,1]
xg = 0.5*(xg + 1.0)
wg = 0.5*wg

xf = np.zeros(nd+2)
xf[0] = 0.0
for i in range(1,nd+1):
    xf[i] = xf[i-1] + wg[i-1]
xf[-1] = 1.0

plt.figure(figsize=(6,2))
ax = plt.gca()
plt.plot(xg,np.zeros(nd),'o')
# plt.plot([0-(1-xg[-1]), 1+xg[0]], [0,0], 'ro')
annotate(ax, "$x_{e-\\frac{1}{2}}$", [xf[0]+0.02, -0.14])
annotate(ax, "$x_{e+\\frac{1}{2}}$", [xf[-1]+0.02, -0.14])
plt.ylim((-0.14,0.14))
for i in range(nd+2):
    plt.plot([xf[i],xf[i]],[-0.1,0.1],'k-')

plt.title("Solution points and subcells")
plt.axis('off')
plt.savefig('../illustrations/subcells.pdf')
os.system('bash pdfbb ../illustrations/subcells.pdf')

plt.show()

