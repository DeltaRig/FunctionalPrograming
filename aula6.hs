-- a. considere cada dígito como um número à parte,

-- b. começando pela primeiro número mais à esquerda até
-- o último dígito, multiplique os números por 2 de forma
-- alternada,

-- c. subtraia 9 de cada número cujo o resultado que seja maior que 9,

-- d. some todos os números,

-- e. se o resultado é um número divisível por 10, o cartão é válido
































----------------------------------------------
------------------ GABARITO ------------------
----------------------------------------------
-- Exercício 1
halve' xs = (take n xs, drop n xs)
    where n = length xs `div` 2

halve'' xs = splitAt (length xs `div` 2) xs

-- Exercício 2
third' xs = head (tail (tail xs))

third'' xs = xs !! 2

third''' (_:_:x:_) = x

-- Exercício 3
luhnDouble :: Int -> Int
luhnDouble n = if n * 2 < 9 then n * 2 else n * 2 - 9

luhnDouble' :: Int -> Int
luhnDouble' n | doubleDigit < 9 = doubleDigit
              | otherwise = doubleDigit - 9
                where
                  doubleDigit = n * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn w x y z = (sum ([luhnDouble w, x, luhnDouble y, z])) `mod` 10 == 0

