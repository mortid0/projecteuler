open Num

let isqrt x = truncate (sqrt (float_of_int x))

let rec isPrime n curr n_isqrt = 
	if n mod curr == 0
		then false
		else (
			if curr > n_isqrt
				then (true)
				else isPrime n (curr+2) n_isqrt
		)

let rec primes n curr ls = 
	if curr > n
		then ls
		else (
			if (isPrime curr 3 (isqrt(curr)))
				then primes n (curr+2) (curr::ls)
				else primes n (curr+2) ls
		)

let rec find_b c x r =
	let b = x*(r+1)-c in
	if (b mod 3 == 0)
		then b/3
		else find_b c x (r+1)

let rec find_a b x r =
	let a = x*(r+1)-b in
	if (a mod 4 == 0)
		then a/4
		else find_a b x (r+1)

let rec solve t total = match t with
	|p::xs ->
			let e = p-1 in
			let d = 1 in
			let c = e / 2 in
			let b = find_b c p 0 in
			let a = find_a b p 0 in
			let res = (a+b+c+d+e) mod p in
(*			Printf.printf "p %i (%i %i %i %i %i) %i \n" p a b c d e res;*)
			solve xs (total +/ (num_of_int res))
	|_ -> total

let _ = 
	let my_primes = (primes 100000000 3 []) in
	Printf.printf "fin";
	let ans = solve my_primes (num_of_int 0) in
	Printf.printf "%s\n" (string_of_num ans);;

