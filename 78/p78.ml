open Printf;;
open Hashtbl;;
open Big_int;;

let rec one_pow p = if (0 == p mod 2)
			then 1
			else -1 ;;

let find_part n tbl = 
	let p = ref (big_int_of_int 0) in
	let max = int_of_float ((1.0 +. sqrt(1.0 +. 24.0 *. (float_of_int n)))/. 6.0) in
	for k = 1 to max do
		let a = (n - k * (3 * k - 1)/2) in
		let b = (if a < 0 then zero_big_int else Hashtbl.find tbl a) in
		let c = (n - k * (3 * k + 1)/2) in
		let d = (if c < 0 then zero_big_int else Hashtbl.find tbl c) in
		p := add_big_int !p (mult_int_big_int (one_pow (k+1)) (add_big_int b d))
	done;
	(!p) ;;
	

let _ = 
	let tbl = Hashtbl.create 10000 in
	Hashtbl.add tbl (-1) (big_int_of_int 0);
	Hashtbl.add tbl 0 (big_int_of_int 1);
	Hashtbl.add tbl 1 (big_int_of_int 1);
	Hashtbl.add tbl 2 (big_int_of_int 2);
	Hashtbl.add tbl 3 (big_int_of_int 3);
	let mil = big_int_of_int 1000000 in
	let k = ref 1 in
	let n = ref (Hashtbl.find tbl 1) in
	while (gt_big_int (mod_big_int !n mil) zero_big_int) do
		k := !k + 1;
		if (mem tbl !k)
			then n := Hashtbl.find tbl !k
			else (n := find_part !k tbl; Hashtbl.add tbl !k !n;);
(*		printf "%i %s\n" !k (string_of_big_int !n);*)
	done;
	printf "%i\n" !k ;;
