# Chapter 8 - Notes

</br>

## Recursion
- Enables a function to call itself
- Always ensure there is a base case, other the function may call itself indefinitely

<br/>

## Bottom
- ⊥ or bottom refers to computations that do not successfully result in a value
- The two main varieties of bottom are (i)computations that failed with an error; and (ii) those that failed to terminate

## Go function
- This allows to define another function in a where-clause
- The newly defined function can accept more arguments than the top-level one
- Potentially very useful to use / return a counter

```haskell
dividedBy :: Integral a => a -> a -> (a, a) 
dividedBy num denom = go num denom 0
    where go n d count
        | n < d = (count, n)
        | otherwise = go (n - d) d (count + 1)
```