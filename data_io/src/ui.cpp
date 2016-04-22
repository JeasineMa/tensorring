#include "ui.h"
#include <qt4/QtCore/QTimer>
#include <qt4/QtGui/QWidget>
#include <qt4/QtGui/QMainWindow>
#include <qt4/QtCore/QCoreApplication>
#include <qt4/QtCore/QObject>
#include <iostream>
#include <fstream>

using namespace std;
 
struct STime            stcTime;
struct SAcc             stcAcc;
struct SGyro            stcGyro;
struct SAngle           stcAngle;
struct SMag             stcMag;

struct SDStatus         stcDStatus;
struct SPress           stcPress;
struct SLonLat          stcLonLat;
struct SGPSV            stcGPSV;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;

static double th=0.4;
ifstream fin;
ofstream fout;
    
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    // Create the button, make "this" the parent
//     this->setGeometry(QRect(QPoint(400,300)));
    m_button = new QPushButton("Start", this);
    // set size and location of the button
    m_button->setGeometry(QRect(QPoint(100, 100),
    QSize(200, 50)));
    
    m_serial.init();
 
    // Connect button signal to appropriate slot
    connect(m_button, SIGNAL (released()), this, SLOT (handleButton()));
    QTimer * timer = new QTimer();
    QObject::connect(timer, SIGNAL(timeout()), this, SLOT(read_data()));
    timer->start(50);
    button_clicked = false;
    data_number = 0;
}
 
void MainWindow::handleButton()
{
    // change the text
    if(button_clicked == false)
    {
        m_button->setText("Stop");
        button_clicked = true;
    }
    else
    {
        m_button->setText("Start");
        button_clicked = false;
    }
    // resize button
// //     m_button->resize(100,100);
}

void MainWindow::process(double ** data ,int size)
{
    fout.open("normalize_data.txt");
        int begin[6];
        double min[6],max[6],gap[6];
        for(int i=0;i<6;i++)
        {
                cout<<i<<endl;
                int j;
                for(j=0;j<30;j++){
                        if(j==0){
                                max[i]=min[i]=data[i][j];
                                cout<<max[i]<<endl<<min[i]<<endl;
                        }
                        else{
                                if(max[i]<data[i][j])
                                        max[i]=data[i][j];
                                if(min[i]>data[i][j])
                                        min[i]=data[i][j];
                        }
                }
                gap[i]=max[i]-min[i];
        }
        cout<<"r0"<<endl;
        for(int i=0;i<6;i++){
                for(int j=0;j<30;j++){
                        if(j==0){
                                max[i]=min[i]=data[i][j];
                        }
                        else{
                                if(max[i]<data[i][j])
                                        max[i]=data[i][j];
                                if(min[i]>data[i][j])
                                        min[i]=data[i][j];
                        }
                        if(max[i]-min[i]>th*gap[i]){
                                begin[i]=j-1;
                                break;
                        }
                }
        }
        cout<<"r1"<<endl;
        int bb=0;
        for(;bb<size;bb++){
                int count=0;
                for(int i=0;i<6;i++){
                        if(bb>=begin[i])
                                count++;
                }
                if(count>1)
                        break;
        }

        for(int i=0;i<6;i++){
                for(int j=bb;j<bb+30;j++)
                        fout<<data[i][j]<<" ";
                fout<<endl;
        }
        fout.close();
}


void MainWindow::read_data()
{
    if(button_clicked == true)
    {
        //cout << "start writing data" << endl;
         m_serial.Read();
        if(m_serial.isReadOK)
        {
            
            for(int i = 0; i < 55; i++)
            {
                CopeSerialData(m_serial.readbuff[i]);
            }
            
            data_buff[0][data_number] = (float)stcAcc.a[0]/32768*16;
            data_buff[1][data_number] = (float)stcAcc.a[1]/32768*16;
            data_buff[2][data_number] = (float)stcAcc.a[2]/32768*16;
            data_buff[3][data_number] = (float)stcGyro.w[0]/32768*2000;
            data_buff[4][data_number] = (float)stcGyro.w[1]/32768*2000;
            data_buff[5][data_number] = (float)stcGyro.w[2]/32768*2000;
            
            data_number++;
            
            
        
            
            //printf the time of data
            //printf("Time:20%d-%d-%d %d:%d:%.3f\r\n", stcTime.ucYear,stcTime.ucMonth, stcTime.ucDay, 
    //                      stcTime.ucHour, stcTime.ucMinute, (float)stcTime.ucSecond + (float)stcTime.usMiliSecond/1000);
            //printf the acc value of the package
    //         printf("Acc:%.3f %.3f %.3f\r\n", (float)stcAcc.a[0]/32768*16, (float)stcAcc.a[1]/32768*16,
    //             (float)stcAcc.a[2]/32768*16);
    //         
    //     //printf the gyro data
    //         printf("Gyro:%.3f %.3f %.3f\r\n", (float)stcGyro.w[0]/32768*2000,  (float)stcGyro.w[1]/32768*2000, 
    //             (float)stcGyro.w[2]/32768*2000);
    //         
    //         //printf the angle of the data
    //         printf("Angle:%.3f %.3f %.3f\r\n", (float)stcAngle.Angle[0]/32768*180,(float)stcAngle.Angle[1]/32768*180
    //             ,(float)stcAngle.Angle[2]/32768*180);
    //         
    //         //
    //         printf("Mag:%d %d %d\r\n",stcMag.h[0],stcMag.h[1],stcMag.h[2]);
    //         
    //         //
    //         printf("Pressure:%ld Height%.2f\r\n",stcPress.lPressure,(float)stcPress.lAltitude/100);
    //         
    //         //
    //         printf("%d %d %d %d\r\n", stcDStatus.sDStatus[0], stcDStatus.sDStatus[1], stcDStatus.sDStatus[2], 
    //         stcDStatus.sDStatus[3]);
    //         
    //         printf("Longitude:%ldDeg%.5fm Lattitude:%ldDeg%.5fm\r\n", stcLonLat.lLon/10000000, 
    //             (double)(stcLonLat.lLon % 10000000)/1e5, stcLonLat.lLat/10000000, 
    //             (double)(stcLonLat.lLat % 10000000)/1e5
    //         );
        }
    }
    else
    {   
        if(data_number > 0)
        {
               cout << "start writing data" << endl;
//                 int array_size = 30;
//                 int index_increment = data_number / array_size;
            double  ** new_dataset = new double*[6];
            for(int i = 0; i < 6; i++)
            {
                double * new_data_array = new double[data_number];
                new_dataset[i] = new_data_array;
            }
            for(int i = 0; i < data_number; i++)
            {
                new_dataset[0][i] = data_buff[0][i];
                new_dataset[1][i] = data_buff[1][i];
                new_dataset[2][i] = data_buff[2][i];
                new_dataset[3][i] = data_buff[3][i];
                new_dataset[4][i] = data_buff[4][i];
                new_dataset[5][i] = data_buff[5][i];                               
            }
            process(new_dataset, data_number);
            data_number = 0;
        }
    }
}