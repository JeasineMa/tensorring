
#include <iostream>
//#include <stdlib.h>
#include <fstream>

using namespace std;

static double th=0.4;
ifstream fin;
ofstream fout;


void pross(double**data,int size){
	int begin[6];
	double min[6],max[6],gap[6];
	for(int i=0;i<6;i++){
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

	for(int i=0;i<12;i++){
		for(int j=bb;j<bb+30;j++)
			fout<<data[i][j]<<" ";
		fout<<endl;
	}

}

int main(){
	char filename[][7]={"data_1","data_2","data_3","data_4","data_5","data_6","data_7","data_8",};
	fout.open("data_out3");

	for(int i=0;i<8;i++){
		fin.open(filename[i]);

		for(int j=0;j<25;j++){
			int label,size;
			fin>>label>>size;
			fout<<label<<endl;
			double** data=new double*[12];
			for(int k=0;k<12;k++){
				data[k]=new double[size];
				for(int l=0;l<size;l++){
					double temp;
					fin>>data[k][l];
				}
			}
			cout<<j<<endl;
			pross(data,size);

		}
		fin.close();
	}

	
}

