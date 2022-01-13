# Chapter 10 - Notes

</br>

## Folding
- The concept of folding is also called **catamorphism**, and is a mean to deconstruct data
- Compared to mapping a list, where `map` applies a function to each cons cell value, a **fold** will instead replace cons constructor with the function and reduces the list

### Fold left vs Fold right
- Both folds recurse over the spine in the same direction
- The difference comes in the associatition / parenthesization of the function

```haskell
-- foldr will return 1 
foldr (-) 1 [1,2,3]
-- decomposition
1 - (2 - (3 - 1))
1 - (2 - 2)
1 - 0
1

-- foldl will return -5
foldl (-) 1 [1,2,3]
-- decomposition
((1 - 1) - 2) - 3
(0 - 2) - 3
-2 - 3 
```

- Another difference is  that `foldl` is generally less appropriate than `foldr` when it comes to manipulating long or potentially infinite lists

```haskell
-- The below code will return "5"
foldr (\ _ _ -> 5) 0 ([1..5] ++ undefined)

-- whereas here it will return an error
foldl (\ _ _ -> 5) 0 ([1..5] ++ undefined)
```

- When writing fold functions, one should think about
  - the start value (which also serves as a fallback value if the list is empty)
  - the remaining two arguments, one being the element of the list, while the other is either the accumulated value or the start value
    - `foldl` uses an accumulator
    - `foldr` uses a start value

```haskell
-- Defintion
-- foldr
foldr :: (a -> b -> b) -> b -> [a] -> b 
foldr f z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

-- foldl
foldl :: (b -> a -> b) -> b -> [a] -> b 
foldl f acc [] = acc
foldl f acc (x:xs) = foldl f (f acc x) xs
```
