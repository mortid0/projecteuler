#include<iostream>
#include<gmpxx.h>

#define bigint mpz_class
#define limit 100000

#define base 10

char ok[limit]={0};
int prevcarry[limit];
char prevdigit[limit];

int cl[limit],clcount,clfrom,clto;    // carry list to process
int cl1[limit];
char cl0[limit];                      // div/mod cache of cl[]

void ok_fill(int x) {
	if(x>=limit)return;
	ok[x]=1;
	x*=10;
	for(int i=0;i<3;i++,x++)if(x)ok_fill(x);
}

bigint f(int n){
	int digit,c,mod,i,carry,cnew,modnew,n0,n1,carry1,carry0;
	char zero=1;
	for(i=0;i<limit;i++)prevdigit[i]=-1;

	cl[0]=0;clto=0;clcount=1;

	n1=n/base;
	n0=n-n1*base;

	while(1) { 
		clfrom=clto;
		clto=clcount;

		for(i=clfrom;i<clto;i++){
			cl1[i]=cl[i]/base;
			cl0[i]=cl[i]-cl1[i]*base;
		}

		mod=0;c=0;
		for(digit=0;digit<base;digit++,c+=n1,mod+=n0){
			if(zero){zero=0;continue;}

			if(mod>=base){mod-=base;c++;}
			cnew=c;

			for(i=clfrom;i<clto;i++){
				carry=cl[i];

				carry1=cl1[i];//carry/base;
				carry0=cl0[i];//carry-base*carry1;
				cnew=c+carry1;
				modnew=mod+carry0;
				if(modnew>=base){modnew-=base;cnew++;}

				if(!ok[modnew])continue;

				if(prevdigit[cnew]==-1){
					prevdigit[cnew]=digit;
					prevcarry[cnew]=carry; 
					cl[clcount++]=cnew;
				}

				if(ok[cnew]){
					bigint sol=0;
					while(1){
						sol*=base;
						sol+=prevdigit[cnew];
						if(!(cnew=prevcarry[cnew])) break;
					}
					return sol;
				}
			}
		}
	}
}

int main() {
	bigint sum=0;
	ok_fill(0);
	for(int n=1;n<=limit;n++)sum+=f(n);
	std::cout<<sum<<"\n";
}
