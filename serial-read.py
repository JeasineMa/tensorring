import serial
import struct

ser=serial.Serial("/dev/ttyUSB0",9600)
print 'done'

if ser.isOpen()==False:
	print ('open error')
	exit()

UserGyrResolution=float(0.007633587786)
MPU9250A_4g=float(0.000122070312)
Gravity_g=10

Accscalar = MPU9250A_4g * Gravity_g
Gyrscalar = UserGyrResolution / 57.3

write=[255,170,2,81,0]
send=[]
for i in range(0,4):
	send.append(struct.pack('B',write[i]))
for i in range(0,4):
	ser.write(send[i])

while(True):
	data=ser.read(11)
	if struct.unpack('B',data[0])[0]!=85:
		continue
	if struct.unpack('B',data[1])[0]!=81:
		continue
	realdata=[]
	print 'acc'
	for i in range(0,3):
		temp=struct.unpack('h',data[2+i*2:4+i*2])
		realdata.append(Accscalar*temp[0])
	print realdata[0:3]
		



