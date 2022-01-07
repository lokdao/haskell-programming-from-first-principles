# Chapter 2 - In-chapter exercises
</br>

## 2.5 Exercises: Comprehension Check (p.34-35)

</br>
1. Given the following lines of code as they might appear in a source file, how would you change them to use them directly in the REPL?

```haskell
half x = x / 2 
square x = x * x
```
**Solution**
```haskell
let half x = x / 2 
let square x = x * x
```

</br>
2. Write one function that has one parameter and works for all the following expressions. Be sure to name the function.

```haskell
3.14 * (5 * 5) 
3.14 * (10 * 10) 
3.14 * (2 * 2) 
3.14 * (4 * 4)
```
**Solution**
```haskell
let multPi x = 3.14 * (x^2)
```

</br>
3. There is a value in Prelude called pi. Rewrite your function to use pi instead of 3.14.

</br>

**Solution**
```haskell
let multPi x = pi * (x^2)
```

</br>

## 2.6 Exercises: Parentheses and Association (p.38-39)
Below are some pairs of functions that are alike except for parenthesization. Read them carefully and decide if the parentheses change the results of the function. Check your work in GHCi.
```haskell
-- 1.a. & 1.b.
8 + 7 * 9
(8 + 7) * 9
-- 2.a. & 2.b.
perimeter x y = (x * 2) + (y * 2)
perimeter x y = x * 2 + y * 2
-- 3.a. & 3.b.
f x = x / 2 + 9
f x = x / (2 + 9)
```

</br>

**Solution**
```haskell
-- 1.a. & 1.b. will have a different result
-- 2.a. & 2.b. will have the same result 
-- 3.a. & 3.b. will have a different result
```

</br>

## 2.7 Exercises: Heal the Sick (p.45)
The following code samples are broken and won’t compile. The first two are as you might enter into the REPL; the third is from a source file. Find the mistakes and fix them so that they will.
```haskell
let area x = 3. 14 * (x * x)
let double x = b * 2
x = 7
y = 10
f=x+y
```

</br>

**Solution**
```haskell
-- Removed space between 3 and 14
let area x = 3.14 * (x * x)
-- Renamed b to x
let double x = x * 2
-- Added parameter x and y in function f
x = 7
y = 10
f x y = x + y
```

</br>

## 2.10 Exercises: A Head Code (p.58-60)
Rewrite with where clauses:
```haskell
-- 1
let x = 3; y = 1000 in x * 3 + y
-- 2
let y = 10; x = 10 * 5 + y in x * 5
-- 3
let x = 7
    y = negate x
    z = y * 10 
in z / x + y
```

</br>

**Solution**
```haskell
-- 1
one = x * 3 + y
    where x = 3
          y = 1000
-- 2
two = x * 5
    where y = 10  
          x = 10 * 5 + y
-- 3
three = z / x + y
    where x = 7
          y = negate x
          z = y * 10
```