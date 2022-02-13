# Chapter 12 - Notes

</br>

## Maybe data type
- `Maybe` can be used to make "smarter" functions by catching potential errors

**For example:**
```haskell
-- Representing a person with 2 attributes
type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

-- If invalid parameters are passed (e.g.: blank name and/or negative age)
-- the code below creates a "default" person
mkPerson :: Name -> Age -> Person
mkPerson name age
    | name /= "" && age >= 0 = Person name age
    | otherwise = Person "error" -1

-- with Maybe, we can just return "Nothing" 
-- to signal something went wrong
mkPerson' :: Name -> Age -> Maybe Person
mkPerson' name age 
    | name /= "" && age >= 0 = Just $ Person name age
    | otherwise = Nothing
```

<br/>

## Either data type
- `Either` can provide more expresiveness when catching potential errors
- `Either` can return either a `Left` or `Right` value, and by convention, `Left` is issued to return the error

```haskell
-- Building on the example above, we can use Either
-- to indicate which value (name or age) caused an error
data PersonInvalid = NameEmpty | AgeTooLow deriving (Show, Eq)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age 
    | name /= "" && age >= 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | otherwise  = Left AgeTooLow

-- The code above however would only show "NameEmpty"
-- even if both name and age were invalid
-- to remedy that, we can use the code below

type ValidateInfo a = Either [PersonInvalid] a

ageOkay :: Age -> ValidateInfo Age
ageOkay age = if age >= 0 then Right age else Left [AgeTooLow]

nameOkay :: Name -> ValidateInfo Name
nameOkay name = if name /= "" then Right name else Left [NameEmpty]

mkPerson' :: Name -> Age -> ValidateInfo Person
mkPerson' name age = mkPersonCheck (nameOkay name) (ageOkay age)

mkPersonCheck :: ValidateInfo Name -> ValidateInfo Age -> ValidateInfo Person
mkPersonCheck (Right name) (Right age) = Right $ Person name age
mkPersonCheck (Left name) (Left age) = Left $ name ++ age 
mkPersonCheck _ (Left age)  = Left age
mkPersonCheck (Left name) _ = Left name
```

<br/>

## Kinds
- Kinds are used to describe the type of type constructors
- **Type constants** are types that do not take any argument
- **Higher-kinded types** are types that take more types as arguments

```haskell
-- Examples
-- Type constants
-- These do not require any argument to be applied in order to become a type
-- They already are a type 
:k Int
Int :: *

:k Char
Char :: *

-- Type constructor
-- This type requires an argument (or more) to be applied in order to become a type
data Example a = Foo | Bar a
:k Example
Example :: * -> * 

-- Tuple type constructor
-- requires 2 arguments to be come a type
:k (,)
(,) :: * -> * -> *
```

<br/>

## Lifted and unlifted types
- **Lifted types can be inhabited by bottom** and include most data types in haskell (including the ones that we can define ourselves)
- **Unlifted types** are any type that **cannot be inhabited by bottom** and generally include native machine types and raw pointers

```haskell
-- Examples of type application
:k Maybe
Maybe :: * -> *

-- Since maybe requires a type before it can be fully applied
-- the code below would not work
Maybe Maybe

-- However, this one would work
-- Since the kind of Maybe Char becomes *
-- it can then be applied to the first Maybe
Maybe (Maybe Char)
:k Maybe (Maybe Char)
Maybe (Maybe Char) :: * 
```