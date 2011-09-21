#include <stdio.h>
#include <stdlib.h>
 
typedef unsigned long u_long;
typedef unsigned int  u_int;
 
u_long choose(u_long n, u_long k, int *err)
{
  u_long imax, ans, i, imin;
 
  if ( err != NULL ) *err = 0;
  if ( (n<0) || (k<0) ) {
    fprintf(stderr, "negative in choose\n");
    if ( err != NULL ) *err = 1;
    return 0;
  }
  if ( n < k ) return 0;
  if ( n == k ) return 1;
  imax = ( k > (n-k) ) ? k : n-k;
  imin = ( k > (n-k) ) ? n-k : k;
  ans = 1;
  for(i=imax+1; i <= n; i++ ) ans *= i;
  for(i=2; i <= imin; i++ ) ans /= i;
  return ans;
}
 
u_int **comb(u_int n, u_int k)
{
  u_int **r, i, j, s, ix, kx;
  int err;
  u_long hm, t;
 
  hm = choose(n, k, &err);
  if ( err != 0 ) return NULL;
  r = malloc(hm*sizeof(u_int *));
  if ( r == NULL ) return NULL;
  for(i=0; i < hm; i++) {
    r[i] = malloc(sizeof(u_int)*k);
    if ( r[i] == NULL ) {
      for(j=0; j < i; j++) free(r[i]);
      free(r);
      return NULL;
    }
  }
  for(i=0; i < hm; i++)
  {
    ix = i; kx = k;
    for(s=0; s < n; s++) {
      if ( kx == 0 ) break;
      t = choose(n-(s+1), kx-1, NULL);
      if ( ix < t ) {
	r[i][kx-1] = s;
	kx--;
      } else {
	ix -= t;
      }
    }
  }
  return r;
}
 
 
int main()
{
  u_int **r;
  int i, j;
 
  r = comb(5, 3);
  printf("r = %li\n", choose(5, 4, NULL));
  for(i=0; i < choose(5, 3, NULL); i++) {
    for(j=2; j >= 0; j--) {
      printf("%d ", r[i][j]);
    }
    free(r[i]);
    printf("\n");
  }
  free(r);
  return 0;
}
