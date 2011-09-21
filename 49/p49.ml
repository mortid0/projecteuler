open Printf
open List
open Big_int
open String

let rec range x = 
match x with
|[a,b,c] -> if (a <= b) then a::(range [(a+c),b,c]) else []
|_ -> [];;

let isqrt x = truncate (sqrt (float_of_int x));;

let isPrime n = not (exists (fun a -> n mod a = 0) (2::(range [3,(isqrt n),2])));;

let prime_list = 2::(filter (fun x-> isPrime x) (range[1001,9999,2]));;

let rec print_list x = match x with
l::ls -> (printf "%i\n" l; print_list ls;)
|_ -> printf ";\n";;

print_list prime_list;;

let tst_range = range [2,3333, 2];;

let isPermutation a b = let str_a = string_of_int a in 
			let str_b = string_of_int b in
			let fst_a = contains str_a (get str_b 0) in
			let snd_a = contains str_a (get str_b 1) in
			let trd_a = contains str_a (get str_b 2) in
			let frt_a = contains str_a (get str_b 3) in
			let fst_b = contains str_b (get str_a 0) in
			let snd_b = contains str_b (get str_a 1) in
			let trd_b = contains str_b (get str_a 2) in
			let frt_b = contains str_b (get str_a 3) in
			if (fst_a && snd_a && trd_a && frt_a && fst_b && snd_b && trd_b && frt_b) then true else false;;

let find_step x step = let a = x+step in
			let b = a+step in
			if (isPrime x) && (isPrime a) && (isPrime b) && (isPermutation x a) && (isPermutation a b) then printf "%i %i %i\n" x a b else ();;

let p49 pl = List.iter (fun x -> List.iter (fun step -> find_step x step) tst_range) pl;;

p49 prime_list;;
