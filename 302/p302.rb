#!/usr/bin/ruby1.9

def isPrime n
	if (0 == n%2) then
		return false
	end
	isqr = Math::sqrt(n).to_i
	k = 3
	while k < n do
		if (0 == n % k) then
			return false
		end
		k += 2
	end
end

a = Array.new(10)
a[0] = 2
a[1] = 3
k = 2
while k < 10 do
	a[k] = a[k-1]+2
	while (isPrime(a[k]))
		a[k] += 2
		puts "#{a[k]} #{k}"
	end
	k += 1
	puts k
end
puts a.inspect
s = 1
a.each{|item| s *= item*item}
puts s
puts s.to_s.length
