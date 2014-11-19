# Function, Pattern Matching and Recursion

## Functions

Functions are defined at the top level.  Haskell uses spaces to separate
function parameters rather than brackets.

```Haskell
addOne x = x + 1
```

This function will return a number (x + 1) given any input x.

### Function Types

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
the type definition is the return type.  All of the terms before the last `->`
are the function parameters.

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

## Pattern Matching

Haskell will treat multiple functions with the same name as different patterns
for a function to follow.  If we know a definite answer for a given input, we
can define a pattern for it.  For example if we try to divide by 0 we should get
an error.  The function below defines the inverse function, `λ x -> 1 / x`, for
any given number `x` the function should return `1 / x`, unless `x == 0`.

```Haskell
inverse 0 = error "Divide by zero"
inverse x = 1 / x
```
