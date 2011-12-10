open Num

let good_area_one a = 
	let aa = float_of_int a in
	let s1 = (1.5 *. aa +. 1.0) *. ( aa /.2.0 +. 1.0) in
	let s2 = floor (sqrt s1) in
	s1 -. s2 *. s2 = 0.0

let good_area_two a = 
	let aa = float_of_int a in
	let s1 = (1.5 *. aa  -. 1.0) *. ( aa /.2.0 -. 1.0) in
	let s2 = floor (sqrt s1) in
	s1 -. s2 *. s2 = 0.0

let _ = 
	let n = ref (num_of_int 0) in
	let i = ref 4 in
	while !i < 333333336 do
		if (good_area_one !i)
			then (
				let p = (num_of_int 3)*/(num_of_int !i) +/ (num_of_int 2) in
				Printf.printf "%i %i %i\n" !i (!i+1) (!i+1);
				if (p < (num_of_int 1000000000))
					then n:=!n +/ p;
			);
		if (good_area_two !i)
			then (
				let p = (num_of_int 3)*/(num_of_int !i) -/ (num_of_int 2) in
				Printf.printf "%i %i %i\n" !i (!i-1) (!i-1);
				if (p < (num_of_int 1000000000))
					then n:=!n +/ p;
			);
		i := !i + 2;
	done;
	Printf.printf "%s\n" (string_of_num !n);;
