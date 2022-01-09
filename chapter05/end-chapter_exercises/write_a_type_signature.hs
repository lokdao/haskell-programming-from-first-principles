---------------------
-- Write a type signature
-- 1
functionH :: [a] -> a
functionH (x:_) = x

-- 2
functionC :: (Eq a, Ord a) => a -> a -> Bool
functionC x y =
     if (x > y) then True else False

-- 3
functionS :: (a, b) -> b
functionS (x, y) = y
