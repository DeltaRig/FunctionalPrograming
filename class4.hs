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