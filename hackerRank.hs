-- Print "Hello World" on a new line 'n' times.
hello_worlds 1 = putStrLn "Hello World" 
hello_worlds n = do
    putStrLn "Hello World" 
    hello_worlds (n - 1)

-- Fibonacci Numbers
fib n = last $ take n fibs
    where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- move all of the characters that occurred previously in the string
--strReduction = foldl reduction "" 
--reduction x y |elem y x = x
--              |otherwise = y:x
-- foldl be a comparation starting in left

