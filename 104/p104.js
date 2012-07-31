var fib_n1 = new Array(1000000);
var fib_n2 = new Array(1000000);
var t;
for (t = 0; t < 1000000; t++){
	fib_n1[t] = 0;
	fib_n2[t] = 0;
}
fib_n1[999999] = 1;
fib_n2[999999] = 1;

var sum_fib2 = function(a,b,l){
	var i = a.length-1, curr_a, curr_b, rem = 0, curr_c = 0;
	while(i >= l){
		curr_b = b[i];
		curr_a = a[i];
		curr_c = (curr_a+curr_b+rem)%10;
		a[i] = curr_c;
		rem = (curr_a+curr_b+rem - curr_c)/10;
		i--;
	}
	if (rem > 0) { a[i] = rem; i--;}
//	print("Len is " + (i+1));
	return (i+1);
}

var check_pandig = function(a,n){
	if (a.length < 9) {return false;}
	var fst = [a[n+1],a[n+2],a[n+3],a[n+4],a[n+5], a[n+6],a[n+7],a[n+8],a[n+9]];
	var l = a.length
	var snd = [a[l-1],a[l-2],a[l-3],a[l-4],a[l-5],a[l-6],a[l-7],a[l-8],a[l-9]];
//	print("k is " + n + "; " + fst + " | " + snd);
	var k, res = true;
	for (k = 1; k < 10; k++){
		res &= ((snd.indexOf(k)>-1) && (fst.indexOf(k) > -1));
	}
	return res;
}

var i = 0, last = -1, l = 999999, k;
print("Started");
//329470
while (i < 329470) {
	if (i%1000 == 0) {print(i + " length is " + (1000000-l));}
	l = sum_fib2(fib_n1, fib_n2,l);
	k = Math.min(l, fib_n1.length-10); //	print(fib_n1[-1] + " " + fib_n2[-1]);
	if (check_pandig(fib_n1,k)) {print((i+3) + " Found"); break;}
	i++;
	l = sum_fib2(fib_n2, fib_n1,l);
	k = Math.min(l, fib_n2.length-10); //	print(fib_n1 + " | " + fib_n2 + " | " + t);
	if (check_pandig(fib_n2,k)) {print((i+3) + " Found"); break;}
	i++;

}
print(i+3);
