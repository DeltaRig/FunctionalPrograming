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