---------------------
-- Does it compile?
-- 1
bigNum = (^) 5
wahoo = bigNum $ 10

-- 2 OK
-- 3 
a = (+) 
b = 5
c = a b 10 
d = a c 200

-- 4
a' = 12 + b
b' = 10000 * c
c' = 1