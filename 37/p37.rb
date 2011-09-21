#!/usr/bin/ruby
require 'set'

def naiveTest n
	if (n%2==0) && (n != 2)
		return false
	end
	if n == 1
		return false
	end
	range = 3..Math::sqrt(n).to_i
	range.step(2) {|i| if (n %i ==0)
				return false
			   end
	}
	return true
end

def truncatable_left(n)
	s = n.to_s
	while (s.length > 0)
		if (( 1 == s.length ) && ( naiveTest(s.to_i) ))
			return true
		end
		if (naiveTest(s.to_i))
			s = s[0..s.length-2]
		else
			return false
		end
	end
	true
end
def truncatable_right(n)
	s = n.to_s
	while (s.length > 0)
		if ((s.length==1)&&(naiveTest(s.to_i)))
			return true
		end

		if (naiveTest(s.to_i))
			s = s[1..s.length-1]
		else
			return false
		end
	end
	true
end

puts truncatable_left(3797)
puts truncatable_right(3797)
num = 21
count = 0
sum = 0
while (count < 11)
	num+=2
	if ((truncatable_right(num)) &&( truncatable_left(num)))
		puts num
		sum += num		
	end
end

puts sum
