#include <iostream>
#include <stdio.h>
#include <string.h>

#include "ui.h"
#include <qt4/QtGui/QApplication>
#include <qt4/QtGui/QMainWindow>

void CopeSerialData(unsigned char ucData)
{
        static unsigned char ucRxBuffer[250];
        static unsigned char ucRxCnt = 0;       
     
        ucRxBuffer[ucRxCnt++]=ucData;
        if (ucRxBuffer[0]!=0x55) //
        {
                ucRxCnt=0;
                return;
        }
        if (ucRxCnt < 11) {return;}//
        else
        {
                switch(ucRxBuffer[1])
                {
                        case 0x50:      memcpy(&stcTime,&ucRxBuffer[2],8);break;//memcpy
                        case 0x51:      memcpy(&stcAcc,&ucRxBuffer[2],8);break;
                        case 0x52:      memcpy(&stcGyro,&ucRxBuffer[2],8);break;
                        case 0x53:      memcpy(&stcAngle,&ucRxBuffer[2],8);break;
                        case 0x54:      memcpy(&stcMag,&ucRxBuffer[2],8);break;
                        case 0x55:      memcpy(&stcDStatus,&ucRxBuffer[2],8);break;
                        case 0x56:      memcpy(&stcPress,&ucRxBuffer[2],8);break;
                        case 0x57:      memcpy(&stcLonLat,&ucRxBuffer[2],8);break;
                        case 0x58:      memcpy(&stcGPSV,&ucRxBuffer[2],8);break;
                }
                ucRxCnt=0;
        }
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
 
    MainWindow mainWindow;
    mainWindow.showMaximized();
    return app.exec();
}

