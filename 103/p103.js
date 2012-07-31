var check_pairs = function(xr){
	if (xr.length == 4) {return (xr[0]+xr[3]==xr[1]+xr[2]);}
	var i, res = false;
	if (xr.length > 4) {
		for (i = 0; i < xr.length; i++){
			var br = xr.concat([]);
			br.splice(i,1);
			res = res || check_pairs(br);
			if (res) {return true;}
		}
	}
	return res;
}

var check_triples = function(xr) {
	if (xr.length == 6) {return ((xr[0]+xr[1]+xr[5]==xr[2]+xr[3]+xr[4]) || (xr[0]+xr[2]+xr[5] == xr[1]+xr[3]+xr[4]) || (xr[0]+xr[1]+xr[4]==xr[2]+xr[3]+xr[5]) || (xr[1]+xr[2]+xr[3] == xr[0] + xr[4]+xr[5]));}
	var i, res = false;
	if (xr.length > 6) {
		for (i = 0; i < xr.length; i++){
			var br = xr.concat([]);
			br.splice(i,1);
			res = res || check_triples(br);
			if (res) {return true;}
		}
	}
	return res;
}

var check_size = function(xr){
	var l = xr.length-1;
	if (xr[0]+xr[1] <= xr[l]) {return true;}
	if (xr[0]+xr[1]+xr[2] <= xr[l]+xr[l-1]) {return true;}
	if (xr[0]+xr[1]+xr[2]+xr[3] <= xr[l]+xr[l-1]+xr[l-2]) {return true;}
	return false;
}

var a,b,c,d,e,f, g;
var sum = 7*50;
var ar = [];
var nf = true


for (a = 11; a < 50; a++){
	for (b = a+1; b < 50; b++){
		for (c = b+1; c < 50; c++){
			for (d = c+1; d < 50; d++){
				for (e = d+1; e < 50; e++){
					for (f = e+1; f < 50; f++){
						for (g = f+1; g < 50; g++){
							if (a+b+c+d+e+f+g>= sum) {continue;}
							ar = [a,b,c,d,e,f, g];
							if (check_size(ar)) {continue;}
							if (check_pairs(ar)) {continue;}
							if (check_triples(ar)) {continue;}
							sum = a+b+c+d+e+f+g;
							print("Sum is " + sum + " | " + ar);
						}
					}
				}
			}
		}
	}
}
