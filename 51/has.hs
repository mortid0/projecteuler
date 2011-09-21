
isPrime x
|x==3=True
|otherwise=millerRabinPrimality x 2
ch='1'
numChar n= sum [1|x<-show(n),x==ch]
replace d c|c==ch=d
|otherwise=c
nextN repl n= (+0)$read $map repl $show n  
same n= [if isPrime$nextN (replace a) n then 1 else 0|a<-['1'..'9']]
problem_51=head [n|
n<-[100003,100005..999999],
	numChar n==3,
	(sum $same n)==8
	]
