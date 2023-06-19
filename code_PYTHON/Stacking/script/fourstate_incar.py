#!/usr/bin/env python
# coding: utf-8

# In[25]:


import sys
import math

fout = open('INCAR', 'w')

Outter = int(sys.argv[1])

Index = Outter-1
#Jxx
a1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
a2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
a3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
a4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jxy
b1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
b2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
b3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
b4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jxz
c1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
c2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
c3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
c4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jyx
d1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
d2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
d3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
d4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jyy
e1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
e2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
e3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
e4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jyz
f1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
f2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
f3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
f4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jzx
g1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
g2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
g3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
g4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 -5 0 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jzy
h1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
h2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
h3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
h4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 -5 0 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
#Jzz
i1="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
i2="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
i3="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"
i4="0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 -5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5 0 0 5"


total=[a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,d1,d2,d3,d4,e1,e2,e3,e4,f1,f2,f3,f4,g1,g2,g3,g4,h1,h2,h3,h4,i1,i2,i3,i4]

Magmom=total[Index]

fout.write(
'''NonCollinear Magnetic Calculation
ISPIN      =  2        (Spin polarised DFT)
MAGMOM   =  %s  150*0     (Set this parameters manually)
LASPH      = .TRUE.    (Non-spherical elements; d/f convergence)
GGA_COMPAT = .FALSE.   (Apply spherical cutoff on gradient field)
VOSKOWN    =  1        (Enhances the magnetic moments and the magnetic energies)
LMAXMIX    =  4        (For d elements increase LMAXMIX to 4, f: LMAXMIX = 6)
AMIX       =  0.2    (Mixing parameter to control SCF convergence)
BMIX       =  0.0001 (Mixing parameter to control SCF convergence)
AMIX_MAG   =  0.4    (Mixing parameter to control SCF convergence)
BMIX_MAG   =  0.0001 (Mixing parameter to control SCF convergence)
ISYM = -1
LSORBIT    = .TRUE.    (Activate SOC)

DFT+U Calculation
LDAU   = .TRUE.        (Activate DFT+U)
LDATYPE=  2            (Dudarev; only U-J matters)
LDAUL  =  2 -1         (Orbitals for each species)
LDAUU  =  3.2  0         (U for each species)
LDAUJ  =  0  0         (J for each species)
LMAXMIX=  4            (Mixing cut-off; 4-d, 6-f)
 
Global Parameters
ISTART =  0           (Read existing wavefunction; if there)

ICHARG =  11        (Non-self-consistent: GGA/LDA band structures)
LREAL  = .FALSE.       (Projection operators: automatic)
ENCUT  =  450        (Cut-off energy for plane wave basis set, in eV)
PREC   =  Normal       (Precision level)
LWAVE  = .F.        (Write WAVECAR or not)
LCHARG = .F.        (Write CHGCAR or not)
ADDGRID= .TRUE.        (Increase grid; helps GGA convergence)
 
Lattice Relaxation
ISMEAR =  0            (gaussian smearing method)
SIGMA  =  0.05         (please check the width of the smearing)
LORBIT =  11           (PAW radii for projected DOS)
NELM   =  60           (Max electronic SCF steps)
EDIFF  =  1E-06     (SCF energy convergence; in eV)
'''%(Magmom))

fout.close()

