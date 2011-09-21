open Printf;;
open Big_int;;

let is_square num = 
	let a = sqrt_big_int num in
	let b = square_big_int a in
	if (eq_big_int num b)
		then true
		else false;;

let rec get_sol x d = 
	let pre_y = pred_big_int (square_big_int x) in
	let qr = quomod_big_int pre_y (big_int_of_int d) in
	if (not(eq_big_int (snd qr) zero_big_int))
		then (get_sol (succ_big_int x) d)
		else (
			let tmp = fst qr in
			if (is_square tmp)
				then x
				else (get_sol (succ_big_int x) d)
			);;
	
let find_min_sol d = get_sol (big_int_of_int 2) d;;

let _ =
	let max_d = ref 0 in
	let max_x = ref zero_big_int in
(*	printf "%s\n" (string_of_big_int (find_min_sol 3));*)
	for d = 61 to 62 do
		if (not (is_square (big_int_of_int d)))
			then (
				let x = find_min_sol d in
				printf "%i %s\n" d (string_of_big_int x);
				if (gt_big_int x !max_x) 
					then (max_x := x; max_d := d;);
				);
	done;
	printf "Max %i %s\n" !max_d (string_of_big_int !max_x);;
