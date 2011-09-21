open Printf
open List

let i = ref 0;;
let n = ref 0;;

while !i < 1000010 do
	let str = string_of_int !n in
	let len = String.length str in
	n := !n + 1;
	let k = !i + len in
	if ((!i <= 10) && (k>10)) then printf "%c\n" (String.get str (10-(!i)));
	if ((!i <= 100) && (k>100)) then printf "%c\n" (String.get str (100-(!i)));
	if ((!i <= 1000) && (k>1000)) then printf "%c\n" (String.get str (1000-(!i)));
	if ((!i <= 10000) && (k>10000)) then printf "%c\n" (String.get str (10000-(!i)));
	if ((!i <= 100000) && (k>100000)) then printf "%c\n" (String.get str (100000-(!i)));
	if ((!i <= 1000000) && (k>1000000)) then printf "%c\n" (String.get str (1000000-(!i)));
	i := k;
done;;

