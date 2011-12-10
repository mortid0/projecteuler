open Num

let isqrt n = 
	let fn = float_of_num n in
	let sn = sqrt fn in
	let int_s = int_of_float sn in
	(num_of_int int_s)

let iter_cont_frac n int_n a b =
	let integer_part = quo_num (int_n +/ a) b in
	let fractional_part = a -/ integer_part */ b in
	let c = n -/ fractional_part */ fractional_part in
	let new_b = quo_num c b in
	let new_a = minus_num fractional_part in
	(integer_part, new_a, new_b)

let rec conv_cont_frac iter n int_n (hn1,hn2) (kn1, kn2) (d, e) = match iter with
	0 -> let (fst_a, fst_b, fst_c) = iter_cont_frac n int_n (num_of_int 0) (num_of_int 1) in
		let (et_a, et_b, et_c) = iter_cont_frac n int_n fst_b fst_c in
		if (fst_a */ fst_a -/ n =/ (num_of_int 1))
			then fst_a
			else (
				let h = fst_a */ et_a +/ (num_of_int 1) in
				let k = et_a in
				if (h*/h -/ n */ k */ k =/ (num_of_int 1))
					then h
					else conv_cont_frac 1 n int_n (h, fst_a) (k, (num_of_int 1)) (et_b, et_c) );
	|p -> let (x,y,z) = iter_cont_frac n int_n d e in
		let h = x */ hn1 +/ hn2 in
		let k = x */ kn1 +/ kn2 in
(*		Printf.printf "%i^2 - %i * %i^2 = %i\n" h n k (h*h - n*k*k);*)
		if (h */ h -/ n */ k */ k =/ (num_of_int 1))
			then h
			else conv_cont_frac 1 n int_n (h,hn1) (k,kn1) (y,z);;

let cont_fraction n = 
	let my_n = num_of_int n in
	let z = num_of_int 0 in
	let fst = isqrt my_n in
	if (fst */ fst -/ my_n =/ z)
		then z
		else conv_cont_frac 0 my_n fst (z,z) (z,z) (z,z);;

let _ = 
	let s = ref (num_of_int 0) in
	let d = ref 0 in
	for i = 2 to 1000 do
		let k = cont_fraction i in
		if (k >/ !s) 
			then (s := k; d := i; Printf.printf "X = %s D = %i\n" (string_of_num k) i;)
			else s := !s
	done;
	Printf.printf "D = %i\n" !d;;

