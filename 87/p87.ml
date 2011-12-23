module IntSet = Set.Make( 
  struct
    let compare = Pervasives.compare
    type t = int
  end )

let rec generate_prime_list plist curr max_el =
	if (curr > max_el)
		then plist
		else (
		if not(List.fold_left (fun x a -> x || (curr mod a = 0)) false plist)
			then generate_prime_list (curr::plist) (curr+2) max_el
			else generate_prime_list plist (curr+2) max_el);;

let rec generate_forth_power sum plist st = 
	match plist with
	| x::xs -> let num = x*x*x*x + sum in
			if (num > 50000000)
				then st
				else generate_forth_power sum xs (IntSet.add num st)
	| _ -> st;;

let rec generate_cube sum plist_c plist st =
	match plist_c with
	| x::xs -> let num = x*x*x + sum in
			if (num > 50000000)
				then st
				else (let nst = generate_forth_power num plist st in
					generate_cube sum xs plist nst)
	| _ -> st;;

let rec generate_p87 plist plist_s st =
	match plist_s with
	| x::xs -> let num = x*x in
			if (num > 50000000)
				then st
				else (let nst = generate_cube num plist plist st in
					generate_p87 plist xs nst)
	| _ -> st;;

let _ =
	let plist_inv = generate_prime_list [7; 5; 3; 2] 9 7500 in
	let plist = List.rev plist_inv in
	let st = IntSet.empty in
	let total_st = generate_p87 plist plist st in
	Printf.printf "Total = %i\n" (IntSet.cardinal total_st);;
