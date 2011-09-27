let rec memoize f =
  let memo = Hashtbl.create 1 in
  let rec fn n =
    try Hashtbl.find memo n with Not_found ->
        let r = f fn n in Hashtbl.add memo n r; r
  in fn

let length_farey_sequence =
  let iter f n =
    let rec sums s k n =
      if k > n then s else
      sums (s +. (f (n / k))) (k + 1) n
    in
    0.5 *. float n *. float (n + 3) -. sums 0. 2 n
  in memoize iter

let prob72 = Printf.printf "%f\n" ((50_000_000. *.100_000_001. -. (length_farey_sequence 100_000_000 -. 2.))*.6.)
