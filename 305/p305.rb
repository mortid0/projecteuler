#!/usr/bin/ruby1.9

def find(s, n, last_index, last_n)
	ns = n.to_s
	index = s.index(ns, 0)
	res = 0
	while (index != nil)
#		puts index
		res += 1
		if ((res+last_n) == n)
			puts "Found #{n} #{(last_index-(s.length-index-1))}"
			return res
		end
		index = s.index(ns, index+1)
	end
	res
end

def append(s, size, succ, my)
	nstr = ""
	new_len = 0
	my.times{|i|
		k = (succ+i+1).to_s
		nstr.concat(k)
		new_len += k.length
	}

	return Hash["str", (s.concat(nstr)), "len", new_len] if (size > s.length)
	str = ""
	str = s[-(size-1)..-1] if (size>1)
	str.concat(nstr)
	return Hash["str", str, "len", new_len]
end

def find_f(n)
	res = 0
	i = 1
	s = "1"
	ns = n.to_s
	ln = ns.length
	last_index = 1
	my = 100
	while (res < n)
		h = append(s, ln, i, my)
		s = h["str"]
#		puts i
		i += my
		last_index += h["len"]
		res += find(s, n, last_index, res)
	end
end
#find_f(5)
#find_f(12)
#find_f(7780)
33.times{|i|
	find_f((3*(i+1)))
}
