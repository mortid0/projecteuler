let rem x = let rec f l = match l with [] -> []
  |y::k -> if x=y then k else if x<y then l else y::(f k) in f
let ins x = let rec f l = match l with [] -> [x]
  |y::k -> if x=y then l else if x<y then x::k else y::(f k) in f
 
let graph = 
let f n = [|n*(n+1)/2;n*n;n*(3*n-1)/2;n*(2*n-1);n*(5*n-3)/2;n*(3*n-2)|] in
let a = Array.make_matrix 90 6 [] in
for i=19 to 140 do let v = f i in
  for j=0 to 5 do let (x,y) = (v.(j)/100,v.(j) mod 100) in
    if x>9 && y>9 && x<100 then a.(x-10).(j) <- ins y a.(x-10).(j);
  done; done; a
 
let search k = let rec f l r x = if l=[] then k r else
 List.iter (fun t -> List.iter (fun y -> f (rem t l) (y::r) y) graph.(x-10).(t)) l in
 f [1;2;3;4;5] []
let search k x = search (fun l -> if List.mem x (graph.(List.hd l-10).(0)) then k (x::l)) x
exception Found of int
let search = search (fun l -> raise (Found (101*(List.fold_left (+) 0 l))))
 
let answer = 
try for i=10 to 99 do search i; done; 0 with Found x -> x

let _ = Printf.printf "%i\n" answer;;
