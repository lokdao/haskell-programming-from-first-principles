# Chapter 5 - End-chapter Exercises
</br>

## Multiple choice
1. c
2. a
3. b
4. c

</br>


## Determine the type
*Suggest to add code `{-# LANGUAGE NoMonomorphismRestriction #-}` in Haskell file prior to doing the exercises below*

**1**
- a) `54`, `Num a => a`
- b) `(0, "doge")`, `Num a => (a, [Char])`
- c) `(0, "doge)`, `(Integer, [Char])` 
- d) `True`, `Bool`
- e) `5`, `Int`
- f) `False`, `Bool`

**2** 
- `Num a => a`

**3** 
- `Num a => a -> a`

**4** 
- `Fractional a => a`

**5** 
- `[Char]`

<br/>

## Does it compile?
```haskell
-- 1
bigNum = (^) 5
wahoo = bigNum $ 10

-- 2 OK
-- 3 
a = (+) 
b = 5
c = a b 10 
d = a c 200

-- 4
a' = 12 + b
b' = 10000 * c
c' = 1
```

<br/>

## Type variable or specific type constructor?
```haskell
-- 2
-- f :: zed -> Zed -> Blah
-- fully polymorphic -> concrete -> concrete

-- 3
-- f :: Enum b => a -> b -> C
-- fully polymorphic -> constrained -> concrete

-- 4
-- f :: f -> g -> C
-- fully polymorphic -> fully polymorphic -> concrete
```

<br/>

## Write a type signature
```haskell
-- 1
functionH :: [a] -> a
functionH (x:_) = x

-- 2
functionC :: (Eq a, Ord a) => a -> a -> Bool
functionC x y =
     if (x > y) then True else False

-- 3
functionS :: (a, b) -> b
functionS (x, y) = y
```

<br/>

## Given a type, write the function
```haskell
-- 1
i :: a -> a
i x = x

-- 2
c :: a -> b -> a 
c x _ = x

-- 3
c'' :: b -> a -> b 
c'' x _ = x

-- 4
c' :: a -> b -> b 
c' _ y = y

-- 5
r :: [a] -> [a] 
r x = x

r' :: [a] -> [a]
r' = tail

-- 6
co :: (b -> c) -> (a -> b) -> a -> c 
co f g x = f . g $ x

-- 7
a :: (a -> c) -> a -> a
a f x = x

-- 8
a' :: (a -> b) -> a -> b 
a' f x = f x
```

<br/>

## Fix it

```haskell
module Sing where

-- 1
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"

-- 2
sing' = if (x < y) then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"

-- 3
main :: IO () 
main = do
    print (1 + 2)
    putStrLn "10"
    print (negate (-1))
    print ((+) 0 blah) 
    where blah = negate 1
```

</br>

## Type Kwon-Do
```haskell
-- 1
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = g . f

-- 2
data A 
data B 
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q

-- 3
data X 
data Y 
data Z

xz :: X -> Z 
xz = undefined

yz :: Y -> Z 
yz = undefined

xform :: (X, Y) -> (Z, Z) 
xform (x, y) = (xz x, yz y)

-- 4
munge :: (x -> y) -> (y -> (w, z)) -> x -> w 
munge g f x = fst (f . g $ x)
```