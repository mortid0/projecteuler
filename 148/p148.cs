using System;
using System.Collections.Generic;

namespace Application
{
	public class p148
	{
		public static Dictionary<long, long> mem = new Dictionary<long, long>();
		public p148 ()
		{
		}
		public static long ones(long line)
		{
			if (line < 7) {return line;}
			if (mem.ContainsKey(line)) {return mem[line];}
			long res = line;
			long maxSevenPow = 1;
			while (maxSevenPow < line) {maxSevenPow *= 7;}
			maxSevenPow /= 7;
			if (line % maxSevenPow == 0) {return line;}
			long prev = 1;
			long curr_pow = maxSevenPow;
			long tmp = curr_pow - (line % curr_pow);
			res -= prev * (line / curr_pow) * tmp;
			prev = line / curr_pow + 1;
			if (curr_pow > 7) {res -= prev * ((line%curr_pow) - ones(line%curr_pow)); }
			mem[line] = res;
			return res;
		}
		public static long triangles(long curr_area, long curr_line, long max_line)
		{
			long res = 0;
			long rows = max_line / curr_line;
			long last_line = rows * curr_line;
			res = rows * (rows + 1) * curr_area / 2;
			if (last_line == max_line) {return res;}
			return (res + (rows+1) * triangles(curr_area/28, curr_line / 7, max_line % curr_line));
		}
		public static void Main(string[] args)
		{
			long i = 0;
			long up_bound = 1000000000;
			long last_line = up_bound - (up_bound%7);
			long last_sum = triangles(296196766695424, 282475249, last_line); // all triangles size 7**x have 28**x members. And the last power before 10**9 is 7**10
			Console.Out.WriteLine(last_line + " sum is " + last_sum);
			long sum = 0;
			for(i = last_line+1; i <= up_bound; i+=1)
			{
				sum += ones(i);
			}
			Console.WriteLine(sum+last_sum);
		}
	}
}

