# Chapter 9 - In-chapter exercises
</br>

## 9.5 Exercise: EnumFromTo (p.307-308)
```haskell
eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering -> Ordering -> [Ordering] 
eftOrd = eft

eftInt :: Int -> Int -> [Int] 
eftInt = eft

eftChar :: Char -> Char -> [Char] 
eftChar = eft

eft :: (Ord a, Enum a) => a -> a -> [a]
eft x y = 
    | x > y = []
    | x == y = [x]
    | otherwise = x : eft (succ x) y
```

</br>

## 9.6 Exercises: Thy Fearful Symmetry (p.311-312)
```haskell
-- 1 & 3
myWords :: String -> [String]
myWords [] = []
myWords xs = getWord xs : dropWord
    where getWord = takeWhile (/= ' ')
          dropWord = myWords (dropWhile (== ' ') (dropWhile (/= ' ') xs))

myWords' :: Char -> String -> [String]
myWords' _ [] = []
myWords' s xs = getWord xs : dropWord
    where getWord = takeWhile (/= s)
          dropWord = myWords' s (dropWhile (== s) (dropWhile (/= s) xs))

-- 2 & 3
module PoemLines where
firstSen = "Tyger Tyger, burning bright\n" 
secondSen = "In the forests of the night\n" 
thirdSen = "What immortal hand or eye\n" 
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: Char -> String -> [String] 
myLines _ [] = []
myLines s xs = getWord xs : dropWord
    where getWord = takeWhile (/= s)
          dropWord = myLines s (dropWhile (== s) (dropWhile (/= s) xs))

shouldEqual =
       [ "Tyger Tyger, burning bright"
       , "In the forests of the night"
       , "What immortal hand or eye"
       , "Could frame thy fearful symmetry?"
       ]

main :: IO ()
main = print $ "Are they equal? " ++ show (myLines '\n' sentences == shouldEqual)
```

</br>

## 9.7 Exercises: Square Cube (p.317-318)
```haskell
let mySqr = [x^2 | x <- [1..5]]
let myCube = [y^3 | y <- [1..5]]

-- 1
[(x, y) | x <- mySqr, y <- myCube]

-- 2
[(x, y) | x <- mySqr, y <- myCube, x < 50 && y < 50]

-- 3
length [(x, y) | x <- mySqr, y <- myCube, x < 50 && y < 50]
```

<br/>

## 9.8 Exercises: Bottom Madness (p.326-327)
### Will it blow up?
1. Bottom
2. Returns `[1]`
3. Bottom
4. Returns `3`
5. Bottom
6. Returns `2`
7. Bottom
8. Returns `1`
9. Returns `[1, 3]`
10. Bottom

### Intermission: Is it in normal form?
1. Weak Head Normal Form (WHNF) & Normal Form (NF)
2. WHNF
3. Neither
4. Neither
5. Neither
6. Neither
7. WHNF

</br>

## 9.9 Exercises: More Bottoms (p.333-334)
1. Bottom
2. Returns `[2]`
3. Bottom
4. Checks whether a list of strings contain vowels and returns a list of `Bool` 
5. Skipped as it does not require to produce any solution.
6. `map (\x -> bool x (-x) (x == 3)) [1..10]`

<br/>

## 9.10 Exercises: Filtering (p.336)
```haskell
-- 1
mult3 :: Num a => [a]
mult3 = [x | x <- [1..30], (x `mod` 3 == 0)]

mult3' :: Num a => [a]
mult3' = filter (\x -> x `mod` 3 == 0) [1..30]

-- 2
lenMult3 :: Num a => a
lenMult3 = length . filter (\x -> x `mod` 3 == 0) $ [1..30]

-- 3
myFilter :: String -> [String]
myFilter = filter (\x -> notElem x ["the", "a", "an"]) . words
```

<br/>

## 9.11 Zipping exercises (p.338)
```haskell
-- 1
myZip :: [a] -> [b] -> [(a, b)] 
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

-- 2
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

-- 3
myZip' :: [a] -> [b] -> [(a, b)] 
myZip' = 
```
