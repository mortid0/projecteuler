var s = [0,1,2,3,4,5,6,7,8,9], c1, c2;
var i,j,k,l,a,b,c,d;
var l1 = [0,0,0,1,2,3,6,8];
var l2 = [1,4,9,6,5,6,4,1];
var x, g, count = 0;
for (i = 0; i < 10; i++){
	for (j = i+1; j < 10; j++){
		for (k = j+1; k < 10; k++){
			for (l = k+1; l < 10; l++){
				c1 = s.concat([]);
				c1.splice(l,1);
				c1.splice(k,1);
				c1.splice(j,1);
				c1.splice(i,1);
				for (a = 0; a < 10; a++){
					for (b = a+1; b < 10; b++){
						for (c = b+1; c < 10; c++){
							for (d = c+1; d < 10; d++){
								c2 = s.concat([]);
								c2.splice(d,1);
								c2.splice(c,1);
								c2.splice(b,1);
								c2.splice(a,1);
								if ((c1.indexOf(6)>-1) || (c1.indexOf(9)>-1)) {c1.push(6,9);}
								if ((c2.indexOf(6)>-1) || (c2.indexOf(9)>-1)) {c2.push(6,9);}
								g = true;
								for (x = 0; x < 8; x++){
									g &= (( c1.indexOf(l1[x])>-1) && (c2.indexOf(l2[x])>-1)) || ( ( c1.indexOf(l2[x])>-1) && (c2.indexOf(l1[x])>-1) );
								}
								if (g) {count++}
							}
						}
					}
				}
			}
		}
	}
}
print("Total " + (count/2));

