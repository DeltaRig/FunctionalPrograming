-- @Book(Thinking Functionally with Haskell)
-- @Author(Richard Bird)
-- Language: Haskell
-- 
import Data.Tuple

-- Chapter 3
fst' :: (a,b) -> a
fst' (x,y) = x

snd' :: (a,b) -> b
snd' (x,y) = y

-- x `div` y = fst (x `divMod` y)
-- x `mod` y = snd (x `divMod` y)

floor' :: Float -> Integer
floor' = read. takeWhile (/= '.') . show

until :: (a -> Bool) -> (a -> a) -> a -> a
until p f x = if p x then x else until p f (f x) 

-- ghci> until (>100) (*7) 1
-- 343
-- vai multiplicando por 7 até ser maior que 100

floor x = until (`leq` x) (subtract 1) (-1)
        where m `leq` x = fromInteger m <= x

-- leq similar to (<=)
-- (`leq` x) is not the same that (leq x)
-- (`leq` x) y = y `leq` x =  leq y x

-- binary search use the same principle that floor
type Interval = (Integer, Interger)

choose :: Interval -> Integer
choose (m,n) = (m+n) `div` 2

shrink :: Float -> Interval -> Interval
shrink x (m,n) = if p `leq` x then (p,n) else (m,p)
                where p = choose (m,n)

lower :: Float -> Integer
-- STOP HERE

bound :: Float -> Interval
bound x = (lower x, upper x)

floor'' :: Float -> Integer
floor'' x = fst (until unit (shrink x) (bound x))
           where unit (m,n) = (m+1 == n)