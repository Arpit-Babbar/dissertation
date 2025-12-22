import numpy as np
from lgl import *
from matplotlib import rcParams
rcParams['font.size'] = 16
rcParams['font.family'] = 'serif'
rcParams['figure.autolayout'] = True
rcParams['lines.linewidth'] = 3
rcParams['lines.markersize'] = 8
rcParams['axes.titlesize'] = 15
rcParams['axes.labelsize'] = 14
rcParams['text.usetex'] = True    # This will use Latex fonts (slow)
from matplotlib import rc
rc('text.latex', preamble = '\\usepackage{color}')
import os
import matplotlib.pyplot as plt

k = 4
nd = k + 1

def annotate(ax, label, location, color = 'black'):
    ax.annotate(label, xy=location,  xycoords='data',
    xytext=location, textcoords='data', fontsize='22',
    horizontalalignment='center', verticalalignment='center', color=color)

# Solution points
xg, wg = lglnodes(k)
# Transform to [0,1]
xg = 0.5*(xg + 1.0)
wg = 0.5*wg

xf = np.zeros(nd+2)
xf[0] = 0.0
for i in range(1,nd+1):
    xf[i] = xf[i-1] + wg[i-1]
xf[-1] = 1.0

plt.figure(figsize=(11.5,2.5))
ax = plt.gca()
plt.plot(xg,np.zeros(nd),'o', label = "GLL nodes")
# plt.plot([0-(1-xg[-1]), 1+xg[0]], [0,0], 'ro')
'''
annotate(ax, "$F_{e-\\frac{1}{2}}$", [xf[0]+0.0,  0.2], color = 'red')
annotate(ax, "$F_{e+\\frac{1}{2}}$", [xf[-1]+0.0, 0.2], color = 'red')
annotate(ax, "$x_{e-\\frac{1}{2}}$", [xf[0]+0.0,  -0.2], color = 'red')
annotate(ax, "$x_{e+\\frac{1}{2}}$", [xf[-1]+0.0, -0.2], color = 'red')
'''
annotate(ax, "$F_{e-\\frac{1}{2}}$", [xf[0]+0.0,  0.16], color = 'red')
annotate(ax, "$F_{e+\\frac{1}{2}}$", [xf[-1]+0.0, 0.16], color = 'red')
annotate(ax, "$x_{e-\\frac{1}{2}}$", [xf[0]+0.0,  -0.16], color = 'red')
annotate(ax, "$x_{e+\\frac{1}{2}}$", [xf[-1]+0.0, -0.16], color = 'red')

for i in range(1,nd):
  # annotate(ax, "$f_{\\frac{"+str(2*i+1)+"}{2}}$", [xf[i]+0.0, -0.14], color = 'blue')
  annotate(ax, "$f_{\\frac{"+str(2*i-1)+"}{2}}$", [xf[i]+0.0, 0.14], color = 'blue')
  # annotate(ax, "$f_{e+\\frac{1}{2}}$", [xf[2]+0.02, -0.17])
plt.ylim((-0.2,0.2))
'''
plt.plot([xf[0],xf[0]],[-0.16,0.16],'r-', label = 'FR element')
plt.plot([xf[-1],xf[-1]],[-0.16,0.16],'r-')
'''
plt.plot([xf[0],xf[0]],[-0.12,0.12],'r-', label = 'FR element')
plt.plot([xf[-1],xf[-1]],[-0.12,0.12],'r-')

for i in range(nd+2):
    # plt.plot([xf[i],xf[i]],[-0.08,0.08],'k-')
    plt.plot([xf[i],xf[i]],[-0.1,0.1],'k-')

print("xf = ",xf)
# Just to put label
# plt.plot([xf[nd+1],xf[nd+1]],[-0.08,0.08],'k-', label = 'Subcells')
plt.plot([xf[nd+1],xf[nd+1]],[-0.1,0.1],'k-', label = 'Subcells')
plt.axis('off')
plt.ylim((-0.2,0.2))
ax.legend(
           # loc='upper center', 
           loc = 'center left', 
           # bbox_to_anchor=(1.2,0.8),
           bbox_to_anchor=(0.98, 0.5),
          fancybox=False, shadow=False)
plt.savefig('subcells_fvm_gll.pdf')

os.system('bash pdfbb subcells_fvm_gll.pdf')

plt.show()

