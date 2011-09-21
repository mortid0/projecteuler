module Main where

myReverse n = read ((reverse.show) n)::Integer

isLychrel n = testLychrel n 1

testLychrel n 50 = True
testLychrel n k = if rev == n
						then False
						else testLychrel (n+rev) (k+1) 
				where rev = myReverse n

p55 = filter (\x -> isLychrel x) [1..10000]

main :: IO ()
main = do
	(putStrLn.show) (isLychrel 4994)
	(putStrLn.show) (isLychrel 349)
	(putStrLn.show) (length p55)
