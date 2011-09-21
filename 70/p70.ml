open Printf;;

let isqrt n = (int_of_float (sqrt(float_of_int n))) + 1

let rec factor num plist = match plist with
	x::xs -> if (x>num)
				then []
				else (let i = ref 0 in
						let l = ref num in
						while (!l mod x = 0) && (!l > 0) do
							l := !l / x;
							i := !i + 1;
						done;
						if (!i > 0)
							then (x,!i)::(factor num xs)
							else (factor num xs))
	| _ -> [];;

let get_prime_list_to num = 
	let lst = ref [7;5;3;2] in
	for i=10 to num do
		if not((i mod 2 == 0) || (i mod 3 == 0) || (i mod 5 == 0))
			then (
				let is_prime = ref true in
				let k = ref 7 in
				let isqt = isqrt i in
				while (!is_prime)&&(!k < isqt) do
					if i mod !k = 0 then is_prime := true;
					k := !k + 2;
				done;
				if !is_prime
					then lst := i::!lst;)
	done;
	!lst;;

let rec digits a l = 
	if a>0 
		then (let d = a mod 10 in
			let b =  a / 10 in
			let ls = d::l in
			digits b ls)
		else l;;

let check_number_of_digit digit a b = 
	let na = List.filter (fun i -> i=digit) a in
	let nb = List.filter (fun i -> i=digit) b in
	na = nb;;

let is_permutation a b =
	let da = digits a [] in
	let db = digits b [] in
	if not(List.length da = List.length db)
		then false
		else List.fold_left (fun a b -> a && (check_number_of_digit b da db)) true [0;1;2;3;4;5;6;7;8;9];;

let rec ipow a b = match b with
	0 -> 1
	| 1 -> a
	| x -> if x mod 2 = 0 
		then let c = ipow a (x/2) in c*c
		else a * (ipow a (x-1));;
		

let totient n plist = 
	let fs = factor n plist in
	List.fold_left (fun a (b,c) -> a*(b-1)*(ipow b (c-1))) 1 fs;;

let fi n = 
	let res = ref n in
	let k = ref n in
	for i = 2 to (isqrt !k) do
		if (!k mod i = 0) 
			then res := !res - !res /i;
			while (!k mod i = 0) do
				k := !k / i
			done;
	done;
	if (!k > 1)
		then res := !res - !res / !k;
	!res;;
	 
let _ = 
	let maxn = 10000000 in
(*	let plst = get_prime_list_to maxn in
	let plst = List.rev plst in*)
	let min = ref 10000.0 in
	let min_num = ref 0 in
	printf "Factored!\n";
	for i = 86964 to maxn do
		let tot = fi i in (*totient i plst in*)
		if (is_permutation tot i)
			then ( 
				let tmp = (float i)/.(float tot) in
				if tmp < !min
					then (
						printf "min %f num = %i\n" (!min) (!min_num);
						min := tmp; min_num := i)
			)
	done;
	printf "min %f num = %i\n" (!min) (!min_num);;
