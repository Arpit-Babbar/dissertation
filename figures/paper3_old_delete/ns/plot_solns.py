from mpl import *
import matplotlib.pyplot as plt
import numpy as np
import argparse
import os


vel_x_cfl   = np.loadtxt("vel_x_cfl.txt")
vel_y_cfl   = np.loadtxt("vel_y_cfl.txt")
vel_x_error = np.loadtxt("vel_x_error_based.txt")
vel_y_error = np.loadtxt("vel_y_error_based.txt")
vel_x_exact = np.loadtxt("lid_driven_cavity_x_vs_u2_r1000.txt")
vel_y_exact = np.loadtxt("lid_driven_cavity_y_vs_u1_r1000.txt")


plt.figure()
plt.xlabel('$v_x$')
plt.ylabel('$y$')

plt.plot(vel_x_cfl[:,1], vel_x_cfl[:,0], label='CFL Based', fillstyle='none',c='b')
plt.plot(vel_x_error[:,1], vel_x_error[:,0], ls =  "--", label='Error based', fillstyle='none',c='r')
plt.plot(vel_x_exact[:,1], vel_x_exact[:,0], marker = 'o',ls = 'None', label='Ghia et al',c='black')
plt.legend()
plt.grid(True,linestyle='--')
plt.savefig("velx.pdf")

plt.figure()
plt.xlabel('$v_y$')
plt.ylabel('$x$')

plt.plot(vel_y_cfl[:,1], vel_y_cfl[:,0], label='CFL Based', fillstyle='none',c='b')
plt.plot(vel_y_error[:,1], vel_y_error[:,0], ls =  "--", label='Error based', fillstyle='none',c='r')
plt.plot(vel_y_exact[:,1], vel_y_exact[:,0], marker = 'o',ls = 'None', label='Ghia et al', c='black')
plt.legend()
plt.grid(True,linestyle='--')
plt.savefig("vely.pdf")
os.system('bash pdfbb *pdf')
