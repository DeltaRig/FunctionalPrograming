somatorio :: Num a => [a] -> a
somatorio [] = 0
somatorio (x:xs) = x + somatorio xs

-- somatorio [1,2,3]
-- somatorio 1:2:3:[]
-- = 1 + somatorio [2,3]
-- = 1 + (2 + somatorio [3])
-- = 1 + (2 + (3 + somatorio []))
-- = 1 + (2 + (3 + 0))

--fold também conhecida (em outras linguagens) como reduce é uma função de redução
--ela analisa uma estrutura de dados recursiva aplicando um operador de combinação sobre os dados

somatoriofoldr :: Num a => [a] -> a
somatoriofoldr = foldr (+) 0

-- somatorio 1:2:3:[]
-- foldr (+) 0 1:2:3:[]
-- 1 + (2 + (3 + 0))

tamanho :: [a] -> Int
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

-- tamanho [1,2,3]
-- tamanho 1:2:3:[]
-- = 1 + tamanho 2:3:[]
-- = 1 + (1 + tamanho 3:[])
-- = 1 + (1 + (1 + tamanho []))
-- = 1 + (1 + (1 + 0))

tamanhofoldr :: [a] -> Int
tamanhofoldr = foldr (\x acc -> 1 + acc) 0

-- É possível usar foldr1 para processar listas não vazias
maximo :: Ord a => [a] -> a
maximo = foldr1 (\x max -> if x > max then x else max)