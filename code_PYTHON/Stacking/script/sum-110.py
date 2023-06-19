a = [0.000,0.083,0.167,0.250,0.333,0.417,0.500,0.583,0.667,0.750,0.833,0.917,1.000]
with open("SUMMARY.txt", "wt") as f:
    for i in a:
        with open("%.3f/OSZICAR"%i) as fin:
            for line in fin:
                pass
            print(i,line[:-1], file=f)