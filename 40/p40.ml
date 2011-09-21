open Printf
open List

let rec range x = match x with
[a,b,c] -> if (a<=b) then a::(range [(a+c),b,c]) else []
|_ -> [];;

let string_of_int_list l = fold_left (fun t x -> (string_of_int x)^t) "" l;;

let num_digits n = ((int_of_float) (log10 (float_of_int n)))+1;;

let is_pandigital s = fold_left (fun tot x -> tot && (String.contains s x)) true ['1';'2';'3';'4';'5';'6';'7';'8';'9'];;

let concat_product n = let num = ref 0 in 
			let i = ref 1 in
			let s = ref "" in
			while !num < 9 do
				let prod = !i * n in
				num := !num + (num_digits prod);
				s := !s^(string_of_int prod);
				i := !i + 1;
			done;
			!s;;

(*let s = fold_left (fun c b -> let n = (concat_product b) in 
				if ((String.length n)= 9) && (is_pandigital n) then let u = int_of_string n in if u > c then u else c
				else c) 
	0 (range [1,99999,1]);;

printf "%i\n" s;;*)


