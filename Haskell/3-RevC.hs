module RevC where

reverseCompliment :: String -> String
reverseCompliment = reverse . map f
  where f 'A' = 'T'
        f 'C' = 'G'
        f 'G' = 'C'
        f 'T' = 'A'
        f a = a

main :: IO ()
main = getContents >>= putStrLn . reverseCompliment
