import Data.Char

------------------------
-- My own take on Caesar's cipher and decipher functions 
-- based on my current Haskell knowledge
------------------------

-- Input: Offset for substituting letters
--        Text to cipher
-- Output: Ciphered text
caesar :: Int -> String -> String
caesar n = substitute (+n)

-- Input: Offset used to cipher the text
--        Text to decipher
-- Output: Ciphered text
unCaesar :: Int -> String -> String
unCaesar n = substitute (subtract n)

------------------------
-- Helper function
substitute :: (Int -> Int) -> String -> String
substitute _ [] = ""
substitute f xs = map (chr . (f . ord)) xs