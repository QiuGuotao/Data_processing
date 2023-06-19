import matplotlib.pyplot as plt

a = []
energy = []
with open("SUMMARY.txt", "r") as fin:
    for line in fin:
        mylist = line.split()
        a.append(float(mylist[0]))
        energy.append(float(mylist[5]))

plt.plot(a, energy, ".-")
plt.ylabel('energy')
plt.xlabel('a')
plt.savefig('energy.png')
plt.show()
