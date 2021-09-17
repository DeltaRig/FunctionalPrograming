-- Exercício 1
ex1 :: [Int]
ex1 = [x^2 | x <- [1..100]]

-- Exercício 2
grid :: Int -> Int -> [(Int,Int)]
grid n m = [(x,y) | x <- [0..n], y <- [0..m]]

-- Exercício 3
square :: Int -> [(Int,Int)]
square n = [(x,y) | (x,y) <- (grid n n), x /= y]

-- Exercício 4
replicate' :: Int -> a -> [a]
replicate' n e = [e | _ <- [1..n]]

-- Exercício 5
find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

-- Exemplo:
-- > find 'b' [('a',1),('b',2),('c',3),('b',4)]
-- [2,4]

positions :: Eq a => a -> [a] -> [Int]
positions k xs =  find k (zip xs [0..])
-- > positions 'd' "abdgardfafdddd"

-- Exercício 6
ex6 = concat [[(x,y) | y <- [3,4]] | x <- [1,2]]