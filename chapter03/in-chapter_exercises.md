# Chapter 3 - In-chapter exercises
</br>

## 3.4 Exercises: Scope (p.73)

</br>
1. These lines of code are from a REPL session. Is y in scope for z? 

```haskell
Prelude> let x = 5
Prelude> let y = 7
Prelude> let z = x * y
```
**Solution**

Yes, y is in scope for z.

</br>
2. These lines of code are from a REPL session. Is h in scope for g? Go with your gut here.

```haskell
Prelude> let f = 3
Prelude> let g = 6 * f + h
```
**Solution**

No, h is not in scope for g.

</br>
3. This code sample is from a source file. Is everything we need to execute area in scope?

```haskell
area d = pi * (r * r) 
r = d/2
```
**Solution**

No, r is not in scope for area.

</br>
1. This code is also from a source file. Now are r and d in scope for area?

```haskell
area d = pi * (r * r) 
    where r = d / 2
```
**Solution**

Yes, r and d are in scope for area.

</br>

## 3.5 Exercises: Syntax Errors (p.76)
Read the syntax of the following functions and decide whether it will compile. Test them in your REPL and try to fix the syntax errors where they occur.
-  `++ [1, 2, 3] [4, 5, 6]` change to `(++) [1, 2, 3] [4, 5, 6]`
- `'<3' ++ ' Haskell'` change to `"<3" ++ " Haskell"`
- `concat ["<3", " Haskell"]` -> OK

</br>

## 3.6 Concatenation and scoping (p.79)
**Solution**
```haskell
module Print3Broken where

printSecond :: IO () 
printSecond = do
  putStrLn greeting

main :: IO () 
main = do
    putStrLn greeting 
    printSecond

greeting = "Yarrrrr"
```