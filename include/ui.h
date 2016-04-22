#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "Serial.h"
#include "JY901.h"
#include <qt4/QtGui/QMainWindow>
#include <qt4/QtCore/QObject>
#include <qt4/QtGui/QPushButton>
 
class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = 0);
private slots:
    void handleButton();
    void read_data();
    void process(double **, int );
private:
    QPushButton *m_button;
    SerialHandler m_serial;
    double data_buff[6][100];
    int data_number;
    bool button_clicked;
};
 
#endif // MAINWINDOW_H