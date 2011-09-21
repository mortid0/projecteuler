let main a b =
    let fa = 1. /. float a in
 
    let init a b =
        let rec loop i acc =
            if i = a - b then acc else loop (i - 1) (acc *. float i *. fa) in
        loop a 1. in
 
    let rec loop c g acc =
        if c * 2 > b then acc else
            let ng = g *. float (b-2*c) *. float (b-2*c-1)
                       /. (2. *. float (c+1) *. float (a-b+c+1)) in
            loop (c + 1) ng (acc +. g) in
    1. -. loop 0 (init a b) 0.
;;
Printf.printf "Answer: %.10f\n" (main 1000000 20000)