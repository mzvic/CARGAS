"""
Fix file that looks like:
1799,23.191799,23.21799,23.21799,23.21799,23.21799,23.21799,23.21799,23.21799
to make look like:
1799,23.19
1799,23.21
1799,23.21
1799,23.21
...
"""

with open("CAL2.txt", "r") as f:
    ex_str = f.read()


output = ""
pt100 = []
temp = []
output = []
for i in ex_str.split(","):
    if len(i) == 4 and i[2] != ".":
        pt100.append(i)
    else:
        temp.append(i[0:5])
        pt100.append(i[5:])


for i in range(len(pt100)):
    try:
        output.append(pt100[i] + "," + temp[i])
    except:
        output.append(pt100[i] + ",")

with open("fixCAL2.txt", "a+") as f:
    for i in output:
        if len(i) < 10:
            pass
        else:
            f.write(i + "\n")