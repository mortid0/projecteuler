let isqrt n = (int_of_float (sqrt(float_of_int n)))

let iter_cont_frac n int_n a b =
	let integer_part = (int_n + a)/b in
	let fractional_part = a - integer_part * b in
	let c = n - fractional_part * fractional_part in
	let new_b = c / b in
	let new_a = - fractional_part in
	(integer_part, new_a, new_b)

let rec period_cont_frac iter n int_n (b,c) (d, e) = match iter with
	0 -> let (fst_a, fst_b, fst_c) = iter_cont_frac n int_n 0 1 in
		let (et_a, et_b, et_c) = iter_cont_frac n int_n fst_b fst_c in
		period_cont_frac 1 n int_n (et_b, et_c) (et_b, et_c);
	|p -> let (x,y,z) = iter_cont_frac n int_n d e in
		if (y = b) && (z = c)
			then p
			else period_cont_frac (p+1) n int_n (b,c) (y,z);;

let cont_fraction n = 
	let fst = isqrt n in
	if (fst * fst - n = 0)
		then 0
		else period_cont_frac 0 n fst (0,0) (0,0);;

let _ = 
	let s = ref 0 in
	for i = 2 to 9999 do
		let k = cont_fraction i in
		if (k mod 2 = 1) 
			then s := !s + 1
			else s := !s
	done;
	Printf.printf "Total %i\n" !s;;
