# Chapter 12 - End-chapter exercises
</br>

## Determine the kinds
1. Given `id :: a -> a`, the kind of `a` is `a :: *`
2. Given `r :: a -> f a`, the kind of `a :: *` is and the kind of `f` is `f :: * -> *` 

<br/>

## String processing
```haskell
import Data.Char

-- 1
notThe :: String -> Maybe String 
notThe xs 
    | xs == "the" = Nothing
    | otherwise = Just xs

replaceThe :: String -> String
replaceThe [] = []
replaceThe xs = unwords . change . map notThe . words $ xs
    where change (Nothing:ys) = "a" : change ys
          change (Just y:ys) = y : change ys
          change _ = []

-- 2
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = counting (words xs) 0
    where
        counting (x:xs:xss) c =
            if notThe x == Nothing && startsWithVowel xs
            then counting (xs:xss) c+1
            else counting (xs:xss) c
        counting _ c = c

-- 3
countVowels :: String -> Integer 
countVowels = sum . map isVowel
    where isVowel x 
            | toLower x `elem` "aeiou" = 1 
            | otherwise = 0
```

<br/>

## Validate the word
```haskell
newtype Word' = Word' String deriving (Eq, Show)
vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord xs = 
    if countVowels xs <= countConsonants xs
    then Just (Word' xs)
    else Nothing

countVowels :: String -> Integer 
countVowels = sum . map isVowel
    where isVowel x 
            | toLower x `elem` vowels = 1 
            | otherwise = 0

countConsonants :: String -> Integer
countConsonants = sum . map isCons
    where isCons x 
            | toLower x `elem` ['a'..'z'] 
                && notElem x vowels = 1
            | otherwise  = 0
```

<br/>

## It's only Natural
```haskell
data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer 
natToInteger (Succ x) = 1 + natToInteger x
natToInteger _ = 0

integerToNat :: Integer -> Maybe Nat 
integerToNat x
    | x >= 0 = Just (convertNat x)
    | otherwise = Nothing
    where 
        convertNat 0 = Zero
        convertNat x = Succ (convertNat (x - 1))
```

<br/>

## Small library for Maybe
```haskell
-- 1
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust (Just _) = True 

isNothing :: Maybe a -> Bool
isNothing Nothing  = True
isNothing (Just _) = False

-- 2
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee s _ Nothing = s
mayybee s f (Just x) = f x

-- 3
fromMaybe :: a -> Maybe a -> a
fromMaybe x = mayybee x id

-- 4
listToMaybe :: [a] -> Maybe a
listToMaybe (x:_) = Just x
listToMaybe _ = Nothing

maybeToList :: Maybe a -> [a]
maybeToList (Just x) = [x]
maybeToList _ = []

-- 5
catMaybes :: [Maybe a] -> [a]
catMaybes = concatMap maybeToList

-- 6
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs
    | any isNothing xs = Nothing
    | otherwise = Just (catMaybes xs)
```

<br/>

## Small library for Either
```haskell
-- 1
lefts' :: [Either a b] -> [a]
lefts' = foldr keepLeft []
    where
        keepLeft (Left x) xs = x : xs
        keepLeft _ xs = xs

-- 2
rights' :: [Either a b] -> [b]
rights' = foldr keepRight []
    where
        keepRight (Right x) xs = x : xs
        keepRight _ xs = xs 

-- 3
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs) 

-- 4
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right x) = Just (f x)

-- 5
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left x) = f x 
either' _ g (Right x) = g x

-- 6
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' _ (Left x) = Nothing 
eitherMaybe'' f (Right x) = Just (either' f f (Right x))

-- One liner
eitherMaybe''' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe''' f = either' (const Nothing) (Just . f) 
```

<br/>

## Write your own iterate and unfoldr
```haskell
-- 1
myIterate :: (a -> a) -> a -> [a] 
myIterate f x = [x] ++ myIterate f (f x)

-- or (better)
myIterate :: (a -> a) -> a -> [a] 
myIterate f x = x : myIterate f (f x)

-- 2
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a] 
myUnfoldr f x = 
    case val of
        Nothing -> []
        Just (a, b) -> [a] ++ myUnfoldr f b
    where val = f x

-- 3
betterIterate :: (a -> a) -> a -> [a] 
betterIterate f = myUnfoldr func
    where func = \x -> Just (x, f x)
```

<br/>

## Finally something other than a list!
```haskell
-- 1
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) 
    deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b 
unfold f x = 
    case f x of
        Nothing      -> Leaf
        Just (x,y,z) -> Node (unfold f x) y (unfold f z)

-- 2
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (func n) 0
    where func n x =
            if x == n 
            then Nothing
            else Just (x+1,x,x+1)
```