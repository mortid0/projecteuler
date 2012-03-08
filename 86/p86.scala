object p86{
	def isSquare(n : Int) : Boolean =
	{
		val x = math.round(math.sqrt(n))
		x*x == n
	}
	def line(m : Int) : Int =
	{
		var s = 0
		(1 to (2*m)).foreach(i => 
			if (isSquare(m*m+i*i)) {
				if (i <= m)
					{s += i/2}
				else 
					{s += m + 1 - i + i/2}
			})
		s
	}
	def solvep86(n:Int, s:Int):Int = 
	{
		if (s>1000000)
		{
			n-1
		}
		else
		{
			solvep86(n+1, s+line(n))
		}
	}
	def main(args:Array[String])
	{
		var s = solvep86(1,0)
		println(s)
	}
}
