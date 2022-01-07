# Chapter 2 - Notes
</br>

## Key terms
- *Expression*: An expression can be a value, a combination of values or a function
- *Value*: an expression that is in irreducible form.

```haskell
# Expression - examples
1 + 1
x = x + 1

# Value - example
2
```

</br>

## Functions
**A function is an expression which is applied to a single argument and always returns a result.**

- Functions in Haskell are applied to a **SINGLE argument**. While we may see **multiple arguments** passed to a function, behind the scenes there is a **series of nested functions** that are applied to a single argument.
- Functions in Haskell use a **nonstrict evaluation** (aka "lazy evaluation"), meaning that expressions are not reduced to their simplest forms until forced by other terms referring to them. Instead, **functions evaluate expressions to weak head normal form (WHNF) by default.**
``` haskell
# Anonymous function that takes "2" as an input and returns a tuple
(\f -> (1, 2 + f)) 2
# reduces to the following in WHNF
(1, 2 + 2)
# instead of
(1, 4)
```

</br>

## Associativity & Precedence
Operators and functions have a default associativity and precedence.
```haskell
# Checking the associativity and precedence of the * operator
:info (*)
infixl 7 *

:info (^)
infixr  8
```

- `infixl` indicates that it is an infix operator, with "l" indicating it is left associative 
- `7` indicates the precedence on a scale from 0-9, with the higher number being applied first
- `infixr` indicates that it is an infix operator, with "r" indicating it is right associative 

```haskell
2 * 3 * 4
# is evaluated as
(2 * 3) * 4

# while
2 ^ 3 ^ 4
# is evaluated as
2 ^ (3 ^ 4)
```

</br>

## Let and Where
`let` introduces an expression meaning it can be used wherever you can have an expression, while `where` is a declaration. 

**Example - let**
```haskell
printInc n = let plusTwo = n + 2
             in print plusTwo 
```

**Example - where**
```haskell
printInc n = print plusTwo
    where plusTwo = n + 2
```