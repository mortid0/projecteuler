let size = 50;;

let rec loop_x1 acc x1 =
  let rec loop_y1 acc y1 =
    let rec loop_x2 acc x2 =
      let rec loop_y2 acc y2 =
        if y2 < 0 then acc
        else
          loop_y2 (
            let is_rtrian =
              if x1 - y1 > x2 - y2 && 
                 not ((x1 = 0 && y1 = 0) || 
                      (x2 = 0 && y2 = 0)) && 
                 x1 *  y2 <> x2 * y1 then
                let a = x1 * x1 + y1 * y1 in
                let b = x2 * x2 + y2 * y2 in
                let c = (x1 - x2) * (x1 - x2) + 
                        (y1 - y2) * (y1 - y2) in
                (a + b = c || a + c = b || b + c = a) 
              else false in
            if is_rtrian then succ acc else acc
          ) (pred y2) in
      if x2 < 0 then acc
      else 
        loop_x2 (acc + loop_y2 0 size) (pred x2) in
    if y1 < 0 then acc
    else 
      loop_y1 (acc + loop_x2 0 size) (pred y1) in
  if x1 < 0 then acc
  else 
    loop_x1 (acc + loop_y1 0 size) (pred x1);;

Printf.printf "%d\n" (loop_x1 0 size)
