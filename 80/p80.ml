open Num;;

let isqrt n = num_of_int (int_of_float (sqrt (float_of_int n)))

let iter_ratio_sqrt x s = (x +/ s // x) // (num_of_int 2)

let ratio_sqrt n = 
	let x = ref (isqrt n) in
	let s = num_of_int n in
	if (s -/ !x */ !x >/ (num_of_int 0))
		then (
			for i = 1 to 9 do
				x := iter_ratio_sqrt !x s;
			done;)
		else (x := (num_of_int 1););
	!x;;

let sum_100_digits n = 
	let str = approx_num_fix 105 (ratio_sqrt n) in
	let s = ref ((int_of_char (str.[1])) - (int_of_char '0'))  in
	for i = 3 to 101  do
		let c = (int_of_char (str.[i])) - (int_of_char '0') in
		s := !s + c;
	done;
	!s;;


let _ = 
	let s = ref 0 in
	for i=1 to 100 do
		s:= !s + (sum_100_digits i);
	done;
	Printf.printf "%i\n" (!s - 10);;

