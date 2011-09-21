open Printf;;
open Str;;

let filename = "cipher1.txt"

let print_list l = List.iter (printf "%s;") l; printf "\n";;

let print_code l = List.iter 
	(fun x -> 
		let c = char_of_int x in 
		printf "%c" c;) l; printf "\n";;

let encode_arr arr word = 
	Array.mapi (fun i x -> x lxor word.(i mod 3)) arr;;

let test_arr arr = 
	Array.sort (fun x y -> x-y)	arr;
	if (arr.(((Array.length arr) - 1))>122) 
		then false
		else true;;

let print_arr arr =
	Array.iter (fun x-> 
					let c = char_of_int x in
					printf "%c" c;) arr;
	let sum = Array.fold_left (fun x y -> x+y) 0 arr in
	printf "; %i;\n" sum;;

let _ = 
	let ic = open_in filename in
	try
		let line = input_line ic in
		let str_lst = Str.split (regexp ",+") line in
		print_list str_lst;
		printf "%i\n" (List.length str_lst);
		let num_lst = List.map (int_of_string) str_lst in
		let num_arr = Array.of_list num_lst in
		let word = Array.make 3 61 in
		word.(0)<-103;
		word.(1)<-111;
		word.(2)<-100;
		let enc_arr = encode_arr num_arr word in
		print_arr enc_arr;

(*		for a = 97 to 122 do
			word.(0) <- a;
			for b = 97 to 122 do
				word.(1) <- b;
				for c = 97 to 122 do
					word.(2) <- c;
					let enc_arr = encode_arr num_arr word in
					if (test_arr enc_arr)
						then (
							printf "%c%c%c; " (char_of_int a) (char_of_int b) (char_of_int c);
							print_arr enc_arr;);
					printf "%c%c%c; " (char_of_int a) (char_of_int b) (char_of_int c);
					print_arr enc_arr;
				done;
			done;
		done;*)
		close_in ic;

	with e->
		close_in_noerr ic;
		raise e;;
