# Chapter 8 - End-chapter exercises
</br>

## Review of types
1. d)
2. b)
3. d)
4. b)

<br/>

## Reviewing currying
1. `appedCatty "woohoo!"` -> `woops mrow woohoo!`
2. `frappe "1"` -> `1 mrow haha`
3. `frappe (appedCatty "2")` -> `"woops mrow 2 mrow haha"`
4. `appedCatty (frappe "blue")` -> `woops mrow blue mrow haha`
5. `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))` -> `pink mrow haha mrow green mrow woops mrow blue`
6. `cattyConny (flippy "Pugs" "are") "awesome"` -> `are mrow Pugs mrow awesome`

<br/>

## Recursion
```haskell
-- 1
dividedBy 15 2
go 15 2 0
go 13 2 1
go 11 2 2
go 9 2 3
go 7 2 4
go 5 2 5
go 3 2 6 
go 1 2 7
(7, 1)

-- 2
sumr :: (Eq a, Num a) => a -> a
sumr 0 = 0
sumr n = sumr (n-1) + n

-- 3
multr :: (Integral a) => a -> a -> a
multr n 1 = n
multr n c = multr n (c-1) + n
```

<br/>

## Fixing dividedBy
```haskell
data DividedResult = Result (Integer, Integer) | DividedByZero deriving Show

dividedBy' :: Integer -> Integer -> DividedResult
dividedBy' 0 _ = Result (0, 0)
dividedBy' _ 0 = DividedByZero
dividedBy' num denom = go absNum absDenom 0
   where sign = signum num * signum denom
         absNum = abs num
         absDenom = abs denom
         go n d count
          | n < d  = Result (count * sign, n)
          | otherwise = go (n - d) d (count + 1)
```

<br/>

## McCarthy 91 function
```haskell
mc91 :: Integral a => a -> a
mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 (mc91 (n + 11))
```

<br/>

## Numbers into words
```haskell
import Data.List (intercalate)

digitToWord :: Int -> String
digitToWord n = intercalate "-" $ map wordNumber $ digits n

digits :: Int -> [Int]
digits n
    | n < 10 = [n]
    | otherwise = digits (div n 10) ++ [mod n 10]

wordNumber :: Int -> String
wordNumber 0 = "zero"
wordNumber 1 = "one"
wordNumber 2 = "two"
wordNumber 3 = "three"
wordNumber 4 = "four"
wordNumber 5 = "five"
wordNumber 6 = "six"
wordNumber 7 = "seven"
wordNumber 8 = "eight"
wordNumber 9 = "nine"
wordNumber _ = ""
```