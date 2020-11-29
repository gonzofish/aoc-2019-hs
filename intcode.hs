module IntCode
  ( getValue,
    process,
    readInput,
    setValue,
  )
where

readInput :: String -> [Int]
readInput [] = []
readInput (',' : rest) = readInput rest
readInput contents = (read code) : readInput (drop (length code) contents)
  where
    code = takeWhile (/= ',') contents

process :: [Int] -> [Int] -> Int -> [Int]
process (99 : _) memory _ = memory
process slice memory position = process nextSlice nextState nextPosition
  where
    nextState = handleOpCode slice memory
    nextPosition = position + 4
    (_, nextSlice) = splitAt nextPosition nextState

handleOpCode :: [Int] -> [Int] -> [Int]
handleOpCode (opcode : pos1 : pos2 : pos3 : _) memory =
  setValue pos3 computedValue memory
  where
    operation = getOperation opcode
    value1 = getValue pos1 memory
    value2 = getValue pos2 memory
    computedValue = operation value1 value2

getOperation :: (Eq a1, Num a1, Num a2) => a1 -> a2 -> a2 -> a2
getOperation 1 = (+)
getOperation 2 = (*)

getValue :: Int -> [Int] -> Int
getValue position (first : slice)
  | position > 0 = getValue (position - 1) slice
  | otherwise = first

setValue :: Int -> Int -> [Int] -> [Int]
setValue position value (first : slice)
  | position > 0 = first : setValue (position - 1) value slice
  | otherwise = value : slice
