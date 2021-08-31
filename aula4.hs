-- a. Mostre que sum [x] = x para qualquer valor numérico x. 
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (n:ns) = n + sum' ns

-- b. Defina uma função que calcula o produtório de uma
-- lista de números. Por exemplo, produtorio [2,3,4] resulta em 24. 
prod :: Num a => [a] -> a
prod [] = 1
prod (n:ns) = n * prod ns

-- sort em ordem crescente
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

       
-- c. Como a função qsort deve ser alterada para produzir uma lista em ordem decrescente?
qsortDec :: Ord a => [a] -> [a]
qsortDec [] = []
qsortDec (x:xs) = qsortDec larger ++ [x] ++ qsortDec smaller
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

-- d. Qual seria o efeito de <= fosse trocado por < na função qsort? (Dica: considere a entrada [2,2,3,1,1].)
qsortError :: Ord a => [a] -> [a]
qsortError [] = []
qsortError (x:xs) = qsortError smaller ++ [x] ++ qsortError larger
    where
        smaller = [a | a <- xs, a < x]
        larger = [b | b <- xs, b > x]
-- é removido as repetições pois não faz nada quando é igual


-- e. Mostre as aplicações sucessivas de qsort na seguinte chamada: qsort [3,5,1,4,2]
-- f. Qual o resultado da expressão qsort "afd345"? "345adf"
-- g. Coloque os parênteses opcionais nas seguintes expressões: 
-- 2^3*4, 2*3+4*5 e 2+3*4^5
-- (2^3)*4, (2*3)+(4*5) e 2+(3*(4^5))

-- h. A função head é total? Caso a resposta seja negativa, qual é a entrada que não 
-- tem nenhum mapeamento correspondente?
-- i. Qual o resultado da expressão take (double 2) [1,2,3,4,5]?
-- j. Corrija os erros de sintaxe de código abaixo e teste a sua solução no GHCi. 
--N = a div length xs
--    where
--        a = 10
--        xs = [1,2,3,4,5]

-- exercício a
-- sum [x] -- aplicando sum
-- x + sum [] -- aplicando sum
-- x + 0 -- aplicando +
-- x

----------------------------------------------
------------------ GABARITO ------------------
----------------------------------------------
-- exercício b
produtorio :: Num a => [a] -> a
produtorio []     = 1
produtorio (n:ns) = n * produtorio ns

-- exercício c
qsortReverso :: Ord a => [a] -> [a]
qsortReverso []     = []
qsortReverso (x:xs) = qsortReverso maiores ++ [x] ++ qsortReverso menores
        where maiores = [a | a <- xs, a >= x ]
              menores = [a | a <- xs, a < x ]

-- exercício d
qsort' :: Ord a => [a] -> [a]
qsort' []     = []
qsort' (x:xs) = qsort' menores ++ [x] ++ qsort' maiores
        where menores = [a | a <- xs, a < x]
              maiores = [a | a <- xs, a > x]
qsort' [2,2,3,1,1] -- aplicando qsort' 
-- [1,2,3] -- resulta nesta lista
-- como não há uma padrão para os elementos iguais ao pivot, os mesmos
-- descartados

-- exercício e
-- qsort [3,5,1,4,2]
-- qsort [1,2] ++ [3] ++ qsort [5,4]
-- (qsort [] ++ [1] ++ qsort [2]) ++ [3] ++ (qsort [4] ++ [5] ++ qsort [])
-- ([] ++ [1] ++ (qsort [] ++ [2] ++ qsort [])) ++ [3] ++ ((qsort [] ++ [4] ++ qsort []) ++ [5] ++ [])
-- ([] ++ [1] ++ ([] ++ [2] ++ [])) ++ [3] ++ (([] ++ [4] ++ []) ++ [5] ++ [])
-- ([] ++ [1] ++ [2] ) ++ [3] ++ ([4] ++ [5] ++ [])
-- ([1] ++ [2] ) ++ [3] ++ ([4] ++ [5])
-- [1,2] ++ [3] ++ [4,5]
-- [1,2,3,4,5]

-- exercício f
-- qsort "afd345"
-- "345adf"
