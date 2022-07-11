import numpy as np
import matplotlib.pyplot as plt

a = 0.5
c = 1.0
amin = 0.0001
s = np.log((1.0-amin)/amin)
plt.grid(True)


for k in [1,2,3,4]:
    tol = a*10**(-c*(k+1)**0.25)
    E = np.linspace(0.0,0.05,100)
    alpha = 1.0/(1.0 + np.exp(-s*(E-tol)/tol))
    plt.plot(E,alpha)

plt.legend(('$N=1$','$N=2$','$N=3$','$N=4$'))
plt.xlabel('$E$')
plt.ylabel('$\\alpha$')
plt.title('Blending coefficient function')
plt.savefig("../illustrations/alpha_func.pdf")
plt.show()
