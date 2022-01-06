# Chapter 2 - In-chapter exercises

## 2.5 Exercises: Comprehension Check (p.34-35)

</br>
1. Given the following lines of code as they might appear in a source file, how would you change them to use them directly in the REPL?
```haskell
half x = x / 2 
square x = x * x
```

<br>

**Solution**
```haskell
let half x = x / 2 
let square x = x * x
```
</br>
</br>
2. Write one function that has one parameter and works for all the following expressions. Be sure to name the function.
```haskell
3.14 * (5 * 5) 
3.14 * (10 * 10) 
3.14 * (2 * 2) 
3.14 * (4 * 4)
```

</br>

**Solution**
```haskell
let multPi x = 3.14 * (x^2)
```
</br>
</br>
3. There is a value in Prelude called pi. Rewrite your function to use pi instead of 3.14.

</br>

**Solution**
```haskell
let multPi x = pi * (x^2)
```

</br><hr>

## 2.6 Exercises: Parentheses and Association