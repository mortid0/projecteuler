#include <stdio.h>
 
int apower(int a, int n, int mod){
   long long power=a;
   long long result=1;
 
   while(n){
      if(n%2) result=(result*power)%mod;
      power=(power*power)%mod;
      n/=2;
      }
   return (int)result;
   }
 
int witness(int a, int n){
   int t,u;
   long long prev,curr;
   int i;
   long long lln=(long long) n;
 
   u=n/2;
   t=1;
   while(u%2==0){
      u/=2;
      t++;
      }
   prev=(long long)apower(a,u,n);
   for(i=1;i<=t;i++){
      curr=(prev*prev)%lln;
      if((curr==1ll)&&(prev!=1ll)&&(prev!=lln-1ll)) return 1;
      prev=curr;
      }
   if(curr!=1ll) return 1;
   return 0;
   }
 
int is_prime(int n){
 
   if(witness(2,n)) return 0;
   if(witness(7,n)) return 0;
   if(witness(61,n)) return 0;
   return 1;
   }
 
int main(){
   int side;
   int numbers;
   int primes;
   int percentage;
 
   primes=0;
   numbers=1;
   percentage=100;
   for(side=3;percentage>=10;side+=2){
      numbers+=4;
      if(is_prime(side*side)) primes++;
      if(is_prime(side*side-side+1)) primes++; 
      if(is_prime(side*side-2*side+2)) primes++; 
      if(is_prime(side*side-3*side+3)) primes++;
      percentage=(100*primes)/numbers;
      /* printf("%d %d\n",side,percentage);*/
      }
   printf("%d\n",side-2);
   return 0;
   }
