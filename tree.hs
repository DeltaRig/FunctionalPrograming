-- import Data.Char

data Tree a = Leaf a | Node (Tree a) a (Tree a)

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node l y r) = x == y 
                        || occurs x l 
                        || occurs x r

flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = flatten l
 ++ [x]
 ++ flatten r

--
--balanced :: Tree a -> Bool
--balanced (Leaf _) = True
--balanced (Node l r) = abs (lenTree l - lenTree r) <= 1
--                    && balanced 


halve xs = splitAt (length xs `div` 2) xs


-- recebe uma lista e transforma em uma arvore balanceada
balance :: [a] -> Tree a
balance [x] = Leaf x
balance xs = Node (balance ys)(balance zs)
            where (ys, zs) = halve xs

-- balance [1,2,3,4,5]
-- Node (balance [1,2,3]) (balance [4,5])
-- Node (Node (balance[1,2] (balance [3])) (Node (balance [4] balance [5]))
-- Node (Node (Node (Leaf[1] Leaf [2]) (Leaf [3])) (Node (Leaf [4] Leaf [5]))