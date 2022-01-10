# Chapter 3 - End-chapter Exercises
</br>

## Reading syntax

**1** 
- `concat [[1, 2, 3], [4, 5, 6]]` -> OK
- `++ [1, 2, 3] [4, 5, 6]`        -> `(++) [1, 2, 3] [4, 5, 6]`
- `(++) "hello" " world"`         -> OK
- `["hello" ++ " world]`          -> `"hello" ++ " world"`
- `4 !! "hello"`                  -> `"hello" !! 4`
- `(!!) "hello" 4`                -> OK
- `take "4 lovely"`               -> `take 4 "lovely"`
- `take 3 "awesome"`              -> OK

**2**
- (a, d): `concat [[1 * 6], [2 * 6], [3 * 6]]` -> `[6,12,18]` 
- (b, c): `"rain" ++ drop 2 "elbow"`           -> `"rainbow"`
- (c, e): `10 * head [1, 2, 3]`                -> `10`
- (d, a): `(take 3 "Julie") ++ (tail "yes")`    -> `"Jules"`
- (e, b): `(concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]` -> `[2,3,5,6,8,9]`

<br/>

## Building functions

```haskell
module Reverse where 

-- 1
-- "Curry is awesome" ++ "!"
-- (!!) "Curry is awesome!" 4
-- drop 9 "Curry is awesome!"

-- 2
addBang word = word ++ "!"
fifthLetter word = (!!) word 4
dropFromNine word = drop 9 word 

-- 3
thirdLetter :: String -> Char
thirdLetter x = (!!) x 2

-- 4
letterIndex :: Int -> Char 
letterIndex x = (!!) "Curry is awesome!" x

-- 5
rvrs :: String -> String
rvrs x = concat [take 7 $ drop 9 x, take 4 $ drop 5 x, take 5 x]

-- 6
rvrs' :: String -> String
rvrs' x = concat [take 7 $ drop 9 x, take 4 $ drop 5 x, take 5 x]

main :: IO ()
main = print (rvrs "Curry is awesome!")
```