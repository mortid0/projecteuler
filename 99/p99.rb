#!/usr/bin/ruby

max = 0
curr_line = 0
max_line = 0
File.open("base_exp.txt", "r") do |file|
	while (line = file.gets)
		curr_line += 1
		str = line.split(",")
		base = str[0].to_i
		expon = str[1].to_i
		if (expon*Math::log(base) > max) then
			max = expon * Math::log(base)
			max_line = curr_line
		end
	end
end
puts max_line
