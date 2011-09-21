open Printf
open Num

let isqrt n = (int_of_float (sqrt(float_of_int n))) + 1

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
	let s = ref (num_of_int 0) in
	for i = 2 to 1000000 do
		s := !s +/ (num_of_int (fi i));
	done;
	printf "Elements = %s\n" (string_of_num !s);;
