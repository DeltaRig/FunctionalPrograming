-- Daniela Pereira Rigoli

segundo :: [a] -> a
segundo xs = head (tail xs)

tripla :: a -> (a, a, a)
tripla x = (x,x,x)

soma :: Int -> Int -> Int
soma x y = x + y

pares' :: [Int] -> [Int]
pares' = filter even

aplica :: (a -> b) -> a -> b
aplica f x = f x


--inc – soma 1 a todos elementos de uma lista de inteiros
inc :: [Int] -> [Int]
inc []  = []
inc (x:xs) = (x+1) : (inc xs)

--fac – retorna o fatorial de um número natural
fac :: Int -> Int 
fac 0 = 1
fac n = n * fac (n-1)

--pares – retorna os elementos pares de uma lista de inteiros
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | (mod x 2) == 0 = x : pares xs
             | otherwise = pares xs

--ordenado – decide se uma lista de inteiros está ordenada
ordenado :: (Ord a) => [a] -> Bool
ordenado []       = True
ordenado [x]      = True
ordenado (x:y:xs) = (x <= y) && ordenado (y:xs)


euclides :: Int -> Int -> Int
euclides a b | a == b    = b
             | a > b     = euclides (a - b) b
             | otherwise = euclides a (b-a)


remover :: Int -> [Int] -> [Int]
remover _ []                 = []
remover a (x:xs) 
                | x == a     = xs
                | otherwise  = x : remover a xs

-- Através da função remover e da função padrão mínimo :: [Int] -> Int, defina uma função recursiva ordena :: [Int] -> [Int] que ordena uma lista de inteiros a partir da seleção e remoção do menor elemento.
minimo :: [Int] -> Int
minimo []       = 0
minimo [x]      = x
minimo (x:xs)   = min x (minimo xs)

ordena :: [Int] -> [Int]
ordena [] = []
ordena (xs) = minimum xs : ordena (remover (minimum xs) xs)
