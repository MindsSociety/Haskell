# Types and Typeclasses

## Types

Haskell uses a strict type systems, i.e. it uses types like `Int`, `Float`,
`Double`, `Boolean`, `Char` etc.  but it is not like most languages.  Haskell
has the ability to infer the type of something based on what functions its used
in.  This allows for functions to become polymorphic automatically.

```Haskell
let x = 1     -- x is a number, it could be Int, Float or Double
print (x / 2) -- x is now a Double or Float since division is a function that
              -- returns a floating point number.  More on this later.
```

Haskell uses the `::` operator to represent types.  The function f where
`f :: Int -> Int` can be read as "a function f of type Int -> Int".  `::` can
also be used to explicitly give a type to something, but this is somewhat rare.

```Haskell
x = 1        -- x can be any number type.
y = 1 :: Int -- y is definitely an Int.
```

When writing Haskell code we like to give function types to go along with our
functions.  These are not necessary as Haskell will infer the type of a function
but it is always recommended to write one.  When defining a function
type definition we usually write the type above it.

```Haskell
-- | Checks if a given String or list is a Palindrome (same forward as back).
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs
```

### Infering types in ghci

In ghci, Haskell's interactive prompt, we can get the inferred type by using the
`:t` ghci operation.  Note:  In ghci, we need to use the `let` keyword to define
functions as it is in an interactive prompt (a Monadic interface).

```Haskell
Prelude> let isPalindrome xs = xs == reverse xs
Prelude> :t isPalindrome
isPalindrome :: Eq a => [a] -> Bool
```
### Arrow Notation

In the above example we use two different type of arrow notation, `=>` and `->`.
I tend to call them 'Fat Arrow' and 'Skinny Arrow' respectively. `->` is used
to separate the different parameters and return type.  In Haskell, every
function can only return one thing, no more, no less.  As such the last term in
the type definition is the return type.  All of the terms before the last `->` are the function parameters.

```Haskell
add :: Int -> Int -> Int   -- This is bad practice, usually functions should
add x y = x + y            -- be as generic as possible.
```

In the above example the function `add` has a type of `Int -> Int -> Int`,
This means `addInts` takes two `Int` values and returns an `Int` value.

The fat arrow `=>` is used to define type variables in functions.  This is where
we can substitute a **type variable** in place of a definite type in the
function definition.  Type variables can be constrained to one or more **Type
Classes**.  I tend to use `'a'` as a type variable to represent
'anything' but any lowercase word can be used.

```Haskell
add :: Num a => a -> a
add x y = x + y
```

In this case we use the `Num` typeclass, the `Num` typeclass contains any type
that can be used as a number.  (Anything you can add, subtract, multiply etc.)
By using the `Num` typeclass, this allows our function to work for any Number
type.  This includes `Int`, `Floats` etc. but also any data type that has an
instance of the `Num` typeclass such as `Vector`, `Matrix`, `Complex`

If we have more than one typeclass,  we list them in brackets, separated by
`,`.  For example:

```Haskell
factorial :: (Enum a, Num a) => a -> a
factorial n =  product [1..n]
```

Here we use the `Enum` and `Num` type class because the `product` function is of
type `product :: Num a => [a] -> a` and `..` is a function that works with
Enumarator types.
