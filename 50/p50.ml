open Printf
open List
open Big_int

let rec range x = 
match x with
|[a,b,c] -> if (a <= b) then a::(range [(a+c),b,c]) else []
|_ -> [];;

let isqrt x = truncate (sqrt (float_of_int x));;

let isPrime n = not (exists (fun a -> n mod a = 0) (2::(range [3,(isqrt n),2])));;

let prime_list = 2::(filter (fun x-> isPrime x) (range[3,1000000,2]));;

let rec print_list x = match x with
l::ls -> (printf "%i\n" l; print_list ls;)
|_ -> printf ";\n";;

print_list prime_list;;

let get_max_count_prime xs = fold_left 
	(fun (old_prime, old_max, old_sum, old_cur) x -> 
		let sum = (add_int_big_int x old_sum) in 
		let cur = (old_cur + 1) in 
		if (le_big_int sum (big_int_of_int 1000000)) 
			then let int_sum = int_of_big_int sum in 
			if (isPrime int_sum) 
				then (int_sum, cur, sum, cur) 
				else (old_prime, old_max, sum, cur)
			else (old_prime, old_max, sum, cur))
	(0, 0, zero_big_int, 0) xs;;

let quad_fst (x, _, _, _) = x;;
let quad_snd (_, x, _, _) = x;;

let pp = get_max_count_prime prime_list;;
printf "%i %i\n" (quad_fst pp) (quad_snd pp);;

let rec walk_through_pl a = match a with
(x::xs, m_count, m_prime)->	if (x > 10000) then (m_count, m_prime) else
				let iter = (get_max_count_prime (x::xs)) in
				let new_count = (quad_snd iter) in
				let new_prime = (quad_fst iter) in
				if (new_count > m_count) then (walk_through_pl (xs, new_count, new_prime)) else (walk_through_pl (xs, m_count, m_prime))
|([], m_count, m_prime) -> (m_count, m_prime);;

let a = walk_through_pl (prime_list, 0, 0);;

printf "%i %i\n" (fst a) (snd a);;


