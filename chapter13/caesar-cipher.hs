import Data.Char

------------------------
-- My take on Caesar's cipher and decipher functions 
-- based on my current Haskell knowledge
------------------------

-- Input: Offset for substituting letters
--        Text to cipher
-- Output: Ciphered text
caesar :: Int -> String -> String
caesar n = substitute (+n)

-- Input: Offset used to cipher the text
--        Text to decipher
-- Output: Deciphered text
unCaesar :: Int -> String -> String
unCaesar n = substitute (subtract n)

------------------------
-- Helper function
substitute :: (Int -> Int) -> String -> String
substitute _ [] = ""
substitute f xs = map (chr . (f . ord)) xs


------------------------
-- User input
cipher :: IO String
cipher = do
    putStrLn "Welcome to Caesar Cipher!"
    putStr "Do you want to cipher (1) or decipher (2)? "
    choice <- getLine
    case choice of
        "1" -> do 
            putStr "Enter the message to cipher: "
            cString <- getLine
            putStr "Enter the offset: "
            offset <- getLine
            let nOffest = read offset :: Int
            return $ caesar nOffest cString
        "2" -> do
            putStr "Enter the message to decipher: "
            dString <- getLine
            putStr "Enter the offset: "
            offset <- getLine
            let nOffest = read offset :: Int
            return $ unCaesar nOffest dString
        _ -> return "Your choice must be either 1 or 2"
