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


