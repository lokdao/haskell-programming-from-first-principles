---------------------
awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 1
-- length type signature may be: length :: [a] -> Int

-- 2
-- length [1, 2, 3, 4, 5]           -> 5
-- length [(1, 2), (2, 3), (3, 4)]  -> 3
-- length allAwesome                -> 2
-- length (concat allAwesome)       -> 5

-- 3
-- The second expression will return an error because the "/" operator expects Fractional numbers 
-- but length returns an Int

-- 4 
-- 6 `div` length [1,2,3]

-- 5
-- The type is "Bool" and we expect the value "True"

-- 6
-- The type is "Bool" and we expect the value "False"

-- 7
-- length allAwesome == 2               -> returns True
-- length [1, 'a', 3, 'b']              -> returns an error
-- length allAwesome + length awesome   -> returns 5
-- (8 == 8) && ('b' < 'a')              -> returns False
-- (8 == 8) && 9                        -> returns an error

-- 8
isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x

-- 9
myAbs :: Integer -> Integer
myAbs x = if x < 0 then abs x else x

-- 10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

---------------------
-- Correcting syntax
-- 1
x = (+)
addOne xs = w `x` 1
    where w = length xs

-- 2
identity x = x

-- 3
firstVal :: (a, b) -> a
firstVal = fst

---------------------
-- Match the function names to their types
-- 1 -> c
-- 2 -> b
-- 3 -> a
-- 4 -> d