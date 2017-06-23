#!/usr/bin/env python
# Copyright (c) Michael Sharpe, 2014
# This is free software, subject to the LATEX Project Public License.

import sys

filename=sys.argv[1]
with open(filename,'r') as f:
	tmp=f.read().splitlines()
s='\n'.join(tmp)
tmp=s.split("%Repetitions=")
if len(tmp) != 2:
	print "Bailing! The file does not contain exactly one '%Repetitions='"
	sys.exit()
ss=tmp[1]
tmp2=ss.split('\n')
numrep=int(tmp2[0])
#get variable names
tmp=s.split("%Variables=")
if len(tmp) != 2:
	print "Bailing! The file does not contain exactly one '%Variables='"
	sys.exit()
ss=tmp[1]
tmp2=ss.split('\n')
vbllst=tmp2[0].strip() #like {nnn,0:1+1,1:3+-2}
vbllst3=vbllst[1:-1]
vbles=vbllst3.split(',') #line {nnn,0:1+1,1:3+-2}
n=len(vbles)
root=vbles[0].strip()
vlst=[]
vinit=[]
vinc=[]
valt=[]
for j in range(1,n):
	vbles[j]=vbles[j].strip().replace("+",":")
	x=vbles[j].split(":")
	if len(x) != 3:
		print "Bad variable descriptor-- " + vbles[j]
		sys.exit
	vlst.append(x[0])
	nnn=0
	hasp=0
	if x[2][-1:] == ")":
		hasp=1
		nnn=int(x[2][-2])
		x[2]=x[2][:-3]
	else:
		if x[1][0] == "[":
			nnn=-100
	if x[2][-2:]=="/2":
		x[2]=x[2][:-2]
		if hasp == 1:
			nnn=-nnn
		else:
			nnn=-10
	valt.append(nnn)
	if nnn == -100:
		vinit.append(x[1][1:])
		vinc.append(x[2][:-1])
	else:
		vinit.append(x[1])
		vinc.append(x[2])
	
viniti=[]
vinci=[]
kk=len(vinit)
for j in range(kk):
	try:
		viniti.append(int(vinit[j]))
	except:
		viniti.append(0)
	try:
		vinci.append(int(vinc[j]))
	except:
		vinci.append(0)
tmp=s.split('\n')
m=len(tmp)
tmp2=[]
for j in range(2,m):
	t=tmp[j]
	if len(t) > 1:
		t=t[1:]
	else:
		t=""
	tmp2.append(t)
body='\n'.join(tmp2)
repl=[s,]
for p in range(numrep):
	newbody=body
	for k in range(kk):
		v=""
		alt=valt[k]
		if alt == -100:
			if (p % 2) == 1:
				v=vinc[k]
			else:
				v=vinit[k]
		else:
			v=viniti[k]
			if (alt < 0):
				v=v//2
				alt=-alt
			if (alt!=10) and (alt!= 0):
				v =str(v).zfill(alt)
			else:
				v=str(v)
		newbody=newbody.replace(root+vlst[k],v)
		viniti[k] =int(viniti[k]) + vinci[k]
	repl.append(newbody)

with open(filename,'w') as f:
	for j in range(len(repl)):
		f.write(repl[j]+'\n\n')

