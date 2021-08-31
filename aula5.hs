-- a. Construa a função safetail que tem o
-- mesmo comportamento que a função exceto
-- que safetail mapeia a lista vazia para a
-- lista vazia diferentemente da função tail que
-- acusa erro. Defina safetail como:
-- (a) uma expressão condicional,
-- (b) equações restritas,
-- (c) casamento de padrões.
-- Dica: a função padrão null :: [a] -> Bool
-- pode ser usada para testar se um lista é vazia.

-- c. Dê três definições para o operador lógico ou
-- (||) usando casamento de padrões.

-- d. Redefina a versão abaixo de (&&) usando
-- condicionais ao invés de padrões:
-- 1 True && True = True
-- 2 _ && _ = False

-- e. Mostre que a função currificada abaixo
-- pode ser formalizada através de expressões
-- lambda.
-- 1 mult :: Int -> Int -> Int -> Int
-- 2 mult x y z = x*y*z
































----------------------------------------------
------------------ GABARITO ------------------
----------------------------------------------
-- exercício safetail
safetailA :: [a] -> [a]
safetailA xs = if null xs then [] else tail xs

safetailB:: [a] -> [a]
safetailB xs | null xs   = []
             | otherwise = tail xs

safetailC :: [a] -> [a]
safetailC []     = []
safetailC (x:xs) = xs

-- exercicio a
or' False False = False
or' False True  = True
or' True  False = True
or' True  True  = True

or'' False False = False
or'' _     _     = True
 
or''' False  b   = b
or''' True   _   = True

or'''' a b  | a == b = a
or'''' _ _           = True

-- exercicio d
and' :: Bool -> Bool -> Bool
and' a b = if a && b
        then True
        else False

-- exercício e
mult' :: Int -> (Int -> (Int -> Int))
mult' = \x -> (\y -> (\z -> x * y * z))
