# Chapter 9 - End-chapter exercises
</br>

## Data.Char
```haskell
-- 1
import Data.Char
import Data.Bool

:t isUpper
:t toUpper

-- 2
onlyUpper :: String -> String
onlyUpper = filter isUpper

-- 3
capFirst :: String -> String
capFirst [] = []
capFirst (x:xs) = toUpper x : xs

-- 4
allCaps :: String -> String
allCaps [] = []
allCaps (x:xs) = toUpper x : allCaps xs

-- 5
onlyFirstCap :: String -> Char
onlyFirstCap [] = ' '
onlyFirstCap xs = toUpper (head xs) 

-- 6
onlyFirstCap' :: String -> Char
onlyFirstCap' = toUpper . head 

```

</br>

</br>

## Ciphers
See file [cipher.hs](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter09/cipher.hs)

</br>

## Writing your own standard functions
```haskell
-- 1
myOr :: [Bool] -> Bool 
myOr [] = False 
myOr (x:xs) = x || myOr xs

-- 2
myAny :: (a -> Bool) -> [a] -> Bool 
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem z (x:xs) = z == x || myElem z xs 

myElem' :: Eq a => a -> [a] -> Bool
myElem' z xs = any (== z) xs 

-- 4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x] 

-- 5
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6
squishMap :: (a -> [b]) -> [a] -> [b] 
squishMap f = squishMap . map f

-- 7
squishAgain :: [[a]] -> [a] 
squishAgain = squishMap id

-- 8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f [x] = x
myMaximumBy f (x:xs) = 
    case f x x' of
        GT -> x
        EQ -> x
        LT -> x'
        where x' = myMaximumBy f xs

-- 9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f [x] = x
myMinimumBy f (x:xs) = 
    case f x x' of
        GT -> x'
        EQ -> x'
        LT -> x
        where x' = myMinimumBy f xs

-- 10
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare 

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
```
