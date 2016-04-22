def datainput():
	myfile=open("data_out",'r')
	label=[]
	data=[]
	for i in range(0,200):
		line=myfile.readline()
		label.append(int(line))
		for j in range(0,12):
			result=[]
			line=myfile.readline()
			temp=map(float,line.split(' ')[0:50])
			result.append(temp)

			for num in result:
				data.append(num)
	return label,data


label,data=datainput()
print data
