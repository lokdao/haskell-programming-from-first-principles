# Chapter 7 - In-chapter exercises
</br>

## 7.3 Exercises: Grab Bag (p.224-225)
```haskell
-- 1. a, b, c, d
-- 2. d
-- 3. a)
addOneIfOdd n = case odd n of
      True -> f n
      False -> n
      where f n = (\x -> x + 1) n

-- 3. b)
addFive = \x -> \y -> (if x > y then y else x) + 5

-- 3. c)
mflip f x y = f y x
```

<br/>

## 7.4 Exercises: Variety Pack (p.235-236)
```haskell
-- 1
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2)) 
k3 = k (3, True)

-- 1. a -> k :: (a,b) -> a
-- 1. b -> k2 :: [Char], it is not the same type as k1 or k3
-- 1. c -> k3

-- 2
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (x, y ,z) (x', y', z') = ((x, x'), (z, z')) 
```

<br/>

## 7.5 Exercises: Case Practice (p.238-239)
```haskell
-- 1
functionC x y = 
    case (x > y) of
        True  -> x
        False -> y
-- 2
ifEvenAdd2 n = 
    case even n of
        True  -> n + 2
        False -> n

-- 3
nums x =
    case compare x 0 of
        LT -> -1 
        GT -> 1
        _  -> 0
```

<br/>

## 7.6 Exercises: Artful Dodgy (p.246-247)
Skipped as it does not require to produce any solution.

<br/>

## 7.7 Exercises: Guard Duty (p.252-253)
```haskell
-- 3. b)
pal xs 
    | xs == reverse xs = True
    | otherwise        = False

-- 6. c)
numbers x
    | x < 1 = -1
    | x == 0 = 0
    | x > 1 = 1
```
