#!/usr/bin/ruby

class Integer
  def palindrome?
    self == to_s.reverse.to_i
  end
 
  def lychrel?(max=50)
    return true if max == 0
    n = self + to_s.reverse.to_i
    (n.palindrome?) ? false : n.lychrel?(max-1)
  end
end
 
 total = 0
(1..9999).each{|i|
	if i.lychrel? then
		puts i
		total += 1
	end
}
 
p "Total = #{total}"
