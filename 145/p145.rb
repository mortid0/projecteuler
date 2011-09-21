#!/usr/bin/ruby1.9

def is_odd n
	return false if 0 == (n % 10)
	s = n.to_s.reverse.to_i
	t = n + s
	t.to_s.each_char{|c|
		return false if (c.to_i % 2 ==0)
	}
	true
end

s = 0
1_000.times{|i|
	s+=1 if is_odd (i+1)	
	puts i if is_odd (i+1)
}
puts s
