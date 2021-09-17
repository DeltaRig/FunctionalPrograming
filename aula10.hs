-- a)
sumdown :: Int -> Int
sumdown 0 = 0
sumdown x = x + sumdown (x-1)

-- b) 
multiplic :: Int -> Int -> Int
multiplic _ 0 = 0
multiplic m n = m + multiplic m (n-1)

-- c)
expo :: Int -> Int -> Int
expo _ 0 = 1
expo b e = b * expo b (e-1)

-- Avaliação
-- expo 2 3
-- 2 * expo 2 2
-- 2 * (2 * expo 2 1)
-- 2 * (2 * (2 * expo 2 0))
-- 2 * (2 * (2 * 1))
-- 2 * (2 * 2)
-- 2 * 4
-- 8

-- d)
-- versão com if
insert' :: Ord a => a -> [a] -> [a]
insert' x [] = [x]
insert' x (y:ys) = if x <= y then x:y:ys else y:(insert' x ys)
-- ou insert' x (y:ys) = if x <= y then x:y:ys else [y] ++ insert' x ys

-- versão com equação de guarda
insert'' :: Ord a => a -> [a] -> [a]
insert'' x [] = [x]
insert'' x (y:ys) | x <= y = x:y:ys
                  | otherwise = y:(insert'' x ys)
                  
-- e)
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert' x (isort xs)

-- f)
euclid :: Int -> Int -> Int
euclid a b  | b == 0 = a
            | otherwise = euclid b (a `mod` b)

-- ou (if/else)
euclid' :: Int -> Int -> Int
euclid' a b  = if b == 0 then a else euclid' b (a `mod` b)
