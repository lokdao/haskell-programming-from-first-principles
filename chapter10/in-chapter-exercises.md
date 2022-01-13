# Chapter 10 - In-chapter exercises
</br>

## 10.5 Exercise: EnumFromTo (p.365-367)
1. b) and c)
2. Evaluation steps of `foldl (flip (*)) 1 [1..3]`
```haskell
((flip (*)) ((flip (*)) ((flip (*)) 1 1) 2) 3)
((flip (*)) ((flip (*)) 1 2) 3)
((flip (*)) 2 3)
6
```
3. c)
4. a)

```haskell
-- 5. a)
foldr (++) "" ["woot", "WOOT", "woot"]

-- 5. b)
foldr max 'a' "fear is the little death"

-- 5. c)
foldr (&&) True [False, True]

-- 5. d)
-- It will always return True

-- 5. e)
foldr ((++) . show) "" [1..5]

-- 5. f)
foldr (flip const) 'a' [1..5]

-- 5. g)
foldr (flip const) 0 "tacos"

-- 5. h)
foldl (const) 0 "burritos"

-- 5. i)
foldl (const) 'z' [1..5]
```

<br/>

## 10.6 Exercises: Database Processing (p.371-373)
```haskell
import Data.Time

theDatabase :: [DatabaseItem] 
theDatabase =
    [DbDate (UTCTime
    (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
    ,DbNumber 9001
    ,DbString "Hello, world!"
    ,DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
    ]

-- 1. Write a function that filters for DbDate values and returns a list
-- of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr utcTimes []
    where utcTimes (DbDate x) y = x : y
          utcTimes _ y = y

-- 2. Write a function that filters for DbNumber values and returns a list
-- of the Integer values inside them.
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr numbers []
    where numbers (DbNumber x) y = x : y
          numbers _ y = y

-- 3. Write a function that gets the most recent date.
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = foldr maxDate (UTCTime (ModifiedJulianDay 0) 0)
    where maxDate (DbDate d) md = max d md
          maxDate _          md = md

-- 4. Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = foldr sumNum 0
where sumNum (DbNumber n) sn = n + sn
      sumNum _            sn = sn

-- 5. Write a function that gets the average of the DbNumber values.
avgDb :: [DatabaseItem] -> Double
avgDb xs = fromIntegral (sumDb xs) / fromIntegral (length $ filterDbNumber xs)
```

<br/>

## Scans Exercises (p.379)
```haskell
fibs = 1 : scanl (+) 1 fibs 
fibsN x = fibs !! x

-- 1
fibs20 = take 20 fibs

-- 2
fibsLow100 = takeWhile (<100) fibs

-- 3
-- Original factorial
factorial :: (Eq p, Num p) => p -> p
factorial 1 = 1
factorial n = n * factorial (n-1)

-- Revamped factorial with scanl
factorial' :: [Integer]
factorial' = scanl (*) 1 [1..] 

getFactorial :: Int -> Integer
getFactorial n = factorial' !! n 
```