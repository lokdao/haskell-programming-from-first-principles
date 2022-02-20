import Data.Char

------------------------
-- My take on Vigenère's cipher and decipher functions 
-- based on my current Haskell knowledge
------------------------

---------------------
-- Testing the code
plainMessage = "MEET AT DAWN"
keyword = "ALLY"
cipherMessage = "MPPR AE OYWY"

testCipher = 
    let result = cVigenere plainMessage keyword
    in
        if result == cipherMessage
        then "Well done!"
        else "Uh oh, try again."
testDecipher = 
    let result = dVigenere cipherMessage keyword
    in
        if result == plainMessage
        then "Well done!"
        else "Uh oh, try again."
---------------------

-- Input: message to cipher
--        keyword
cVigenere :: [Char] -> [Char] -> [Char]
cVigenere m k = cipher $ zipAlphaNum m $ cycle k
    where 
        cipher x = map chr (substitute (+) x)

-- Input: message to decipher
--        keyword
dVigenere :: [Char] -> [Char] -> [Char]
dVigenere m k = cipher $ zipAlphaNum m $ cycle k
    where 
        cipher x = map chr (substitute subtract x)

-- Combine each alphanumerical characters 
-- in the message with each keyword characters
-- and convert both to their INT representation
zipAlphaNum [] _ = []
zipAlphaNum _ [] = []
zipAlphaNum (x:xs) (y:ys) =
    if isAlphaNum x
    then (ord x, ord y) : zipAlphaNum xs ys 
    else (ord x, ord x) : zipAlphaNum xs (y:ys)

-- Cipher or Decipher the message depending on the function used
-- if f = (+), the message will be ciphered
-- if f = subtract, the message will be deciphered
substitute :: (Int -> Int -> Int) -> [(Int, Int)] -> [Int]
substitute _ [] = []
substitute f ((x,y):xs) =
    let
        cipherVal = mod (f y x) 26 + 65
    in     
        if isAlphaNum . chr $ x
        then cipherVal : substitute f xs
        else x : substitute f xs

------------------------
-- User input
cipher :: IO String
cipher = do
    putStrLn "Welcome to Vigenere Cipher!"
    putStr "Do you want to cipher (1) or decipher (2)? "
    choice <- getLine
    case choice of
        "1" -> do 
            putStr "Enter the message to cipher: "
            cString <- getLine
            putStr "Enter the keyword: "
            keyword <- getLine
            return $ cVigenere cString keyword
        "2" -> do
            putStr "Enter the message to decipher: "
            dString <- getLine
            putStr "Enter the keyword: "
            keyword <- getLine
            return $ dVigenere dString keyword
        _ -> return "Your choice must be either 1 or 2"
