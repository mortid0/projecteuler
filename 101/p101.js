var neville = function(p,x,i,j,t) {
	if (i==j) {return p[j];}
	var p_ij1 = neville(p,x,i,j-1,t);
	var p_i1j = neville(p,x,i+1,j,t);
	return (((x[j]-t)*p_ij1 + (t-x[i])*p_i1j) /(x[j]-x[i]));
}

var gen_pol = function(n){
	return 1-n*(1-n*(1-n*(1-n*(1-n*(1-n*(1-n*(1-n*(1-n*(1-n)))))))));
}

var i;
var p = [1], x = [0], y = [], sum = 1;
for (i=1; i < 10; i++){
	x.push(i);
	p.push(gen_pol(i+1));
	y.push(neville(p,x,0,i,i+1));
	sum += y[i-1]
	print(i + " -- " + p[i] +" -- " + y[i-1] + "| " +sum);
}
print("Sum is " + sum);


