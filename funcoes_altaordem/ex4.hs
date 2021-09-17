--filter even [1..10]
--filter (>3) [1..10]
--filter (\xs -> not (null xs)) [[1,2],[],[1],[],[]]

filterv1 :: (a -> Bool) -> [a] -> [a]
filterv1 p xs = [x | x <- xs, p x]

filterv2 :: (a -> Bool) -> [a] -> [a]
filterv2 p [] = []
filterv2 p (x:xs) | p x = x : filterv2 p xs
                  | otherwise = filterv2 p xs

filterv3 :: (a -> Bool) -> [a] -> [a]
filterv3 p [] = []
filterv3 p (x:xs) = if p x 
    then x : filterv3 p xs
    else filterv3 p xs

sumsqreven :: [Int] -> Int
sumsqreven ns = sum (map (^2) (filterv1 even ns))

sumsqreven' :: [Int] -> Int
sumsqreven' = sum . map (^2) . filterv1 even


-- como escrever a compressão de lista [f x | x <- xs, p x]
-- pode ser expressa através das funções de alta-ordem
-- map e filter
-- map f (filter p xs)
-- ou
-- map f . filter p


-- define se todos os elementos de uma lista satisfazem o  predicado
all'' :: (a -> Bool) -> [a] -> Bool
all'' p [] = True
all'' p xs = and [ p x | x <- xs] 

all' p = and . map p 

any' p = or . map p 

any'' :: (a -> Bool) -> [a] -> Bool
any'' p [] = False
any'' p xs = or [ p x | x <- xs] 