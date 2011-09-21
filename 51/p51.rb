#!/usr/bin/ruby

def isPrime n
	if (0 == n%2) 
		return false
	end
	isqr = Math::sqrt(n).to_i
	i = 3
	while i < isqr do
		if (0 == n % i) 
			return false
		end
		i += 2
	end
	return true
end

def match num, pat
	num_s = num.to_s
	num.to_s.length.times{|i|
		return false if ((pat[i] == '1')&&(num_s[i] != '0')||(pat[i] == '0')&&(num_s[i] == 0))
	}
	true
end

def p51 num
	len = 2**(num.to_s.length-1)
	len.times{|i|
		sum = 0
		k = 2*i+2
		curr_p = k.to_s(2)
		curr_n = curr_p.to_i
		puts "#{num} #{curr_p} #{curr_n} #{k} #{len}"
		if match(num, curr_p)
			puts "check"
			10.times{|j|
				sum += 1 if isPrime(j*curr_n+num)
			}
			return true if (8 >= sum)
		end
		puts sum
	}
	false
end

puts (match(5004, 6))

curr_n = 121313

while not(p51 curr_n)
	curr_n += 2
end
puts isPrime 121313
puts (p51 curr_n)
