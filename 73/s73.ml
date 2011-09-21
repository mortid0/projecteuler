open Printf

type brocot_tree = Empty | Node of int * int * int * brocot_tree * brocot_tree

let rec build_tree left center right =
	if (center > 12000) 
		then Empty
		else Node(left, center, right, (build_tree left (left+center) center), (build_tree center (right+center) right) );;

let rec count_nodes t = match t with
	Node(a,b,c,l,r) -> 1 + (count_nodes l) + (count_nodes r)
	| _ -> 0;;

let _ =
	let tree = build_tree 2 5 3 in
	let num = count_nodes tree in
	printf "Nodes = %i\n" num;;
