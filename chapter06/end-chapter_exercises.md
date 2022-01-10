# Chapter 6 - End-chapter Exercises
</br>

## Multiple choice
- 1 c)
- 2 b)
- 3 a)
- 4 c)
- 5 a)

<br/>

## Does it typecheck?

```haskell
-- 1
-- Fixed code by instanciating the Show typeclass
data Person = Person Bool
instance Show Person where
      show (Person x) = show x

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2 & 3
-- Fixed code by deriving the Eq typeclass
data Mood = Blah | Woot 
   deriving (Show, Eq)

settleDown x = if x == Woot then Blah else x

-- 4
type Subject = String
type Verb = String
type Object = String

data Sentence = 
      Sentence Subject Verb Object
      deriving (Show, Eq)

-- s1 does not work since it is missing an Object
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
```

<br/>

## Given a datatype declaration, what can we do?

Provided code:

```haskell
data Rocks = Rocks String deriving (Eq, Show, Ord)
data Yeah = Yeah Bool deriving (Eq, Show, Ord)
data Papu = Papu Rocks Yeah deriving (Eq, Show, Ord)
```

1. Does not typecheck, 2nd and 3rd argument should be of type `Rocks` and `Yeah` respectively
2. OK
3. OK
4. OK

<br/>

## Match the types
Skipped as it does not require to produce any solution.

<br/>

## Type-Kwon-Do Two: Electric Typealoo
```haskell
-- 1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f x y = f x == y

-- 2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f n x = fromIntegral n + f x
```