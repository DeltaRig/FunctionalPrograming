sumsqreven :: [Int] -> Int
sumsqreven lista = sum (map (^2) (filter even lista))

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = menores ++ [x] ++ maiores
    where menores = quicksort (filter (<=x) xs)
          maiores = quicksort (filter (>x) xs)

--let listaDeFuncoes = map (*) [0..]
--(listaDeFuncoes !! 3) 2

