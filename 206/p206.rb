#!/usr/bin/ruby

min = Math::sqrt(1020304050607080900)
max = Math::sqrt(1929394959697989990)

delta = (max - min)

puts min
puts max
puts delta
puts (min+delta)

min_s = 1010101000
max_s = 1389026630
delta_s = (max_s - min_s)/10
curr = min_s
delta_s.times{|i|
	curr += 10
	num = curr * curr
	str = num.to_s
	break if str =~ /1.2.3.4.5.6.7.8.9.0/
}
puts curr
