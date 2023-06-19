import sys
import math

a = float(sys.argv[1]) #lateral shift
fout = open('POSCAR', 'w')


fout.write(
'''CrTe2-relax-CONTCAR                     
1.0
        7.7618389130         0.0000000000         0.0000000000
       -3.8808740919         6.7220033999         0.0000000000
        0.0000000000         0.0000000000        21.2000007629
   Cr   Te
    8   16
Selective dynamics
Cartesian
     0.000000000         0.000000000         7.130968255 T T F
     3.880919919         0.000000000         7.130968255 T T F
    -1.940436815         3.361001299         7.130968255 T T F
     1.940483105         3.361001299         7.130968255 T T F
     0.000000000         0.000000000        %.10f T T F
     3.880918994         0.000000000        %.10f T T F
    -1.940437277         3.361002101        %.10f T T F
     1.940481717         3.361002101        %.10f T T F
    -0.000026979         2.240692107         8.731746094 T T F
     1.940510083         1.120309192         5.525625595 T T F
     3.880892478         2.240692107         8.731746094 T T F
     5.821429540         1.120309192         5.525625595 T T F
    -1.940464025         5.601693807         8.731746094 T T F
     0.000072806         4.481311293         5.525625595 T T F
     1.940455432         5.601693807         8.731746094 T T F
     3.880992262         4.481311293         5.525625595 T T F
    -0.000027673         2.240692507        %.10f T T F
     1.940509389         1.120309593        %.10f T T F
     3.880891784         2.240692507        %.10f T T F
     5.821428846         1.120309593        %.10f T T F
    -1.940464487         5.601693807        %.10f T T F
     0.000072343         4.481311293        %.10f T T F
     1.940454969         5.601693807        %.10f T T F
     3.880991800         4.481311293        %.10f T T F
'''%(13.363071589-a,13.363071589-a,13.363071589-a,13.363071589-a,14.968415513-a,11.762294382-a,14.968415513-a,11.762294382-a,14.968415513-a,11.762294382-a,14.968415513-a,11.762294382-a))

fout.close()