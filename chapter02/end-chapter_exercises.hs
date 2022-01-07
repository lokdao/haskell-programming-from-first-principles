
---------------------
-- Parenthesization
-- 1 -> 2 + (2 * 3) - 1
-- 2 -> (^) 10 $ (1 + 1)
-- 3 -> ((2 ^ 2) * (4 ^ 5)) + 1

---------------------
-- Equivalent expressions
-- 1 -> will return the same result
-- 2 -> will return the same result
-- 3 -> will NOT return the same result
-- 4 -> will NOT return the same result
-- 5 -> will NOT return the same result

---------------------
-- More fun with functions
-- 1 
-- 10 + waxOn -> 1135
-- (+10) waxOn -> 1135
-- (-) 15 waxOn -> -1110
-- (-) waxOn 15 -> 1110

-- 2 & 3
-- triple waxOn -> 337

-- 4
waxOn = x * 5
    where z= 7
          y = z + 8
          x= y ^ 2

-- 5
triple x = x * 3

-- 6 & 7
waxOff = triple

