open Printf;;
open List;;

let isqrt n = int_of_float (sqrt(float_of_int n));;

let rec range a b = if (a < b) then a::(range (a+1) b) else [];;

let triangles p = fold_left 
			(fun s a -> s + (fold_left 
						(fun s2 b -> let c = p - a - b in 
								if c*c = a*a + b*b then (s2+1) else s2) 
						0 (range 1 (p-a)) ) ) 
			0 (range 1 (p-1));;

printf "%i\n" (triangles 120);;

let max_triangles = fold_left (fun (max, m) p -> let n = triangles p in if n>max then (n,p) else (max, m)) (0,0) (range 5 1000);;

printf "%i\n" (snd max_triangles);;
