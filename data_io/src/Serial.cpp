#include "Serial.h"
#define PI 3.1415926
SerialHandler::SerialHandler()
{
  portsign =-1;
  configStatu =-1;
  readByte = 0;
  readLen = 0;
  isReadOK = 0;
  Write_Priority = 0;
  DEV = "/dev/ttyUSB0";

  //needclean = false;
}
SerialHandler::~SerialHandler()
{
  Serial_Close();
}

void SerialHandler::init()
{
  if ( portsign < 0 )
    {
      portsign = open ( DEV,O_RDWR | O_NOCTTY | O_NDELAY );
      // printf("portsign: %d\n", portsign);
      if ( -1 ==portsign )
        {
//           cout<<"Open Port Fail"<<endl;
        }
      else
        {
          configStatu = ConfigPort ( portsign );
          if ( configStatu<0 ) cout<<"Config Port Error!"<<endl;
          struct termios Opt;
          tcgetattr ( portsign,&Opt );
          speed = cfgetospeed ( &Opt );
        }
      unsigned char buff[1000];
      int cnt;
      cnt = read ( portsign,buff,1000 );
      for ( int i=0; i<cnt; i++ )
        cout<< ( int ) buff[i]<<" ";
//       cout<<"init read"<<endl;
    }
}

void SerialHandler::Read()
{
//    printf("queue size: %4d, ",fifo.size());
  if ( Write_Priority!=0 )
    {
//       printf ( "writing now.\n" );
      return;
    }
//   if ( FD_ISSET ( portsign,&wd ) )
//     {
//       printf ( "write descriptor is set.\n" );
//       return;
//     }

  // FD_ZERO(&rd);
  FD_SET ( portsign,&rd );
  // if (FD_ISSET(portsign, &rd));
  // {
  //   printf("ready.\n");
  // }
  struct  timeval tv;
  tv.tv_sec = 0;
  tv.tv_usec = 1000;
    unsigned int package_size = 55;
    
  int temp = select ( portsign+1, &rd, NULL, NULL, &tv );
  
  if ( /*select(portsign+1,&rd,NULL,NULL,NULL)*/temp <= 0 )
    {
      // cout<<"Cannot select port!"<<endl;
      readLen = 0;
      // error or timeout. do nothing
    }
  else
    {
      // printf("read\n");
      
      unsigned char buff[package_size];
      readByte=read ( portsign,buff,package_size );
      if ( readByte<=0 )
        {
//           printf ( "no data.\n" );
          return;
        }
      // readbuff[readByte]=0;

      for ( int i=0; i<readByte; i++ )
        {
          fifo.push ( buff[i] );
        }
//         std::cout <<"pkg size:" << fifo.size() << std::endl;
      if ( fifo.size() > package_size )
        {
//           cout<<fifo.size() <<" queue size is greater than pkg size, check loop rate"<<endl;
        }

      // put data into readbuff
      if ( fifo.size() < package_size )
        {
          isReadOK = 0;
          //needclean = true;
          int ti= package_size;
//           printf ( "%d < %d bytes in FIFO.\n",fifo.size(),ti );
        }
      else
        {
          uint8_t tsta = 0;
          queue<uint8_t> tmpfifo = fifo;
          uint8_t tcnt = 1;
          bool outflag = false;
          while ( !tmpfifo.empty() )
            {
              uint8_t ct = tmpfifo.front();
              tmpfifo.pop();
              switch ( tsta )
                {
                case 0://check header
                  if ( ct == 0x55 )
                  {
                      tsta = 1;
                
                  }
                  if(tmpfifo.size() >= package_size - 2)
                  {
                    readbuff[0] = 0x55;
                  }
                  else
                  {
                      return;
                  }
                  break;                
                case 1://read data
                  // enough data in fifo
                  readbuff[tcnt]=ct;
                  tcnt++;
                  if ( tcnt>=package_size )
                    {
                        //read finished
                      isReadOK = 1;

                      if ( tmpfifo.size() <package_size )
                        {
                          fifo = tmpfifo;
                          outflag = true;   //whole package. and no more package in FIFO
                        }
                      else
                        {
                          //get data again. another package remained
                          tcnt = 1;
                          tsta = 0;
                          outflag = false;
                        }
                    }
                  break;
                default:
//                   cerr<<"impossible!"<<endl;
                  break;
                }
              if ( outflag )
                break;
            }
        }
    }
  FD_ZERO ( &rd );
}

void SerialHandler::Serial_Close()
{
  close ( portsign );
  portsign = -1;
}

int SerialHandler::ConfigPort ( int fd )
{
  int status;
  struct termios opt;
  tcgetattr ( fd,&opt );
  tcflush ( fd,TCIOFLUSH );
  cfsetispeed ( &opt,B115200 );
  cfsetospeed ( &opt,B115200 );
  opt.c_cflag &= ~CSIZE;
  opt.c_cflag |= CS8; //8位数据位
  opt.c_cflag &= ~PARENB;//无校验位
  opt.c_cflag &= ~CSTOPB;// 停止位
  opt.c_cc[VTIME] = 0; // 0.5 seconds
  opt.c_cc[VMIN] = 1;

  opt.c_cflag |= ( CLOCAL | CREAD );

  opt.c_cflag &= ~HUPCL;
  opt.c_iflag &= ~INPCK;
  opt.c_iflag |= IGNBRK;
  opt.c_iflag &= ~ICRNL;
  opt.c_lflag &= ~IEXTEN;
  opt.c_lflag &= ~ECHOK;
  opt.c_lflag &= ~ECHOCTL;
  opt.c_lflag &= ~ECHOKE;
//    opt.c_cflag &= ~(IXON|IXOFF|IXANY);
//    opt.c_iflag &= ~(BRKINT|ICRNL|INPCK|ISTRIP|IXON);
  opt.c_iflag &= ~ ( IXON |IXOFF|IXANY );
  opt.c_lflag &= ~ ( ICANON|ECHO|ECHOE|ISIG ); //原始输入模式
  opt.c_iflag &= ~ ( INLCR|IGNCR|ICRNL );
  opt.c_oflag &= ~ ( ONLCR|OCRNL ); //屏蔽回车和换行
//   opt.c_oflag &= ~OPOST;//原始输出模式
  status = tcsetattr ( fd,TCSANOW,&opt );
  if ( status !=0 )
    {
//       perror ( "tcsetattr fd error!" );
      return -1;
    }
  tcflush ( fd ,TCIOFLUSH );
  return 0;
}


void SerialHandler::writeCmd ( int16_t PH,int16_t ZX,int16_t CS )
{
  ch[0] = 0x55;
  ch[1] = 0xAA;
  ch[2] = ( PH>>8 ) &0xFF;
  ch[3] = PH&0xFF;
  ch[4] = ( ZX>>8 ) &0xFF;
  ch[5] = ZX&0xFF;
  ch[6] = ( CS>>8 ) &0xFF;
  ch[7] = CS&0xFF;

  Write_Priority = 1;
  int flag = write ( portsign, ch, 8 );
  Write_Priority = 0;

  //printf("Send cmd. %d\n", msg->data);
}








