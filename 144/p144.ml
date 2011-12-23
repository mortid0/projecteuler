let next_reflect x y vx vy = 
	let t = -.2.0 *. (4.0 *. x *. vx +. y *. vy) /. (4.0 *. vx *. vx +. vy *. vy) in
	(x +. t *. vx, y +. t *. vy);;

let rec count_reflections n x y vx vy =
	if (y > 9.0) && ((abs_float x) < 0.01) && (n > 0)
		then n
		else (
			let (nx, ny) = next_reflect x y vx vy in
			let (dx,dy) = (ny, -4.0*.nx) in
			let k = 2.0*.(vx*.dx +. vy*.dy)/.(dx*.dx+.dy*.dy) in
			let nvx = (k*.dx -. vx) in
			let nvy = (k*.dy -. vy)  in
			count_reflections (n+1) nx ny nvx nvy);;

let _ = 
	let vx = 1.4 in
	let vy = -.19.7 in
	let x = 0.0 +. vx *. 0.00507665 in
	let y = 10.1 +. vy *. 0.00507665 in 
	let n = count_reflections 0 x y vx vy in
	Printf.printf "Num feflections = %i\nx %f y %f tot %f \n" (n-1) x y (4.0*.x*.x+.y*.y);;

