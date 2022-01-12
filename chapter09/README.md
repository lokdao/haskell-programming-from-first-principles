# Chapter 9 - Notes

</br>

## Lists
- Lists can contain a finite or infinite series of values
- `[]` is a type constructor for lists and takes no arguments; it also repreents an empty list
- `:` (aka cons or construct) is another type constructor for lists; cons is an infix operator

```haskell
[1, 2, 3 ]
-- can also be written as
1 : 2 : 3 : []
-- but also as
1 : (2 : (3 : []))
```

<br/>

## List comprehensions
- List comprehensions enable the generation of new lists based on one or multiple lists
- List comprehensions require at least one input list (aka a generator) and can have predicates to manipulate elements within the generator
- If there is more than one generator, the rightmost generator will be exhausted first; meaning that if those were nested-loops, the leftmost is the outer loop while the rightmost is the inner loop

```haskell
-- Simple list comprehension
-- where only even numbers are squared
[x^2 | x <- [1..10], even x]
-- Output: [4,16,36,64,100]

-- List comprehension using 2 generators
[(x, y) | x <- [1, 2, 3], y <- [5, 6]]
-- Output: [(1,5), (1,6), (2,5), (2,6), (3,5), (3,6)]

```

<br/>

## Spines and nonstrict evaluation
- Data structures such as lists, sequences and trees have a spine
- A spine is represented by the cons operator `:` and is what "ties" values together; and said values live in "cons cells"
- Thanks to this structure and how nonstrict evaluation works, we can do the following
  - only the spine of a list can be evaluated, without evaluating the values within each cell
  - cons cells can be evaluated without evaluating the values within
  - only part of the spine can be evaluated
- **Evaluating** a list proceeds **down** the spine, while **constructing** a list proceeds **up** the spine

**Representation of a spine**
```haskell
     : <------| 
    / \       |
   _   : <----| This is the "spine"
      / \     |
     _   : <--|
        / \
       _  []

```

**Examples**

- Using the keyword `:sprint` (it has some quirks though) in GHC allows us to print variables and see what has already been evaluated.

```haskell
let letters = enumFromTo 'a' 'z'
:sprint letters
-- Output: letters = _
-- This shows that "letters" have not been evaluated yet 
```

- `length` is only strict in the spine, meaning it only evaluate the spine and not the values within the cons cells.
```haskell
length [1, 2, undefined, 4]
-- Output: 4
```
- Why does the above code work? Although we had an `undefined` value, given `length` ONLY counts how many cons cells there are and does NOT look at each value, the operation succeeds. 