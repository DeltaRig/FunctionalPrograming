-- Print "Hello World" on a new line 'n' times.
hello_worlds 1 = putStrLn "Hello World" 
hello_worlds n = do
    putStrLn "Hello World" 
    hello_worlds (n - 1)

-- Fibonacci Numbers
fib n = last $ take n fibs
    where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

