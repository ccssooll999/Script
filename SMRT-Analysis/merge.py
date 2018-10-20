import os
import sys

file = open(sys.argv[1], 'r')
flag = 0
print(sys.argv[3]+'\n')
for line in file:

    if line[0] == ">":
        flag = 0    

    if flag == 1:
        print(line)

    if line[:3] == sys.argv[2]:
        flag = 1
        
