#!/usr/bin/ruby

sum = 0
(1..9).each{|i|
	(1..30).each{|j|
		puts "#{i} #{j}"
		sum += 1 if (j == (i**j).to_s.length)	
	}
}
puts sum
