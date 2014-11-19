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

fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

primes :: [Integer]
primes = 2 : [x | x <- [3,5..],
  and [x `mod` y /= 0 | y <- takeWhile (<= squareRoot x) primes]]
