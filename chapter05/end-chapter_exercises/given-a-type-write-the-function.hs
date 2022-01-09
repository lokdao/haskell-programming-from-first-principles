---------------------
-- Given a type, write the function
-- 1
i :: a -> a
i x = x

-- 2
c :: a -> b -> a 
c x _ = x

-- 3
c'' :: b -> a -> b 
c'' x _ = x

-- 4
c' :: a -> b -> b 
c' _ y = y

-- 5
r :: [a] -> [a] 
r x = x

r' :: [a] -> [a]
r' = tail

-- 6
co :: (b -> c) -> (a -> b) -> a -> c 
co f g x = f . g $ x

-- 7
a :: (a -> c) -> a -> a
a f x = x

-- 8
a' :: (a -> b) -> a -> b 
a' f x = f x
