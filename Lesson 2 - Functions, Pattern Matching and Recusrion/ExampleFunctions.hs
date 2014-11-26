factorial :: (Enum a, Num a) => a -> a
factorial n =  product [1..n]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

chose :: Integral a => a -> a -> a
chose n r = factorial n `div` factorial r * factorial (n-r)

collatz :: Integral a => a -> [a]
collatz 1 = [1]
collatz x
    | even x = x : collatz (x `div` 2)
    | odd x  = x : collatz ((x * 3) + 1)

-- | Bad recursive definition, very slow
fib1 :: (Eq a, Integral a) => a -> a
fib1 0 = 0
fib1 1 = 1
fib1 n = fib (n-1) + fib (n-2) 

-- | Tail recursive version (stolen from Barak)
fib2 :: Intagral a => a -> a
fib2 0 = 1
fib2 n = fibTail 1 1 1 n
	where fibTail i fi fim1 n | i < n = fibTail (i+1) (fi + fim1) fi n
	                          | otherwise = fi

fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

primes :: [Integer]
primes = 2 : [x | x <- [3,5..],
  and [x `mod` y /= 0 | y <- takeWhile (<= squareRoot x) primes]]

squareRoot :: Integral a => a -> a
squareRoot = floor . sqrt . fromIntegral