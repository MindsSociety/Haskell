Hello World in Haskell
This is a comment

Arbitrary function so this file wouldn't be only one line long.

> f :: Num a => a -> a
> f x = x + 1

Main function

> main = putStrLn $ "Hello, World! " ++ show (f 3)
