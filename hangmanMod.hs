-- Original: https://github.com/akira08280/programming-in-haskell/blob/master/Code/hangman.hs

-- Hangman example from chapter 10 of Programming in Haskell,
-- Graham Hutton, Cambridge University Press, 2016.

-- @Author(Daniela Pereira Rigoli)
-- @Version(2021/2)
-- Haskell

import System.IO
import Data.Char
import Data.Text

hangman :: IO ()
hangman = do putStrLn "Think of a word:"
             word <- sgetLine
             putStrLn "Try to guess it:"
             play word

sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
                 do putChar x
                    return []
              else
                 do putChar '-'
                    xs <- sgetLine
                    return (x:xs)

getCh :: IO Char
getCh = do hSetEcho stdin False
           x <- getChar
           hSetEcho stdin True
           return x

play :: String -> IO ()
play word = do putStr "? "
               guess <- getLine
               if guess == word then
                  putStrLn "You got it!!"
               else
                  do putStrLn (match word guess)
                     play word

match :: String -> String -> String
match xs ys = [if elem x ys then x else '-' | x <- xs]

capital = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lowercase = "abcdefghijklmnopqrstuvwxyz"

toLowerString' :: [Char] -> [Char]
toLowerString' xs = map toLower' xs

toLower' :: Char -> Char
toLower' c = 
    case c of
        'A' -> 'a'
        'B' -> 'b'
        'C' -> 'c'
        'D' -> 'd'
        'E' -> 'e'
        'F' -> 'f'
        'G' -> 'g'
        'H' -> 'h'
        'I' -> 'i'
        'J' -> 'j'
        'K' -> 'k'
        'L' -> 'l'
        'M' -> 'm'
        'N' -> 'n'
        'O' -> 'o'
        'P' -> 'p'
        'Q' -> 'q'
        'R' -> 'r'
        'S' -> 's'
        'T' -> 't'
        'U' -> 'u'
        'V' -> 'v'
        'X' -> 'x'
        'Z' -> 'z'
        'Y' -> 'y'
        'W' -> 'w'
        c -> c



