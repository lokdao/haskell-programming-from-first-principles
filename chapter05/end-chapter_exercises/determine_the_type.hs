{-# LANGUAGE NoMonomorphismRestriction #-}
---------------------
-- Determine the type
-- 1.
-- a) 54, Num a => a
-- b) (0, "doge"), Num a => (a, [Char])
-- c) (0, "doge), (Integer, [Char]) 
-- d) True, Bool
-- e) 5, Int
-- f) False, Bool

-- 2. Num a => a
-- 3. Num a => a -> a
-- 4. Fractional a => a
-- 5. [Char]