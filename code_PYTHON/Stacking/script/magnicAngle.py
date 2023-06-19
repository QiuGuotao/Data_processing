import math, sys


a = int(sys.argv[1])
b = int(sys.argv[2])
C = math.pi/3

c = a**2 + b**2 -2*a*b*math.cos(C)
sinB = b*math.sin(C)/math.sqrt(c)

print (math.asin(sinB)*180/(math.pi))

