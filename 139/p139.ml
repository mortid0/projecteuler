let can_tile a b c = (c mod (abs (a-b))) = 0

let triples_from_primitive a b c = 1000000 / (a+b+c)

let rec coprime a b = 
	if b = 1 
		then false
		else (
			let c = a mod b in
			if c = 0
				then true
				else coprime b c)

let _ =
	let s = ref 0 in
	for m = 1
