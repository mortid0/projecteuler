open Batteries;;
open Big_int;;
open String;;
open Printf;;
open Char;;

let basis_num x = match x with
0 -> big_int_of_int 2
| 1 -> big_int_of_int 3
| 2 -> big_int_of_int 5
| 3 -> big_int_of_int 7
| 4 -> big_int_of_int 11
| 5 -> big_int_of_int 13
| 6 -> big_int_of_int 17
| 7 -> big_int_of_int 19
| 8 -> big_int_of_int 23
| 9 -> big_int_of_int 29
| x -> printf "%i;\n" x; big_int_of_int 0 ;;

let get_int_list str = 
	let s = String.to_list str in
	List.map (fun x -> sub_big_int (big_int_of_int (Char.code x)) (big_int_of_int 48)) s ;;

let parse_num num = 
	let str = string_of_big_int num in
	let n = get_int_list str in
	List.fold_right (fun x p -> mult_big_int (basis_num (int_of_big_int x)) p) n unit_big_int;;

let _ = 
	let a = ref 100 in
	let tbl = Hashtbl.create 10000 in
	let n = ref 0 in
	let l = ref [] in
	while (le_big_int (big_int_of_int !a) (big_int_of_int 10000)) do
		let a_i = big_int_of_int !a in
		let cb = mult_big_int (square_big_int a_i) a_i in
		let nm = parse_num cb in
		let str = string_of_big_int nm in
		Hashtbl.add tbl str a_i;
		l := Hashtbl.find_all tbl str;
		n := List.length !l;
		if (eq_big_int (big_int_of_int 5) (big_int_of_int !n)) 
			then (List.iter (fun x -> printf "%i;" (int_of_big_int x)) !l; printf "\n");
		a := int_of_big_int(add_int_big_int 1 a_i)
	done;
	List.iter (fun x -> printf "%i\n" (int_of_big_int x)) !l;;
