somatorio :: Num a => [a] -> a -> a
somatorio [] acc = acc
somatorio (x:xs) acc = somatorio xs (acc + x)

-- somatorio [1,2,3] 0
-- = somatorio [2,3] 0 + 1
-- = somatorio [3] (0 + 1) + 2
-- = somatorio [] ((0 + 1) + 2) + 3
-- = ((0 + 1) + 2) + 3

somatoriofoldl :: Num a => [a] -> a
somatoriofoldl = foldl (+) 0

