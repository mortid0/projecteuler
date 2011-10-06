open Printf
open Array

module IntSet = Set.Make( 
  struct
    let compare = Pervasives.compare
    type t = int
  end )

let read_file name = 
	let ic = open_in name in
	let a = Array.init 50 (fun i -> 
		let tst = input_line ic in
		Array.init 9 (fun j -> 
			let line = input_line ic in
			Array.init 9 (fun k -> (int_of_char line.[k])-(int_of_char '0'))
		)
	) in
	close_in ic;
	a;;

let copy_table table = Array.init 9 (fun x -> Array.init 9 (fun y -> table.(x).(y)))

let try_table table x y n =
	table.(x).(y) <- n;

let check_cell table i k n =
	for l=0 to 8 do
		n := IntSet.remove table.(i).(l) !n;
		n := IntSet.remove table.(l).(k) !n;
	done;
	let x = i / 3 in
	let y = k / 3 in
	for r = 0 to 2 do
		for s = 0 to 2 do
			n := IntSet.remove table.(x*3 + r).(y*3 + s) !n;
		done;
	done;
	!n;;

let solve_sudoku table  =
	let nums = ref IntSet.empty in
	for i = 1 to 9 do
		nums := IntSet.add i !nums;
	done;
	for s=1 to 81 do
		for i=0 to 8 do
			for k=0 to 8 do
				if (table.(i).(k) = 0)
				then (
						let n = check_cell table i k (ref (IntSet.union !nums (IntSet.empty))) in
						if ((IntSet.cardinal n) = 1)
							then table.(i).(k) <- IntSet.min_elt n;
					);
			done;
		done;
	done;
	(search 0 0 0 table);;
