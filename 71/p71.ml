open Printf;;

let find_enum denum = int_of_float ((float denum) *. 3.0 /. 7.0);;

let good_enough enum denum old_enum old_denum = 
	if (3 * denum - 7 * enum > 0) && (enum * old_denum - old_enum * denum > 0) 
		then true
		else false;;

let rec solve71 curr_denum best_enum best_denum end_denum = 
	if curr_denum == end_denum 
		then (best_enum, best_denum)
		else let curr_enum = find_enum curr_denum in
			let next_iter = curr_denum + 1 in
			if (good_enough curr_enum curr_denum best_enum best_denum)
				then solve71 next_iter curr_enum curr_denum end_denum
				else solve71 next_iter best_enum best_denum end_denum;;

let p71 max = solve71 9 2 5 max;;

let _ = 
	let answ = p71 1000000 in
	printf "%i %i\n" (fst answ) (snd answ);;


