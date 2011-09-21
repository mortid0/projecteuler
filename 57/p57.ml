open Printf;;
open String;;
open List;;
open Big_int;;

let next_cont_frac (a, b) = 
	let d = add_big_int a b in
	let c = add_big_int d b in
	(c, d);;

let rec build_list sup step frac = 
	if step < sup
		then let x = next_cont_frac frac in
			 x::(build_list sup (step+1) x)
		else [];;

let dig n = String.length(string_of_big_int n);;

let solve = 
	let x = build_list 1000 1 ((big_int_of_int 3), (big_int_of_int 2)) in
	filter (fun (a, b) -> (dig a) > (dig b)) x;;
	
let _ = 
	let t = solve in
(*	List.iter (fun (a, b) -> printf "%s / %s\n" (string_of_big_int a) (string_of_big_int b)) t;*)
	printf "%i\n" (List.length t);;
