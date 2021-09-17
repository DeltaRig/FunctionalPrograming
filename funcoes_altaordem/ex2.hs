--zipWith (+) [1,2,3] [4,5,6]
--zipWith max [6,3,2,1] [7,3,1,5]
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys