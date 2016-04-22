
#include <iostream>
//#include <stdlib.h>
#include <fstream>
#include <math.h>

using namespace std;

int main(){

	ifstream fin;
	fin.open("Data_8");
	ofstream fout;
	fout.open("data_8");

	double **matrix=new double*[12];
	for(int i=0;i<12;i++)
		matrix[i]=new double[10000];

	int label;
	int cnt=0;
	bool end=0;
	fin>>label;
	label=label/10000;
	while(!fin.fail()){
		double temp;
		for(int i=0;i<12;i++){
			fin>>temp;
			if(temp>5000){
				end=1;
				break;
			}
			matrix[i][cnt]=temp;
		}
		cnt++;
		if(end==1){
		fout<<label<<" "<<cnt<<endl;
		for(int p=0;p<12;p++){
			double max=0;
			for(int q=0;q<cnt;q++){
				if(fabs(matrix[p][q])>max){
					max=fabs(matrix[p][q]);
				}
			}
			for(int q=0;q<cnt;q++){
				matrix[p][q]/=max;
			}
			double mean=0;
			for(int q=0;q<cnt;q++){
				mean+=matrix[p][q];
			}
			mean=mean/cnt;
			for(int q=0;q<cnt;q++){
				matrix[p][q]=matrix[p][q]-mean;
				fout<<matrix[p][q]<<" ";
			}
			fout<<endl;
		}
		cnt=0;
		end=0;
		label=temp/10000;
	}
	}
fout<<label<<" "<<cnt<<endl;
		for(int p=0;p<12;p++){
			double max=0;
			for(int q=0;q<cnt;q++){
				if(fabs(matrix[p][q])>max){
					max=fabs(matrix[p][q]);
				}
			}
			for(int q=0;q<cnt;q++){
				matrix[p][q]/=max;
			}
			double mean=0;
			for(int q=0;q<cnt;q++){
				mean+=matrix[p][q];
			}
			mean=mean/cnt;
			for(int q=0;q<cnt;q++){
				matrix[p][q]=matrix[p][q]-mean;
				fout<<matrix[p][q]<<" ";
			}
			fout<<endl;
		}


}
