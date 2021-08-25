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

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

-- a. Mostre que sum [x] = x para qualquer valor numérico x. 
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (n:ns) = n + sum' ns

-- b. Defina uma função que calcula o produtório de uma
-- lista de números. Por exemplo, produtorio [2,3,4] resulta em 24. 
prod :: Num a => [a] -> a
prod [] = 1
prod (n:ns) = n * prod ns

-- c. Como a função qsort deve ser alterada para produzir uma lista em ordem decrescente?
-- d. Qual seria o efeito de <= fosse trocado por < na função qsort? (Dica: considere a entrada [2,2,3,1,1].)
-- e. Mostre as aplicações sucessivas de qsort na seguinte chamada: qsort [3,5,1,4,2]
-- f. Qual o resultado da expressão qsort "afd345"?

