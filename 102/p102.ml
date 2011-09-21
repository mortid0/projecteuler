open Printf;;
open Scanf;;

let file = "triangles.txt";;

let is_zero_in x1, y1, x2, y2, x3, y3 =;;


let _ =
	let ic = open_in file in
	try
		while 
		let curr_line = fscanf ic "%i,%i,%i,%i,%i,%i\n" x1 y1 x2 y2 x3 y3 is_zero_in;

		close_in ic;
	with e-> 
		close_in_noerr ic;
		raise e;;

