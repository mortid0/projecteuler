let f1 a b = a +. b

let f2 a b = a *. b

let f3 a b = if (b = 0.0)
				then 999999.0
				else  a /. b

let f4 a b = a -. b

module IntSet = Set.Make(
	struct 
		let compare = Pervasives.compare 
		type t = int 
	end )

let rec succ_len l a = match l with
	|x::xs -> if (x = a)
				then succ_len xs (a+1)
				else (a-1)
	|[] -> (a-1);;

let test s a b c d =
	let fn = [|f1; f2; f3; f4|] in
	for i = 0 to 3 do
		for j = 0 to 3 do
			for k = 0 to 3 do
				let g1 = fn.(i) in
				let g2 = fn.(j) in
				let g3 = fn.(k) in
				let aa = (g3 (g2 (g1 a b) c) d) in
				let bb = (g3 (g1 a b) (g2 c d)) in
				let cc = (g3 (g1 a b) (g2 c d)) in
				let dd = (g3 a (g2 (g1 b c) d)) in
				let ee = (g3 a (g2 b (g1 c d))) in
				let aaa = ref 0 in
				let bbb = ref 0 in
				let ccc = ref 0 in
				let ddd = ref 0 in
				let eee = ref 0 in
				if (aa = floor aa)
					then aaa := int_of_float aa;
				if (bb = floor bb)
					then bbb := int_of_float bb;
				if (cc = floor cc)
					then ccc := int_of_float cc;
				if (dd = floor dd)
					then ddd := int_of_float dd;
				if (ee = floor ee)
					then eee := int_of_float ee;
				s := IntSet.add !aaa !s;
				s := IntSet.add !bbb !s;
				s := IntSet.add !ccc !s;
				s := IntSet.add !ddd !s;
				s := IntSet.add !eee !s;
			done;
		done;
	done;
	!s;;

let _ =
	let max = ref 0 in
	let ar = [|0;0;0;0|] in
	for aa = 1 to 9 do
		for bb = (aa+1) to 9 do
			for cc = (bb+1) to 9 do
				for dd = (cc+1) to 9 do
					let a = float_of_int aa in
					let b = float_of_int bb in
					let c = float_of_int cc in
					let d = float_of_int dd in
					let s = ref IntSet.empty in
					s := test s a b c d;
					s := test s a b d c;
					s := test s a c b d;
					s := test s a c d b;
					s := test s a d b c;
					s := test s a d c b;
					s := test s b a c d;
					s := test s b a d c;
					s := test s b c a d;
					s := test s b c d a;
					s := test s b d a c;
					s := test s b d c a;
					s := test s c b a d;
					s := test s c b d a;
					s := test s c a b d;
					s := test s c a d b;
					s := test s c d b a;
					s := test s c d a b;
					s := test s d a c b;
					s := test s d a b c;
					s := test s d c a b;
					s := test s d c b a;
					s := test s d b a c;
					s := test s d b c a;
					s := IntSet.filter (fun x -> x > 0) !s;
					let l = IntSet.elements !s in
					let e = succ_len l 1 in
					if e > !max
						then (max := e;ar.(0) <- aa; ar.(1) <- bb; ar.(2) <- cc; ar.(3) <- dd;);
				done;
			done;
		done;
	done;
	Printf.printf "%i; %i %i %i %i\n" !max ar.(0) ar.(1) ar.(2) ar.(3);;
