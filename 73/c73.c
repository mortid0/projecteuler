#include <stdio.h>
#include <math.h>

int main() {
	int n, x0, y0, x1, y1, s, xx, yy, x2, y2;
	double b, ll, bl, d, ul;
	n = 12000; 
	/* you need two fractions to start with!!! */ 
	x0 = 3333; y0 = n; 
	x1 = 1; y1 = 3; 
	/* lower limit and upper limit */
	ll = 1.0/3.0; 
	ul = 1.0/2.0; 
	b = 0.0; 
	s = 0; 
	while (b <= ul){ 
		d = floor((y0+n)/y1); 
		xx = d*x1 - x0; 
		yy = d*y1 - y0; 
		if (xx <= yy){ 
			x2 = xx; 
			y2 = yy; 
			/* if within the interval add 1 to s */ 
			b = (double) x2 / (double) y2; 
			if ((b > ll) && (b < ul)) s++; 
			/* done? */ 
			if (b > ul) break; 
			/* update */ 
			x0 = x1; y0 = y1; 
			x1 = x2; y1 = y2; 
		} 
	}
	printf ("%i\n", s);
	return 0; 
}
