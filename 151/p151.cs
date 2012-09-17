using System;
using System.Collections;	
namespace Application
{
	public class p151
	{
		public p151 ()
		{
		}
		static double Recurs(int[] papers, double chance, double ans, Hashtable h) 
		{
			if (papers[0] + papers[1] + papers[2] == 0 && papers[3] == 1) return ans; 
			if (h.Contains(papers)) {return (double)h[papers];}
			int totalPieces = papers[0] + papers[1] + papers[2] + papers[3]; 
			if (totalPieces == 1) ans += chance;
			for (int i = 0; i < 4; i++) 
			{
				if (papers[i] == 0) continue; 
				int[] newpap = (int[])papers.Clone(); 
				newpap[i]--; 
				for (int j = i + 1; j < 4; j++) 
					newpap[j]++; 
				ans = Recurs(newpap, chance * papers[i] / totalPieces, ans, h); 
			} 
			h.Add(papers, ans);
			return ans; 
		}
		public static void Main (string[] args)
		{	
			Console.Out.WriteLine("Start!");
			int[] papers = new int[4]; 
			papers[0] = papers[1] = papers[2] = papers[3] = 1; 
			Hashtable h = new Hashtable();
			double dd = Recurs(papers, 1, 0, h); 
			double ans = (int)dd + Math.Round(dd, 6); 
			Console.Out.WriteLine(ans);
		}
	}
}

