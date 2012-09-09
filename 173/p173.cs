using System;

namespace Crawler
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			int i, n, tot = 0;
			int fin = 1000000;
			for (n = 1; n < (fin/4); n++){
				i = 1;
				while (4*i*i+4*n*i<=fin)
				{
					tot+=1;
					i++;
				}
			}
			Console.WriteLine (tot);
		}
	}
}