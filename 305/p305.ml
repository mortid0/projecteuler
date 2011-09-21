let _ =
  let pow10 = Array.make 19 1 in
  let _ =
    for i = 1 to 18 do
      pow10.(i) <- pow10.(i - 1) * 10
    done
  in
  let pow3 = Array.make 19 1 in
  let _ =
    for i = 1 to 18 do
      pow3.(i) <- pow3.(i - 1) * 3
    done
  in
  let pos n =
    let rec pos n k r =
      if n < pow10.(k) then (
	r + k * (n - pow10.(k - 1))
      ) else (
	pos n (k + 1) (r + 9 * k * pow10.(k - 1))
      )
    in
      1 + pos n 1 0
  in
  let len n =
    let r = ref 0 in
    let n = ref n in
      while !n > 0 do
	incr r;
	n := !n / 10;
      done;
      !r
  in
  let cycles n k =
    let r = ref [] in
    let n = ref n in
      for i = 1 to k do
	if !n > pow10.(k - 1)
	then r := (pos !n + i - 1) :: !r;
	n := !n / 10 + pow10.(k - 1) * (!n mod 10)
      done;
      !r
  in
  let solve n =
    let k = len n in
    let xs = ref [] in
      for i = 0 to min 6 k do
	let n = n * pow10.(i) in
	  for j = 0 to pow10.(i) - 1 do
	    let c = cycles (n + j) (k + i) in
	      xs := c @ !xs
	  done
      done;
      List.nth (List.sort compare !xs) (n - 1)
  in
  let res = ref 0 in
    for i = 1 to 13 do
      res := !res + solve pow3.(i)
    done;
    Printf.printf "res %d\n" (!res - 500) (* 243 -> ... 42 43 ... *)
