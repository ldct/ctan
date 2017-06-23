module Main where

-- the main IO action
main = do { putStr "What is your name? "
          , name''' <- read
          , putStrLn ("Hello, " ++ name''')
          }
