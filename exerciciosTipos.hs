type Pair a = (a,a)

mult :: Pair Int -> Int
mult (m,n) = m*n

copy :: a -> Pair a
copy x = (x,x) 

-- data Boolean = True | False

data Answer = Yes | No | Unknown

answers :: [Answer]
answers = [Yes,No,Unknown]

flip' :: Answer -> Answer
flip' Yes = No
flip' No = Yes
flip' Unknown = Unknown 

-- recursive data
-- Nat = Natural Numbers
data Nat = Zero | Succ Nat 

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

add :: Nat -> Nat -> Nat
add m n = int2nat (nat2int m + nat2int n)

add' Zero n = n
add' (Succ m) n = Succ (add' m n) 

-- 1. De forma similar à função add, defina uma função t :: Nat -> Nat -> Nat para o tipo recursivo
-- de números naturais. Dica: Faça o uso da função
-- add na sua definição.
mult' (Succ Zero) n = n
mult' (Succ m) n = Succ (mult' m n)

-- e sem recursividade
mult'' :: Nat -> Nat -> Nat
mult'' m n = int2nat (nat2int m * nat2int n)



-- 2. O arquivo de prelúdio de Haskell define o tipo
data Ordering = LT | EQ | GT
-- juntamente com a função
----compare :: Ord a => a -> a -> Ordering
-- Que decide se o primeiro parâmetro é um tipo ordenado menor que (LT), igual (EQ) ou maior que
-- (GT) que o segundo. Usando esta função, redefina
-- a função occurs :: Ord a => a -> Tree a -> Bool
-- para árvores binárias de busca.
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = (compare x y) == (compare 1 1)
occurs x (Node l y r) = (compare x y) == (compare 1 1) || occurs x l || occurs x r


data Tree a = Nil | Leaf a | Node (Tree a) a (Tree a)

t0 :: Tree Int
t0 = Node (Leaf 1) 5 (Leaf 6)

t00 :: Tree Int
t00 = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

-- 3. Considere a seguinte definição de árvores binárias:
-- árvore binaria apenas com elementos nas folhas
data TreeWithoutEN a = LeafWEN a | NodeWE (TreeWithoutEN a) (TreeWithoutEN a)

tr6 :: TreeWithoutEN Int
tr6 = NodeWE (NodeWE (LeafWEN 1) (LeafWEN 4)) (NodeWE (LeafWEN 6) (LeafWEN 9))


-- Dizemos que uma árvore binária é balanceada
-- quando o número de folhas na subárvore à esquerda difere em no máximo 1 do número de folhas da subárvore à 
-- direita. Defina uma função
--balanced :: Tree a -> Bool que decide se uma árvore é balanceada ou não.
treeSize :: Tree a -> Int
treeSize (Leaf x) = 1
treeSize (Node l x r) = 1 + treeSize r + treeSize l

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l x r) = abs (treeSize l - treeSize r) <= 1 && balanced l && balanced r

-- 4. Defina a função balance :: [a] -> Tree a que
-- converte uma lista não-vazia em uma árvore balanceada.
--Dica 1: primeiro defina uma função que divide uma lista em duas
--metadas cujo tamanho difere em no máximo 1.
--Dica 2: você já fez esta função auxiliar.

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- recebe uma lista e transforma em uma arvore balanceada sem elementos nos nodos
balance' :: [a] -> TreeWithoutEN a
balance' [x] = LeafWEN x
balance' xs = NodeWE (balance' ys)(balance' zs)
            where (ys, zs) = halve xs

middle []    = []
middle [x]   = [x]
middle [x,y] = [x,y]
middle xs    = middle $ init $ tail xs

remove :: Eq a => a -> [a] -> [a]
remove element list = filter (\e -> e/=element) list

-- árvores binarias com elementos nos nodos e nas folhas
treeToList :: Tree a -> [a]
treeToList (Nil)        = []
treeToList (Leaf x)     = [x]
treeToList (Node l x r) = treeToList(l) ++ [x] ++ treeToList(r)

-- Assumindo que a lista descreva um caminhamento em pré-ordem.
--listToTree :: [a] -> Tree a
--listToTree []     = Nil
--listToTree [x]    = Leaf x
--listToTree (x:xs) = ?


-- 4.2 Receber uma árvore a achatar ela numa lista
flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

t1 :: Tree Int
t1 = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))
-- Passo a passo
-- > flatter t
-- [1,3,4,5,6,7,9]


--5. Dada a seguinte definição de tipo
data Expr = Val Int | Add Expr Expr
--defina a função de alta-ordem
----folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
--tal que folde f g substitui o construtor Val em
--uma expressão pela função f assim como todo
--construtor add pela função g.
--folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
--folde f g = 

--6. Usando a função folde, defina a função
----eval :: Expr -> Int que avalia o valor de uma
--expressão para um valor inteiro e a função
----size :: Expr -> Int que calcula o número de valores
--em uma expressão
