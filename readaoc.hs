module ReadAoC
  ( readInput,
  )
where

readInput :: (RealFrac a) => String -> [a]
readInput contents = map readMass (lines contents)

readMass :: (RealFrac a) => String -> a
readMass rawMass = fromIntegral (read rawMass)
