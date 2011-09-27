#!/usr/bin/ruby

lines = File.open("matrix.txt", "r").readlines

n = lines.size
matrix = Array.new(n){|i| (lines[i].split(',').map{|a| a.to_i})}
path = Array.new(n){Array.new(n){0}}
n.times{|k|
	path[k][0] = matrix[k][0]
}
#puts matrix.inspect

sum = 0
(2*n).times{|o|
	n.times{|k|
		n.times{|l|
			path[k+1][l] = path[k][l] + matrix[k+1][l] if ((k+1 < n) && ((0 == path[k+1][l]) || (path[k][l]+matrix[k+1][l] < path[k+1][l]) ))
			path[k-1][l] = path[k][l] + matrix[k-1][l] if ((k > 0) && ((0 == path[k-1][l]) || (path[k][l]+matrix[k-1][l] < path[k-1][l]) ))
			path[k][l+1] = path[k][l] + matrix[k][l+1] if ((l+1 < n) && ((0 == path[k][l+1]) || (path[k][l]+matrix[k][l+1] < path[k][l+1]) ))
			path[k][l-1] = path[k][l] + matrix[k][l-1] if ((l > 0) && ((0 == path[k][l-1]) || (path[k][l]+matrix[k][l-1] < path[k][l-1]) ))
		}
	}
}
min = path[n-1][n-1]
n.times{|k|
	min = path[k][n-1] if min > path[k][n-1]
}
puts min
=begin
i = 0
j = 0
while ((j < n-1) && (i < n-1)) do
	n.times{|k|
		n.times{|l|
			
		}
	}
	if (j == n - 1)
		i += 1
		sum += matrix[i][j]
	elsif (i == n-1)
		j += 1
		sum += matrix[i][j]
	else
		k = i
		l = j
		if (matrix[i+1][j] < matrix[i][j+1]) then
			k = i+1
		else
			l = j+1
		end
		i = k
		j = l
		sum += matrix[k][l]
	end
end

puts sum
=end
