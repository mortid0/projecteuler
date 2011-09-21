open Printf;;
open Num;;


let fac n = match n with
	9 -> num_of_int 362880
	| 8 -> num_of_int 40320
	| 7 -> num_of_int 5040
	| 6 -> num_of_int 720
	| 5 -> num_of_int 120
	| 4 -> num_of_int 24
	| 3 -> num_of_int 6
	| 2 -> num_of_int 2
	| _ -> num_of_int 1;;

module IntSet = Set.Make( 
  struct
    let compare = compare_num
    type t = num
  end );;

let rec digits a l = 
	if (a>/(num_of_int 0)) 
		then (let d = mod_num a (num_of_int 10) in
			let b = quo_num a (num_of_int 10) in
			let ls = (int_of_num d)::l in
			digits b ls)
		else l;;

let next_num n = 
	List.fold_left (fun y x-> y +/ (fac x)) (num_of_int 0) (digits n []);;

let rec chain_len chain n = 
	if (IntSet.mem n chain)
		then 0
		else (
			let new_chain = IntSet.add (n) chain in
			1 + (chain_len new_chain (next_num n))
			);;

let p74 n = 
	if (60 = chain_len IntSet.empty (num_of_int n))
		then (printf "%i\n" n; 1)
		else 0;;

let _ = 
	let s = ref 0 in
	for i = 10 to 1000000 do
		s := !s + (p74 i)
	done;
	printf "Total = %i\n" !s;;

	
