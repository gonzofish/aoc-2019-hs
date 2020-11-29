main = do
  contents <- getContents
  let input = readInput contents
  putStrLn $ show $ process input input 0

readInput :: String -> [Int]
readInput [] = []
readInput (',' : rest) = readInput rest
readInput contents = (read code) : readInput (drop (length code) contents)
  where
    code = takeWhile (/= ',') contents

process :: [Int] -> [Int] -> Int -> [Int]
process [] state _ = state
process _ [] _ = []
process (99 : _) state _ = state
process (1 : pos1 : pos2 : pos3 : _) state position = process rest newState newPosition
  where
    newState = add pos1 pos2 pos3 state
    newPosition = position + 4
    (_, rest) = splitAt newPosition newState
process (2 : pos1 : pos2 : pos3 : _) state position = process rest newState newPosition
  where
    newState = multiply pos1 pos2 pos3 state
    newPosition = position + 4
    (_, rest) = splitAt newPosition newState

-- process (2 : pos1 : pos2 : pos3 : _) state = process rest (multiply pos1 pos2 pos3 state)

{-
  foldl process input input
  process (1:rest) current = add
-}

add :: Int -> Int -> Int -> [Int] -> [Int]
add pos1 pos2 pos3 state =
  setValue state pos3 (value1 + value2)
  where
    value1 = getValue state pos1
    value2 = getValue state pos2

multiply :: Int -> Int -> Int -> [Int] -> [Int]
multiply pos1 pos2 pos3 state =
  setValue state pos3 (value1 * value2)
  where
    value1 = getValue state pos1
    value2 = getValue state pos2

getValue :: [Int] -> Int -> Int
getValue (first : rest) position
  | position > 0 = getValue rest (position - 1)
  | otherwise = first

setValue :: [Int] -> Int -> Int -> [Int]
setValue (first : rest) position value
  | position > 0 = first : setValue rest (position - 1) value
  | otherwise = value : rest
