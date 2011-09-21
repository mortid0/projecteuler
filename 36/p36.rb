#!/usr/bin/ruby

num = 0
1000_000.times{|i|
	d = i.to_s
	if (d == d.reverse)
		b = i.to_s(2)
			if (b == b.reverse)
				num+=i
			end
	end
}

puts num
