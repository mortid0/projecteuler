let _ = find_bouncy 0.9

let find_bouncy x  = find_bouncy_from 100 0 0.9

let is_bouncy a = 

let rec find_bouncy_from start bouncy freq = 
	if (float bouncy) /. (float start ) > freq 
		then bouncy
		else let curr_b = start + 1 in
			 if (is_bouncy curr_b) 
				 then find_bouncy curr_b (bouncy+1) freq
				 else find_bouncy curr_b bouncy freq
	
