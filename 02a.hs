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
process (99 : _) state _ = state
process slice state position = process rest newState newPosition
  where
    newState = handleOpCode slice state
    newPosition = position + 4
    (_, rest) = splitAt newPosition newState

handleOpCode :: [Int] -> [Int] -> [Int]
handleOpCode (opcode : pos1 : pos2 : pos3 : _) state = setValue state pos3 $ operation value1 value2
  where
    operation = getOperation opcode
    value1 = getValue state pos1
    value2 = getValue state pos2

getOperation :: (Eq a1, Num a1, Num a2) => a1 -> a2 -> a2 -> a2
getOperation 1 = (+)
getOperation 2 = (*)

getValue :: [Int] -> Int -> Int
getValue (first : rest) position
  | position > 0 = getValue rest (position - 1)
  | otherwise = first

setValue :: [Int] -> Int -> Int -> [Int]
setValue (first : rest) position value
  | position > 0 = first : setValue rest (position - 1) value
  | otherwise = value : rest
