# Chapter 7 - End-chapter Exercises
</br>

## Multiple choice
1. d)
2. b)
3. d)
4. c)
5. a)

<br/>

## Let’s write code
```haskell
-- 1. a)
tensDigit' :: Integral a => a -> a
tensDigit' x = d
    where (xLast , _) = x `divMod` 10
          (_ , d)    = xLast `divMod` 10

-- 1. b) Yes
-- 1. c)
hunsD x = d
    where (xLast , _) = x `divMod` 100
          (_ , d)    = xLast `divMod` 10

-- 2
foldBool :: a -> a -> Bool -> a 
foldBool x y z =
    case z of
        True  -> y
        False -> x

foldBool' :: a -> a -> Bool -> a 
foldBool x y z
    | z = y
    | otherwise = x

-- 3
g :: (a -> b) -> (a, c) -> (b, c) 
g f (x, y) = (f x, y)

-- 4 & 5
module Arith4 where 

roundTrip :: (Show a, Read a) => a -> a 
roundTrip = read . show

main = do
    print (roundTrip 4) 
    print (id 4)

-- 6
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show

-- In the main function, change "print (roundTrip 4)"
-- to print (roundTrip 4 :: Int)
```
