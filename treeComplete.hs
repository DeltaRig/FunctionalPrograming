data Tree a = Leaf a | Node (Tree a) a (Tree a)

treeSize :: Tree a -> Int
treeSize (Leaf x) = 1
treeSize (Node l x r) = 1 + treeSize r + treeSize l

isComplete :: Tree a -> Bool
isComplete (Leaf x) = True
isComplete (Node l x r) | treeSize l == treeSize r = True && isComplete l && isComplete r
                        | otherwise = False

t1 :: Tree Int
t1 = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

t2 :: Tree Int
t2 = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Leaf 9)

-- Execute os comandos abaixo após carregar o script no GHCI
--isComplete t1
--isComplete t2