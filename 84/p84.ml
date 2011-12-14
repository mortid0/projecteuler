open Num
open Array

let check_ar ar = Printf.printf "Sum = %s\n" (string_of_num (fold_left (fun x a -> x +/ a) (num_of_int 0) ar))

let do_cc ar prob = (ar.(10) <- ar.(10) +/ prob // (num_of_int 16);
		ar.(0) <- ar.(0) +/ prob // (num_of_int 16))

let do_jail ar prob = ar.(10) <- ar.(10) +/ prob

let do_common_ch ar prob = 
	let t_prob = prob // (num_of_int 16) in
	do_jail ar t_prob;
	ar.(0) <- ar.(0) +/ t_prob;
	ar.(11) <- ar.(11) +/ t_prob;
	ar.(24) <- ar.(24) +/ t_prob;
	ar.(39) <- ar.(39) +/ t_prob;
	ar.(5) <- ar.(5) +/ t_prob;;

let make_action ar prob pos = match pos with
	| 30 -> do_jail ar prob
(* CC *)
	| 2 -> (do_cc ar prob;
		ar.(2) <- ar.(2) +/ prob*/ (num_of_int 14) // (num_of_int 16);)
	| 17 -> (do_cc ar prob;
		ar.(17) <- ar.(17) +/ prob */ (num_of_int 14) // (num_of_int 16);)
	| 33 -> (do_cc ar prob;
		ar.(33) <- ar.(33) +/ prob */ (num_of_int 14) // (num_of_int 16);)
(* CH *)
	| 7 ->	(do_common_ch ar prob;
		ar.(15) <- ar.(15) +/ (prob // (num_of_int 8));
		ar.(12) <- ar.(12) +/ (prob // (num_of_int 16));
		ar.(4) <- ar.(4) +/ (prob // (num_of_int 16));
		ar.(7) <- ar.(7) +/ (prob */(num_of_int 6)//(num_of_int 16));)
	| 22 -> (do_common_ch ar prob;
		ar.(25) <- ar.(25) +/ (prob // (num_of_int 8));
		ar.(28) <- ar.(28) +/ (prob // (num_of_int 16));
		ar.(19) <- ar.(19) +/ (prob // (num_of_int 16));
		ar.(22) <- ar.(22) +/ (prob */(num_of_int 6)//(num_of_int 16));)
	| 36 -> (do_common_ch ar prob;
		ar.(5) <- ar.(5) +/ (prob // (num_of_int 8));
		ar.(12) <- ar.(12) +/ (prob // (num_of_int 16));
		ar.(33) <- ar.(33) +/ (prob // (num_of_int 16));
		ar.(36) <- ar.(36) +/ (prob */(num_of_int 6)//(num_of_int 16));)
(* Other *)
	| x -> ar.(x) <- ar.(x) +/ prob;;


let iterate old_array = 
	let new_array = Array.init 40 (fun i -> (num_of_int 0)) in
	let one = (num_of_int 1) in
(*	let p_dd = one // (num_of_int 36) in
	let q_dd = one -/ p_dd in
	let four_dd = one // (num_of_int 3) in
	let six_dd = one // (num_of_int 5) in
	let eight_dd = one // (num_of_int 5) in
	let ten_dd = one // (num_of_int 3) in*)
	let p_dd = one // (num_of_int 16) in
	let q_dd = one -/ p_dd in
	let four_dd = one // (num_of_int 3) in
	let six_dd = one // (num_of_int 3) in
	for i=0 to 39 do
	(*	for 6-sided cubes
		make_action new_array (q_dd */ old_array.(i) */ one // (num_of_int 36)) ((i+2) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 2) //(num_of_int 36)) ((i+3) mod 40);
		make_action new_array ((one -/ p_dd */ four_dd) */ old_array.(i) */ (num_of_int 3) //(num_of_int 36)) ((i+4) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 4) //(num_of_int 36)) ((i+5) mod 40);
		make_action new_array ((one -/ p_dd */ six_dd) */ old_array.(i) */ (num_of_int 5) //(num_of_int 36)) ((i+6) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 6) //(num_of_int 36)) ((i+7) mod 40);
		make_action new_array ((one -/ p_dd */ eight_dd) */ old_array.(i) */ (num_of_int 5) //(num_of_int 36)) ((i+8) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 4) //(num_of_int 36)) ((i+9) mod 40);
		make_action new_array ((one -/ p_dd */ ten_dd) */ old_array.(i) */ (num_of_int 3) //(num_of_int 36)) ((i+10) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 2) //(num_of_int 36)) ((i+11) mod 40);
		make_action new_array (q_dd */ old_array.(i) */ one // (num_of_int 36)) ((i+12) mod 40);
		make_action new_array (old_array.(i) */ p_dd // (num_of_int 6)) 10;*)
		make_action new_array (q_dd */ old_array.(i) */ one // (num_of_int 16)) ((i+2) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 2) //(num_of_int 16)) ((i+3) mod 40);
		make_action new_array ((one -/ p_dd */ four_dd) */ old_array.(i) */ (num_of_int 3) //(num_of_int 16)) ((i+4) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 4) //(num_of_int 16)) ((i+5) mod 40);
		make_action new_array ((one -/ p_dd */ six_dd) */ old_array.(i) */ (num_of_int 3) //(num_of_int 16)) ((i+6) mod 40);
		make_action new_array (old_array.(i) */ (num_of_int 2) //(num_of_int 16)) ((i+7) mod 40);
		make_action new_array (q_dd */ old_array.(i) */ one // (num_of_int 16)) ((i+8) mod 40);
		make_action new_array (old_array.(i) */ p_dd // (num_of_int 4)) 10;
	done;
	new_array;;

let rec approximate curr arr = match curr with
	50 -> arr
	| n -> (approximate (n+1) (iterate arr));;

let _ =
	let start_array = Array.init 40 (fun i -> (num_of_int 1) // (num_of_int 40)) in
	check_ar start_array;
	let fin_array =	approximate 0 start_array in
	check_ar fin_array;
	iteri (fun i a -> Printf.printf "%i - %f\n" i (float_of_num a)) fin_array;;
