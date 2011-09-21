open Printf

let isqrt n = (int_of_float (sqrt(float_of_int n))) + 1

let rec check_prime n curr last = match curr with
	2 -> if n mod curr = 0 
			then false 
			else check_prime n 3 last
	| x -> if (x > last)
			then true
			else if n mod x = 0
					then false
					else check_prime n (x+2) last

let is_prime n = check_prime n 2 (isqrt n)

let rec try_next_number_for_prime n curr_num = 
	if curr_num > n
		then []
		else if (is_prime curr_num)
				then curr_num::(try_next_number_for_prime n (curr_num + 2))
				else try_next_number_for_prime n (curr_num + 2)

let get_primes_up_to n = 2::3::(try_next_number_for_prime n 5)

let is_concat_primes a b = 
	let sa = string_of_int a in
	let sb = string_of_int b in
	let c = int_of_string(String.concat "" [sa;sb]) in
	let d = int_of_string(String.concat "" [sb;sa]) in
	(is_prime c)&&(is_prime d)

let solve_60 primes = 
	let n = Array.length primes in
	for i = 0 to n-5 do
		let a = primes.(i) in
		for j = (i+1) to (n-4) do
			let b = primes.(j) in
			if (is_concat_primes a b)
				then (for k = (j+1) to (n-3) do
						let c = primes.(k) in
						if (is_concat_primes a c) && (is_concat_primes b c)
							then (
								for l = (k+1) to (n-2) do
									let d = primes.(l) in
									if (is_concat_primes a d) && (is_concat_primes b d) && (is_concat_primes c d)
										then (
											for m = (l+1) to (n-1) do
												let e = primes.(m) in
												if (is_concat_primes a e) && (is_concat_primes b e) && (is_concat_primes c e) &&(is_concat_primes d e)
													then printf "%i %i %i %i %i %i\n" a b c d e (a+b+c+d+e)
											done;
										);
								done;
							);
					  done;
				);
		done;
	done;;


let _ = 
	let primes_list = get_primes_up_to 10000 in
	let primes_array = Array.of_list primes_list in
	solve_60 primes_array;;
	
