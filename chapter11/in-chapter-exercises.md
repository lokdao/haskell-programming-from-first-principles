# Chapter 11 - In-chapter exercises
</br>

## 11.5 Exercises: Dog Types (p.396-397)
1. Doggies is a type constructor
2. `Doggies :: * -> *`
3. `Doggies String :: *`
4. `Husky 10 :: Num a => Doggies a`
5. `Husky (10 :: Integer) :: Doggies Integer`
6. `Mastiff "Scooby Doo" :: Doggies [Char]`
7. Both
8. `DogueDeBordeaux :: a -> DogueDeBordeaux a`
9. `DogueDeBordeaux "doggie" :: DogueDeBordeaux [Char]`

<br/>

## 11.6 Exercises: Vehicles (p.399-400)
```haskell
-- 1 
myCar :: Vehicle 

-- 2 
isCar :: Vehicle -> Bool 
isCar (Car _ _) = True 
isCar _ = False 

isPlane :: Vehicle -> Bool 
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool] 
areCars = map isCar

-- 3
getManu :: Vehicle -> Manufacturer 
getManu (Car x _) = x

-- Fixed to handle the case when Vehicle is not a Car
getManu' :: Vehicle -> Maybe Manufacturer 
getManu' (Car x _) = Just x
getManu' _ = Nothing

-- 4
-- The function will fail and return an error.

-- 5
data Size = Size Integer 
    deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size
    deriving (Eq, Show)

isPlane' :: Vehicle -> Bool 
isPlane' (Plane _ _) = True
isPlane' _ = False

```

<br/>

## 11.8 Exercises: Cardinality (p.404-405)
1. Cardinality = 1
2. Cardinality = 3
3. Cardinality = 65,536
4. `Integer` is unbounded whereas `Int` is bounded by the number of bits that can be stored within it
5. `Int8` = 2^8 = 256

<br/>

## 11.8 Exercises: For Example (p.405-406)
```haskell
-- 1
:t MakeExample
MakeExample :: Example
-- Requesting the type of Example fails, given it is not a data constructor, instead, we can display its kind by using
:k Example

-- 2
:i Example
-- It showcases the datatype definition, as well as a list of typeclass instances

-- 3
data Example' = MakeExample' Int deriving Show
:t MakeExample'
MakeExample' :: Int -> Example'
```

<br/>

## 11.9 Exercises: Logic Goats (p.410-411)
```haskell
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- 1
instance TooMany (Int, String) where
    tooMany (n, _) = tooMany n

-- 2
instance TooMany (Int, Int) where
    tooMany (x, y) = tooMany (x + y)

-- 3
instance (Num a, TooMany a) => TooMany (a,a) where
    tooMany (x, y) = tooMany x || tooMany y

```

<br/>

## 11.10 Exercises: Pity the Bool (p.412-413)
1. Cardinality is 4
2. Cardinality is 258. Warnings are displayed if we use an Int that is out of bounds

</br>

## 11.12 Exercises: How Does Your Garden Grow? (p.420)
```haskell
data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show
data Garden = Garden Gardener FlowerType
    deriving Show
type Gardener = String

-- 1
data Garden' = 
    Gardenia' Gardener
    | Daisy' Gardener
    | Rose' Gardener 
    | Lilac' Gardener
    deriving Show 
```

</br>

## 11.13 Exercise: Programmers (p.430-431)
```haskell
data OperatingSystem =
    GnuPlusLinux
    | OpenBSDPlusNevermindJustBSDStill | Mac
    | Windows deriving (Eq, Show)

data ProgLang =
      Haskell
    | Agda
    | Idris
    | PureScript deriving (Eq, Show)

data Programmer = 
    Programmer { os :: OperatingSystem
               , lang :: ProgLang } 
    deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem] 
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgLang] 
allLanguages = [Haskell, Agda, Idris, PureScript]

-- Solution
allProgrammers :: [Programmer]
allProgrammers = [Programmer x y | x <- allOperatingSystems, y <- allLanguages]
```

<br/>

## 11.14 Exercise: Exponentiation in what order? (p.440)
```haskell
data Quantum =
    Yes
| No
| Both
deriving (Eq, Show)

convert1 :: Quantum -> Bool
convert1 Yes  = Yes
convert1 No   = Yes
convert1 Both = Yes 

convert2 :: Quantum -> Bool
convert2 Yes  = Yes
convert2 No   = Yes
convert2 Both = No 

convert3 :: Quantum -> Bool
convert3 Yes  = Yes
convert3 No   = No
convert3 Both = Yes

convert4 :: Quantum -> Bool
convert4 Yes  = No
convert4 No   = Yes
convert4 Both = Yes

convert5 :: Quantum -> Bool
convert5 Yes  = No
convert5 No   = Yes
convert5 Both = No

convert6 :: Quantum -> Bool
convert6 Yes  = No
convert6 No   = No
convert6 Both = Yes

convert7 :: Quantum -> Bool
convert7 Yes  = No
convert7 No   = No
convert7 Both = No

convert8 :: Quantum -> Bool
convert8 Yes  = Yes
convert8 No   = No
convert8 Both = No
```

## 11.14 Exercise: The Quad (p.440-441)
```haskell
data Quad =
      One
    | Two
    | Three
    | Four
deriving (Eq, Show)

-- 1 
eQuad :: Either Quad Quad
eQuad = undefined
-- The function can take 8 (4+4) different forms

-- 2
prodQuad :: (Quad, Quad)
-- The function can take 16 (4*4) different forms

-- 3
funcQuad :: Quad -> Quad
-- The function can take 256 (4^4) different forms

-- 4
prodTBool :: (Bool, Bool, Bool)
-- The function can take 8 (2*2*2) different forms

-- 5
gTwo :: Bool -> Bool -> Bool
-- The function can take 16 (2^4) different forms

-- 6
fTwo :: Bool -> Quad -> Quad
-- The function can take 65,536 (2^16) different forms
```

<br/>

## 11.15 Exercises (p.448-450)
### Write map for BinaryTree
```haskell
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) = 
    Node (mapTree f left) (f a) (mapTree f right)
```
### Convert binary trees to lists
```haskell
preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = 
    [a] ++ preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = 
    preorder left ++ [a] ++ preorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = 
    preorder left ++ preorder right ++ [a]
```

### Write foldr for BinaryTree
``` haskell
foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b (Node left a right) = 
    let lb = foldTree f b left
        nb = f a lb
    in foldTree f nb right
```
