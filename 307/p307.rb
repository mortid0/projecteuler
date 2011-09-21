#!/usr/bin/ruby

def get_events chips, total_defects, defects_on_chip
	size = total_defects - defects_on_chip + 1
	res = 1
	size.times{|i|
		res *= (chips - i)
	}
	res
end

c = 1000_000
d = 20_000
t = 0
p_307 = 0
tmp = 1
20_000.times{|i|
	tmp *= c
	c -= 1
	don = d - i
	t += tmp
	p_307 += tmp if (don >= 3)
#	puts "#{don} #{t} #{tmp} #{p_307}"
}

puts "#{p_307}\n#{t}\n#{p_307.quo(t)}"

