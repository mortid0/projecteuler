open Printf;;
open Big_int;;
open List;;

let rec find_odd_prime curr sup p = 
	if (le_big_int curr sup)
		then if (eq_big_int zero_big_int (mod_big_int p curr) )
			then 0
			else find_odd_prime (add_int_big_int 2 curr) sup p
		else 1;;

let is_odd_prime p = find_odd_prime (big_int_of_int 3) (sqrt_big_int p) p;;

let diagonals n = 
	let big_n =	big_int_of_int n in
	let a = square_big_int big_n in
	let b = add_int_big_int 1 (sub_big_int a big_n) in
	let c = add_int_big_int 1 (sub_big_int b big_n) in
	let d = add_int_big_int 1 (sub_big_int c big_n) in
	let pb = is_odd_prime b in
	let pc = is_odd_prime c in
	let pd = is_odd_prime d in
	(pb + pc + pd);;

let rec solve n primes total = 
	let curr_primes = diagonals n in
	let new_primes = primes + curr_primes in
	let new_total = total + 4 in
	if (0.1 > (float new_primes)/.(float new_total))
		then n
		else (* List.iter (fun x -> printf "%s " (string_of_big_int x)) diag;
			printf "primes %i total %i\n" new_primes new_total;
			solve (n+2) new_primes new_total;);;*)
			solve (n+2) new_primes new_total;;

let _ = printf "%i\n" (solve 3 0 1);;
