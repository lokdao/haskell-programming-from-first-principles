# Chapter 10 - End-chapter exercises
</br>

## Multiple choice
1. a) Weekday is a type with five data constructors
2. c) f :: Weekday -> String
3. b) must begin with a capital letter
4. a) is recursive and may not terminate

<br/>

## Ciphers
See file [cipher.hs](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter11/cipher.hs)

<br/>

## As-patterns
```haskell
-- 1
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xss@(x:xs) (y:ys) = 
    if x == y
    then isSubseqOf xs ys
    else isSubseqOf xss ys

-- 2
import Data.Char

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map capitalize . words
    where capitalize xss@(x:xs) = (xss, toUpper x : xs)
```

<br/>

## Language exercises
```haskell
-- 1
import Data.Char

capitalizeWord :: String -> String 
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

-- 2
capitalizeParagraph :: String -> String
capitalizeParagraph = unwords . capitalize . words

capitalize [] = []
capitalize (x:y:xs) =
    if last x == '.'
    then capitalizeWord x : capitalizeWord y : capitalize xs
    else x : y : capitalize xs
capitalize (x:_) = [x]
```

<br/>

## Phone exercise
See file [phone.hs](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter11/phone.hs)

<br/>

## Hutton’s Razor
```haskell
data Expr
       = Lit Integer
       | Add Expr Expr

-- 1
eval :: Expr -> Integer 
eval (Lit x) = x
eval (Add x y) = eval x + eval y 

-- 2
printExpr :: Expr -> String 
printExpr (Lit x) = show x
printExpr (Add x y) = printExpr x ++ " + " ++ printExpr y
```