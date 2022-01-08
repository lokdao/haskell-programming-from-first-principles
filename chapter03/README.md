# Chapter 3 - Notes
</br>

## Types
Strings in Haskell are a type synonym and are equivalent to a list of char.
```haskell
:t "A string"
"A string" :: [Char]
```

</br>

## Functions & Operations
### Concatenation
Concatenating can be done using:
- the operator `++`
- the function `concat`

However, the types must be the same.
```haskell
-- Works fine
"hello" ++ " world!"
concat ["hello", " ", "world!"]

-- Does not work
"hello" ++ [1, 2, 3]
concat ["hello", [1,2,3]]
```

### Additional operations
- Cons operator `(:)` builds a list *(reminder: a string is a list of char)*
- `head` returns the first element a list
- `tail` returns everything but the first element of a list
- `take` returns the specified number of elements from a list
- `drop` returns the remainder of a list after removing the specified number of elements
- `!!` returns a single element of a list that is in the specified position

```haskell
'h' : "ello"
-- returns "hello"

head "hello"
-- returns "h"

tail "hello"
-- returns "ello"

take 2 "hello"
-- returns "he"

drop 2 "hello"
-- returns "llo"

(!!) "hello" !! 1
-- returns "e"

```