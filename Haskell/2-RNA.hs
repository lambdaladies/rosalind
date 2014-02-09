module RNA where

transcribe :: String -> String
transcribe = map (\c -> case c of 'T' -> 'U'; a -> a)

main :: IO ()
main = getContents >>= putStrLn . transcribe
