# Chapter 11 - Notes

</br>

## Types
- A type can be thought of as an enumeration of constructors that have zero or more arguments
- In Haskell, types can be:
  - sum types
  - product types
  - product types with record syntax
  - type aliases
  - newtype
- Arity refers to the number of arguments a function takes. A function that takes no argument is called a "nullary function"

<br/>

## Type constructor vs Data constructor
* **Type constructor**  are used at the type-level, in type-signatures and typeclass declarations / instances; they get resolved at compile-time
* **Data constructor** are used at the term level, and represent values one can interact with at runtime
* Both type and data constructor can take 0 or multiple arguments

```haskell
-- Example
data Dog = Dog'
--   [1]   [2]
-- [1] is a type constructor, taking no arguments (called a nullary constructor or type constant)
-- [1] is a data constructor and is a constant value since it also takes no arguments

data Dog a = Dog' a
--  In this example, both type and data constructors take an argument
```

<br/>

## Cardinality
- Cardinality of a sum data type is defined by adding the cardinalities of the data constructors
- Cardinality of a product data type is defined by multiplying the cardinalities of the data constructors

```haskell
data Bool = True | False
-- the cardinality of Bool data type is 2
-- given True has a cardinality of 1, and so does False
-- the total set of possible values = [True, False]

data ThreeBool = DefinitelyTrue | DefinitelyFalse | Both deriving (Eq, Show)
data MyNewBool = MyNewBool ThreeBool ThreeBool deriving (Eq, Show)
-- the cardinality of MyNewBool is 9
-- given the possible values for MyNewBool could be:
-- MyNewBool DefinitelyTrue DefinitelyTrue
-- MyNewBool DefinitelyTrue DefinitelyFalse
-- MyNewBool DefinitelyTrue Both
-- etc
```

- The function type is exponential and defines the number of inhabitans in a function
- For any given function ```a -> b```, its inhabitants can be calculated according to the formula ```b^a```

**For example:**

- The function ```myFunc :: Bool -> Bool``` has for inhabitants ```2^2 = 4```
- The function ```myFunc :: a -> b -> c``` has for inhabitants (c^b)^a; equivalent to c^(b * a)

<br/> 

## Records
- Records are product types which provide "built-in" accessors to fields within the record (instead of having to define those ourselves)

```haskell
data Person = 
    Person { name :: String
           , age  :: Int
           } deriving (Eq, Show)

-- we can now use a function "name" and "age" to retrieve the values within a Person
name (Person "John" 55)
-- will return "John"
```

<br/>

## As-patterns
- As-patterns allow to pattern match on some elements will still retaining the entire original value

```haskell
-- Pattern matching on a tuple item will retaining the full tuple
-- We create a bind variable named 't' will refers to the full tuple
-- The code below will print
-- 1 AND (1,2)
tupleMania :: Show a => (a, b) -> IO (a, b) 
tupleMania t@(a, _) = do
    print a
    return t
```