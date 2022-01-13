# Chapter 10 - End-chapter exercises

</br>

## Warm-up and review
```haskell
-- 1
stops  = "pbtdkg"
vowels = "aeiou"
-- 1.a)
threeWords :: [(Char, Char, Char)]
threeWords = [(x,y,z) | x <- stops, y <- vowels, z <- stops]

-- 1.b)
threeWords' :: [(Char, Char, Char)]
threeWords' = [(x,y,z) | x <- stops, x == 'p', y <- vowels, z <- stops]

-- 1.c)
nouns = ["carrot", "person", "dog"] 
verbs = ["eat", "drink", "sleep"]

sentences = [(x, y , z) | x <- nouns, y <- verbs, z <- nouns]

-- 2
-- Calculats the average word length in a given sentence
seekritFunc x = div (sum (map length (words x)))
                     (length (words x))

-- 3
seekritFunc' x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))
```

<br/>

## Rewriting functions using folds
```haskell
-- 1
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (||) False . map f

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr (\a b -> b || a == x) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x)

-- 4
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b -> if f a then a : b else b) []

-- 7
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) .f) []

-- 9
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = undefined
myMaximumBy f (x:xs) = foldl (\a b -> if f a b == GT then a else b) x xs

-- 11
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x:xs) = foldl (\a b -> if f a b == LT then a else b) x xs
```