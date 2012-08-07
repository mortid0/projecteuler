#!/usr/bin/ruby

a = [1]
b = Array.new(a)
s = Hash.new(200)
50.times{|row|
	a.push(0)
	b.unshift(0)
	len = a.size
	len.times{|i| 
		a[i] +=b[i]
		s[a[i]] = 1;
	}
	puts a
	b = Array.new(a)
}
puts "Finished pascal. Size is #{s.size}"

def fits(n)
	t = Math::sqrt(n).to_i()+1
	(2..t).each{|p|
		return false if (n % (p*p) == 0)
	}
	return true
end

sum = 0
i = s.size
s.keys.each{|k|
	sum += k if (fits(k))
	puts "Checking #{k}. Sum is #{sum}"
}

puts sum
