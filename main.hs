-- @Author(Daniela Pereira Rigoli)
-- @Version(2021/2)
-- Teacher Diego Noble
-- Haskell
--
 
abs' :: Int -> Int
abs' n = if n < 0 then -n else n

-- abs'' n = | n < 0 = -n
--           | otherwise = n

signum' n = if n < 0 then -1 else if n == 0 then 0 else 1

-- signum'' n  | n < 0 = -1
--             | n > 0 = 1
--             | otherwise = 0

sum' :: [Int] -> Int
sum' (x : xs) = x + sum xs
-- sum' [1,2,3]
-- 1 + sum' [2,3]
-- 1 + (2 + sum' [3])
-- 1 + (2 + (3  + sum[]))
-- 1 + (2 + (3  + 0))

sum'' :: [Int] -> Int
sum'' = foldr (+) 0
-- sum'' [1,2,3]
-- foldr (+) 0 [1,2,3]
-- 1 : 2 : 3 : []
-- 1 + 2 + 3 + 0

prod' :: [Int] -> Int
prod' = foldr (*) 1

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr' f v xs)
-- é o operador (+, and, or...)

length' :: [Int] -> Int
length' = foldr (\_ n -> 1 + n) 0


-- ideia questão 6 trabalho 1
l = [1,2,3,4]
zip l (tail l)
-- [(1,2),(2,3),(3,4)]
-- fazer and do resultado
