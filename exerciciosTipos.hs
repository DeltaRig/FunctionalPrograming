type Pair a = (a,a)

mult :: Pair Int -> Int
mult (m,n) = m*n

copy :: a -> Pair a
copy x = (x,x) 

data Boolean = True | False

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
----data Ordering = LT | EQ | GT
-- juntamente com a função
----compare :: Ord a => a -> a -> Ordering
-- Que decide se o primeiro parâmetro é um tipo ordenado menor que (LT), igual (EQ) ou maior que
-- (GT) que o segundo. Usando esta função, redefina
-- a função occurs :: Ord a => a -> Tree a -> Bool
-- para árvores binárias de busca.

-- 3. Considere a seguinte definição de árvores binárias:
----data Tree a = Leaf a | Node (Tree a) (Tree a)
-- Dizemos que uma árvore binária é balanceada
-- quando o número de folhas na subárvore à esquerda difere em no máximo 1 do número de folhas da subárvore à 
-- direita. Defina uma função
-- balanced :: Tree a -> Bool que decide se uma árvore é balanceada ou não.

-- 4. Defina a função balance :: [a] -> Tree a que
-- converte uma lista não-vazia em uma árvore balanceada.
--Dica 1: primeiro defina uma função que divide uma lista em duas
--metadas cujo tamanho difere em no máximo 1.
--Dica 2: você já fez esta função auxiliar.

--5. Dada a seguinte definição de tipo
----data Expr = Val Int | Add Expr Expr
--defina a função de alta-ordem
----folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
--tal que folde f g substitui o construtor Val em
--uma expressão pela função f assim como todo
--construtor add pela função g.

--6. Usando a função folde, defina a função
----eval :: Expr -> Int que avalia o valor de uma
--expressão para um valor inteiro e a função
----size :: Expr -> Int que calcula o número de valores
--em uma expressão
