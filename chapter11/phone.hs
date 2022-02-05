import Data.Char
import Data.Ord
import Data.List

-- Example of an old-school mobile phone panel
----------------------------
-- | 1     | 2 ABC | 3DEF  | 
-- | 4GHI  | 5JKL  | 6MNO  |
-- | 7PQRS | 8TUV  | 9WXYZ |
-- | *^    | 0+_   | #.,   |
----------------------------

-- 1
-- Data model representing old-school mobile phone panel
-- showcased above
newtype DaPhone = DaPhone [(Digit, DigitValue)] deriving Show
phone = DaPhone
    [ ('1', "1")
     ,('2', "abc2")
     ,('3', "def3")
     ,('4', "ghi4")
     ,('5', "jkl5")
     ,('6', "mno6")
     ,('7', "pqrs7")
     ,('8', "tuv8")
     ,('9', "wxyz9")
     ,('*', "^*")
     ,('0', "+ 0")
     ,('#', ".,#")
    ]

type Digit = Char
type DigitValue = [Char]
type Presses = Int

convo :: [String] 
convo =
    ["Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Just making sure rofl ur turn"]

-- 2
-- Returns a list of digit and its corresponding number of key presses
-- required to write a given character
reverseTaps :: DaPhone -> Char -> [(Digit, Presses)] 
reverseTaps (DaPhone (x:xs)) c
    | isUpper c = [('*', 1)] ++ reverseTaps (DaPhone xs) (toLower c)
    | c `elem` snd x = [(fst x, findPosition c (snd x))]
    | otherwise = reverseTaps (DaPhone xs) c

-- Helper function that returns the position
-- of a character in a string
findPosition :: Char -> [Char] -> Int
findPosition c (x:xs) =
    if c == x 
    then 1
    else 1 + findPosition c xs

-- Returns a list of digit and its corresponding number of key presses
-- required to write a given sentence
cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)] 
cellPhonesDead _ [] = []
cellPhonesDead p (x:xs) = reverseTaps p x ++ cellPhonesDead p xs

-- 3
-- Returns total presses required to write a character / word / sentence
fingerTaps :: [(Digit, Presses)] -> Presses 
fingerTaps = sum . map snd 

-- 4
-- Returns most frequent letter in a word / sentence
mostPopularLetter :: String -> Char 
mostPopularLetter xs = head . getMax . group . superSort $ xs
    where superSort xs = [x | x <- sort xs, x `elem` ['A'..'Z']++['a'..'z']] 
          getMax       = maximumBy (comparing length) 

-- Returns total presses required for the most frequent letter
mostPopularLetterCost :: String -> Int 
mostPopularLetterCost = fingerTaps . reverseTaps phone . mostPopularLetter

-- 5
-- Returns the most frequent l
coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . concat

-- Returns the most frequent word in a list of strings
-- concatMap concatenates every words in each sentence
-- into one long list 
coolestWord :: [String] -> String 
coolestWord = head . getMax . group . sort . concatMap words
    where getMax = maximumBy (comparing length)