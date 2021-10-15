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

-- Execute os comandos abaixo após carregar o script no GHCI
--isComplete t1
--isComplete t2

-- Anotações durante a aula:

-- Verifica se o elemento a está na árvore,essa árvore precisa ser árvore de busca (ordenada)
occursABB :: Ord a => a -> Tree a -> Bool
occursABB x (Leaf y) = x == y
occursABB x (Node l y r) | x == y = True
                         | x < y = occursABB x l 
                         | otherwise = occurs x r

-- Verifica se a esta na árvore mas a árvore não pricsa ser uma árvore de busca (ordenada)
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


-- Diferentes tipos de árvore 
-- Uma árvore binária
-- Com os elementos nas folhas
-- data Tree a = Leaf a | Node (Tree a) a (Tree a)

tr1 :: Tree Int
tr1 = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

-- Apenas com elementos internos, sem elementos nas folhas
data TreeWithoutEL a = LeafEmpty | NodeWEL (TreeWithoutEL a) a (TreeWithoutEL a)

tr2 :: TreeWithoutEL Int
tr2 = NodeWEL (NodeWEL (LeafEmpty) 3 (LeafEmpty)) 5 (NodeWEL (LeafEmpty) 7 (LeafEmpty))

-- árvore com dois tipos
-- tipo a nas folhas e tipo b internamente
-- ex:Int nas folhas e tipo Char internamente
data TreeTwoTypes a b = LeafA a | NodeAB (TreeTwoTypes a b) b (TreeTwoTypes a b)

tr3 :: TreeTwoTypes Char Int
tr3 = NodeAB (NodeAB (LeafA 'a') 3 (LeafA 'b')) 5 (NodeAB (LeafA 'c') 7 (LeafA 'd'))

tr4 :: TreeTwoTypes Int Char
tr4 = NodeAB (NodeAB (LeafA 1) 'e' (LeafA 2)) 'a' (NodeAB (LeafA 3) 'b' (LeafA 4))

-- árvore do tipo a, associado a um elemento que carrega uma lista de árvores
-- árvore não binária, um nodo podendo ter vários filhos
data TreeList a = NodeM a [TreeList a]

tr5 :: TreeList Int
tr5 = NodeM 1 [                     -- 3 filhos
                NodeM 2 [],
                NodeM 2 [],
                NodeM 2 [               --- 4 filhos
                    NodeM 3 [],
                    NodeM 3 [],
                    NodeM 3 [               --- 1 filho
                        NodeM 4 []
                    ],
                    NodeM 3 [               --- 1 filho
                        NodeM 4 []
                    ]
                ]
              ]

-- árvore binaria apenas com elementos nas folhas
data TreeWithoutEN a = LeafWEN a | NodeWE (TreeWithoutEN a) (TreeWithoutEN a)

tr6 :: TreeWithoutEN Int
tr6 = NodeWE (NodeWE (LeafWEN 1) (LeafWEN 4)) (NodeWE (LeafWEN 6) (LeafWEN 9))


-- Verificar se uma árvore é balanceada
balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l x r) = abs (treeSize l - treeSize r) <= 1 && balanced l && balanced r


halve xs = splitAt (length xs `div` 2) xs

-- recebe uma lista e transforma em uma arvore balanceada
balance' :: [a] -> TreeWithoutEN a
balance' [x] = LeafWEN x
balance' xs = NodeWE (balance' ys)(balance' zs)
            where (ys, zs) = halve xs

-- balance [1,2,3,4,5]
-- Node (balance [1,2,3]) (balance [4,5])
-- Node (Node (balance[1,2] (balance [3])) (Node (balance [4] balance [5]))
-- Node (Node (Node (Leaf[1] Leaf [2]) (Leaf [3])) (Node (Leaf [4] Leaf [5]))