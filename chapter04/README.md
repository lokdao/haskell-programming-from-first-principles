# Chapter 4 - Notes
</br>

## Types
Every value in Haskell has a type. A type allows to group a set of values that share some commonalities.

### Definition
- Type constructor is the name of the type, is always capitalized, and can take an argument
- Data constructors are the values within a type
```haskell
data Bool = False | True
-- "Bool" -> type constructor
-- "False | True" -> data constructors
```

</br>

## Numeric Types
- Integral numbers include `Int` (bounded, possess a max and min range) and `Integer` (unbounded)
  - `Int` can further be broken down into `Int8`, `Int16`, `Int32` and `Int64` 
- Fractional numbers include `Float`, `Double`, `Rational`, and `Scientific`

</br>

## Tuples
- Tuples can store values of different types, e.g. `("Hello", 1)`
- Tuples cannot store a single value; a tuple can either store nothing (`()` called unit) or at least a pair of values. 
