# Chapter 5 - Notes
</br>

## Types
- Typing in Haskell is static, and **typechecking occurs at compile time**.

### Typeclass constraints
- Parameters in a function can be constrained by a specific typeclass, but their type can be polymorphic.

```haskell
f :: Eq a => a -> a
-- The function f can only accept an argument which is an instance of the Equal typeclass, but that argument can be of any type (i.e.: a String, an Int, a Bool, etc) 
```

### Function's type constructor
- (->) is the type constructor for functions
- (->) takes arguments but has no data constructors

</br>

## Currying
- Currying refers to the nesting of multiple functions, where each function accepts a single argument and returns one result
- Currying makes it look like a function can accept multiple arguments
- For instance, a function having 2 arguments will:
  1. apply the first argument;
  2. return the result as a function;
  3. apply the second argument to the function; and
  4. return the final result

### Uncurrying 
- Functions are curried by default but can be uncurried
- Uncurrying is equivalent to replacing the functions with a tuple
- For instance, uncurrying the (+) function:
  - `Num a => a -> a -> a` becomes `Num a => (a, a) -> a`

### Partial application & Sectioning
- Currying allows for functions to be partially applied
- Sectioning allows to choose whether the partial application of an infix operator is performed on the first or second argument provided

```haskell
x = 5
y = (2^)
z = (^2)

-- this will return 32
y x 

-- this will return 25
z x
```

</br>

## Polymorphism
- Type signatures can fall into one of 2 categories: parametric polymorphism and constrained polymorphism
  - **Parametric polymorphism** = parameters that are unconstrained and can be of any type
  - **Constraint polymorphism** = parameters are constrained by one or multiple typeclasses
- A function making use of parametric polymorphism tends to be more limited than one using constraint polymorphism
