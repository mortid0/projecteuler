#!/usr/bin/ruby1.9

def sum_square_of_digits n
	s = 0
	n.to_s.each_char{|c|
		t = c.to_i
		s+=t*t
	}
	s
end

def is89? n
	return true if 89 == n
	return false if 2 > n
	t = n
	while ((t != 89 ) && ( t != 1 ))
		t = sum_square_of_digits t
	end
	(t == 89)
end

s = 0
10_000_000.times{|i|
	s +=1 if (is89? (i+1))
	puts "new #{(i+1)}" if (0==i%1000)
}
puts s
