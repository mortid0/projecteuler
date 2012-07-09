module IntSet = Set.Make( 
  struct
    let compare = Pervasives.compare
    type t = int
  end )

let find_sum_product k = 
	
