module Test where



import Data.Ord
import Data.Char

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

sortBy :: (a -> a -> Ordering) -> [a] -> [a]
sortBy _ [] = []
sortBy f (x:xs) = sortBy f [y | y <- xs, f y x == LT || f y x == EQ] ++ [x] 
	++ sortBy f [y | y <- xs, f y x == GT]


isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

add :: Num a => a -> a -> a
add x y = x + y

main = print $ sortBy (comparing (sum . map ord)) ["hello", "hi", "bananas"]