# Chapter 13 - End-chapter exercises
</br>

## Hangman game logic

Code can be found [here](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter13/hello/hangman)

</br>

## Modifying code
1. Modified Caesar Cipher [(link)](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter13/caesar-cipher.hs) / Modified Vigenere Cipher [(link)](https://github.com/lokdao/haskell-programming-from-first-principles/blob/main/chapter13/vigenere-cipher.hs)

2. Modify `palindrome` function to exit when input is not a palindrome   
```haskell
import Control.Monad
import System.Exit (exitSuccess)

palindrome :: IO () 
palindrome = forever $ do
    line1 <- getLine
    case (line1 == reverse line1) of
        True -> putStrLn "It's a palindrome!" 
        False -> do
            putStrLn "Nope!"
            putStrLn "Goodbye now!"
            exitSuccess
```

3. Modify `palindrome` function to handle sentences   
```haskell
import Control.Monad
import System.Exit (exitSuccess)
import Data.Char (toLower)

s1 = "Madam I’m Adam"

palindrome' :: IO () 
palindrome' = forever $ do
    line1 <- getLine
    let modLine = [x | x <- map (toLower) line1, isAlphaNum x]
    case (modLine == reverse modLine) of
        True -> putStrLn "It's a palindrome!" 
        False -> do
            putStrLn "Nope!"
            putStrLn "Goodbye now!"
            exitSuccess
```

1. Prompt a user to enter a name and age, and handle errors.   
```haskell
type Name = String
type Age = Integer
data Person = Person Name Age deriving Show
data PersonInvalid = 
    NameEmpty | AgeTooLow | PersonInvalidUnknown String 
    deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person 
mkPerson name age
    | name /= "" && age > 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | not (age > 0) = Left AgeTooLow 
    | otherwise =
        Left $ PersonInvalidUnknown $ "Name was: " 
        ++ show name ++ " Age was: " ++ show age

gimmePerson :: IO () 
gimmePerson = do
    putStr "Give me a name: "
    name <- getLine
    putStr "Give me an age: "
    age <- getLine
    let intAge = read age :: Integer
    case (mkPerson name intAge) of
        Right (Person n a) -> 
            putStrLn $ "Yay! Successfully got a person:\
                    \ Name: " ++ n ++ " Age: " ++ show a
        Left NameEmpty -> 
            putStrLn $ "Errr, error! The name was empty!"
        Left AgeTooLow ->
            putStrLn $ "Errr, error! The age was less than 0! Age: " ++ age 
        Left (PersonInvalidUnknown msg) ->
            putStrLn $ "Errr, error! " ++ msg
```