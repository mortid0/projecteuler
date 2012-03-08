let rec get_second_random l a = 
	let b = Random.int l in
	if a = b
		then get_second_random l a
		else b

let rec get_third_random l a b = 
	let c = Random.int l in
	if (a = c) || (b = c)
		then get_third_random l a b
		else c

let permute arr = 
	let l = Array.length arr in
	let a = Random.int l in
	let b = get_second_random l a in
	let c = get_third_random l a b in
	let brr = Array.copy arr in
	brr.(a) <- arr.(b);
	brr.(b) <- arr.(c);
	brr.(c) <- arr.(a);
	brr;;

let is_ordered a =
	let b = Array.mapi (fun x y -> x-y = 0) a in
	Array.fold_left (fun x y -> x && y) true b

let generate_random_array a =
	let b = permute a in
	let c = permute b in
	let d = permute c in
	permute d

let rec find_av_perm a n = 
	if (is_ordered a) || (n > 100000)
		then n
		else (find_av_perm (permute a) (n+1))

let _ = 
	let a = Array.init 4 (fun i -> i) in
	let s = ref 0.0 in
	for i = 1 to 100000 do
		let ra = generate_random_array a in
		let n = find_av_perm ra 0 in
		s := !s +. (float_of_int n);
	done;
	Printf.printf "%f\n" (!s /. 100000.0);;
	
