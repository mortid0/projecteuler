#!/usr/bin/ruby

isPrime = new boolean[1000000]
Array.fill(isPrime, true)
isPrime[1] = false
 
for (i in 2..isPrime.size()**0.5) {
    if (isPrime[i]) {
    j = i + i
    while(j < isPrime.size()) {
         isPrime[j] = false
           j += i
     }
    }
}
(answer, i) = [ 0, 100001 ]
     while ((i < isPrime.size()) && (answer == 0)) {
       if (isPrime[i]) {
          s = i.toString()
           def s1 = s[0..-2]
         for (n in "0".."2") {
       if (s1.findAll { it == n }.size() == 3) {
             def c = 0
           for (j in n.."9") {
             pp = (s1.replace(n, j) + s[-1]).toInteger()
       if ((pp > 99999) && isPrime[pp]) c++
     }
   if ( c == 8 ) answer = i
 break
  }
         }
   }
 i++
}
puts answer