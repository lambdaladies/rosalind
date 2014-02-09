module DNA where

import Data.Map.Lazy (Map, empty, insertWith, findWithDefault)

type FreqTable = Map Char Integer

countChars :: String -> FreqTable
countChars = foldl (\f c -> insertWith (+) c 1 f) empty

outputDNA :: FreqTable -> String
outputDNA freq = unwords $ map showCount "ACGT"
  where showCount c = show $ findWithDefault 0 c freq

main :: IO ()
main = getContents >>= putStrLn . outputDNA . countChars
