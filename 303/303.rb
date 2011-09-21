#!/usr/bin/ruby

def is_minimal n
	str = n.to_s
	str.each_char{|c| 
		i = c.to_i
		if not((0 == i) || (1 == i) || (2 == i)) then
			return false
		end
	}
	true
end

def find_f n
	res = n
	if (99 == n) then
		return (11335578*99)
	end
	if (999 == n) then
		return (999*111333555778)
	end
	if (9999 == n) then
		return (9999*1111333355557778)
	end

	while not(is_minimal res)
		res += n
	end
	res
end

def find_f2 n
	i = 1
	s = i.to_s(3)
	while not(0 == s.to_i % n)
		i+=1;
		s = i.to_s(3)
	end
	s.to_i
end

puts (is_minimal 12)
puts (is_minimal 121123)
puts (is_minimal 1201201)
puts (find_f 42)
puts (find_f 89)
sum = 0
10000.times{|i|
	n = i+1
	f = find_f2 n
	sum += f / n
	puts "#{n} #{f} #{f/n} sum = #{sum}\n"
}
puts sum
