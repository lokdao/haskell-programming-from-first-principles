# Chapter 7 - Notes
</br>

## Recap on Functions
- Functions are applied to arguments which binds their parameters to values
- A fully applied function with its arguments is evaluated to produce an output or result
- Higher Order Functions are functions that accept functions as arguments

<br/>

## Anonymous Functions
- Anonymous functions (aka **Lambda functions**) are nameless functions
- Lambda functions are most often used when a function is passed as an argument to a higher order function, and if this is the only place in one's code where such function will be used (i.e.: as an argument) 

**Example**
```haskell
-- Name function
addTwo :: Integer -> Integer
addTwo x = x + 2

-- Anonymous function declaration
(\x -> x + 2) :: Integer -> Integer

-- Usage of an anonymous function
-- Adding 1 to 2
(\x -> x + 2) 1
```

</br>

## Guards
- Guards provide another pattern enabling to decide between two or multiple values

```haskell
greeting :: [Char] -> [Char]
greeting xs 
    | xs == "Hello" = "How do you do?"
    | otherwise     = "Goodbye"
```

## Function composition
- Similar to its mathermatical equivalent, function composition in Haskell is a higher-order function that allows to combine functions, where the result of an applied function is passed to the next function as an argument
- Function composition uses the `.` operator

**Example**
```haskell
-- Sum a list then negate the result
negate . sum $ [1, 2, 3, 4, 5]

-- The $ operator is required, if it where not there, Haskell would attempt to evaluate as follows:
-- (1) negate . sum [1, 2, 3, 4, 5]
-- (2) negate . 15
-- the above line would clearly fail
```

## Pointfree style
- Pointfree style refers to composing functions without specifying the arguments
- Pointfree style allows to have more concise code

