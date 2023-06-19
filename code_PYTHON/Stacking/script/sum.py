a = [0.000,0.125,0.250,0.375,0.500,0.625,0.750,0.875,1.000]
with open("SUMMARY.txt", "wt") as f:
    for i in a:
        with open("%.3f/OSZICAR"%i) as fin:
            for line in fin:
                pass
            print(i,line[:-1], file=f)