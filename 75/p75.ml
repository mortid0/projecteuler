open Printf

let rec gcd x y = 
	let a = max x y in
	let b = min x y in
	if a mod b = 0
		then b
		else gcd b (a mod b)

module IntSet = Set.Make( 
	struct
		let compare = compare
		type t = int
	end)

let isqrt n = (int_of_float (sqrt(float_of_int n))) + 1

let _ = 
	let l = 1500000 in
	let max_m = isqrt(l/2) in
	let set = ref IntSet.empty in
	let dups = ref IntSet.empty in
	for m = 2 to max_m do
		for n = 1 to (m-1) do
			let p = 2*m*(m+n) in
			if (gcd m n = 1) && ((m - n) mod 2 = 1) && (2*m*(m+n) < l)
				then
				(
					for k = 1 to (l/p) do
						let new_p = k*p in
						if (new_p < l)
						then
						(
							if (not(IntSet.mem new_p !set)) && (not (IntSet.mem new_p !dups))
								then (set := IntSet.add new_p !set;)
								else (if (IntSet.mem new_p !set)
										then (set := IntSet.remove new_p !set; dups := IntSet.add new_p !dups))
						)
					done;
				)
		done;
	done;
	printf "%i\n" (IntSet.cardinal !set)
