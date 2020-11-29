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
  setValue memory pos3 $ operation value1 value2
  where
    operation = getOperation opcode
    value1 = getValue memory pos1
    value2 = getValue memory pos2

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
