# Chapter 5 - In-chapter exercises
</br>

## 5.3 Exercises: Type Matching (p.125-126)

- (1.a., 2.c.) -> `not` , `_ :: Bool -> Bool`
- (1.b., 2.d.) -> `length`, `_ :: [a] -> Int`
- (1.c., 2.b.) -> `concat`, `_ :: [[a]] -> a`
- (1.d., 2.a.) -> `head`, `_ :: [a] -> a`
- (1.e., 2.e.) -> `(<)`, `_ :: Ord a => a -> a -> Bool`

</br>

## 5.4 Exercises: Type Arguments (p.134-137)

| Solution | Type | Application | New Type |
| ---- | ---- | ---- | ---- |
| 1.a. | `f :: a -> a -> a -> a` | `f x` (where x is of type `Char`) | `f :: Char -> Char -> Char`  |
| 2.d. | `g :: a -> b -> c -> b` | `g 0 'c' "woot"` | `Char` |
| 3.d. | `h :: (Num a, Num b) => a -> b -> b` | `h 1.0 2` | `Numb b => b` |
| 4.c. | `h :: (Num a, Num b) => a -> b -> b` | `h 1 (5.5 :: Double)` | `Double` |
| 5.a. | `jackal (Ord a, Eq b) => a -> b -> a` | `jackal "keyboard" "has the word jackal in it"` | `[Char]` |
| 6.e. | `jackal (Ord a, Eq b) => a -> b -> a` | `jackal "keyboard"` | `Eq b => b -> [Char]` |
| 7.d. | `kessel :: (Ord a, Num b) => a -> b -> a` | `kessel 1 2` | `(Ord a, Num a) => a` |
| 8.a. | `kessel :: (Ord a, Num b) => a -> b -> a` | `kessel 1 (2 :: Integer)` | `(Ord a, Num a) => a` |
| 9.c. | `kessel :: (Ord a, Num b) => a -> b -> a` | `kessel (1 :: Integer) 2` | `Integer` |

</br>

## 5.5 Exercises: Parametricity (p.140)
1. Nothing to do here...
2. & 3. See below.

```haskell
-- 2
f2 :: a -> a -> a
f2 x _ = x

f2' :: a -> a -> a
f2' _ y = y

-- 3
f3 :: a -> b -> b
f3 _ y = y
```
