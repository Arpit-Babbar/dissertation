from gradau import *
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams
rcParams['font.size'] = 14
rcParams['font.family'] = 'serif'
rcParams['figure.autolayout'] = True
rcParams['lines.linewidth'] = 2
rcParams['lines.markersize'] = 6
rcParams['axes.titlesize'] = 19
rcParams['axes.labelsize'] = 14
rcParams['text.usetex'] = True    # This will use Latex fonts (slow)
import argparse

parser=argparse.ArgumentParser()
parser.add_argument('-dir', type=str, help='Save Figure Directory', default=None)
parser.add_argument('-degree', type=int, help='Polynomial Degree', default=1)
args = parser.parse_args()


x = np.linspace(-1,1,100)
fig, ax = plt.subplots()
plt.plot(x,gl(1,x), label="$g_L$")
plt.plot(x,gr(1,x), label="$g_R$")
plt.title("Degree $N+1$", fontsize = 34)
plt.xticks([-1.0,0.0,1.0])
plt.yticks([0.0,1.0])
right_side, top_side = ax.spines["right"], ax.spines["top"]
right_side.set_visible(False); top_side.set_visible(False)

# plt.axis("off")
plt.legend()
if args.dir!=None:
   if args.dir[-1]=='/':
      plt.savefig(args.dir+'corr.pdf')
   else:
      plt.savefig(args.dir+'/'+'corr.pdf')
plt.show()
