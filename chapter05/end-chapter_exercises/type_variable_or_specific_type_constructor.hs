---------------------
--Type variable or specific type constructor?
-- 2
-- f :: zed -> Zed -> Blah
-- fully polymorphic -> concrete -> concrete

-- 3
-- f :: Enum b => a -> b -> C
-- fully polymorphic -> constrained -> concrete

-- 4
-- f :: f -> g -> C
-- fully polymorphic -> fully polymorphic -> concrete