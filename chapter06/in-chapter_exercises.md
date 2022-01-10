# Chapter 6 - In-chapter exercises
</br>

## 6.5 Exercises: Eq Instances (p.178-179)
```haskell
-- 1
data TisAnInteger = TisAn Integer
instance Eq TisAnInteger where 
      (==) (TisAn x) (TisAn x') = x == x'
-- 2
data TwoIntegers = Two Integer Integer
instance Eq TwoIntegers where
      (==) (Two x y) (Two x' y') = x == x' && y == y'
-- 3
data StringOrInt = TisAnInt Int | TisAString String
instance Eq StringOrInt where
      (==) (TisAnInt x) (TisAnInt x')       = x == x'
      (==) (TisAString xs) (TisAString xs') = xs == xs'
      (==) _ _                              = False
-- 4
data Pair a = Pair a a
instance Eq a => Eq (Pair a) where
      (==) (Pair x y) (Pair x' y') = x == x' && y == y'
-- 5
data Tuple a b = Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
      (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'
-- 6
data Which a = ThisOne a | ThatOne a
instance Eq a => Eq (Which a) where
      (==) (ThisOne x) (ThisOne x') = x == x'
      (==) (ThatOne x) (ThatOne x') = x == x'
      (==) (ThisOne x) (ThatOne x') = x == x'
      (==) (ThatOne x) (ThisOne x') = x == x'
-- 7
data EitherOr a b = Hello a | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
      (==) (Hello x) (Hello x')     = x == x'
      (==) (Goodbye x) (Goodbye x') = x == x'
      (==) _ _                      = False
```

</br>

## 


</br>

## 5.5 Exercises: Parametricity (p.140)

