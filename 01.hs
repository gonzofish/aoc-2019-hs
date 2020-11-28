main = do
  contents <- getContents
  putStrLn $ show $ foldl sumMasses 0 $ lines contents

sumMasses :: (Integral a) => a -> String -> a
sumMasses total rawMass = total + calculateMass rawMass

calculateMass :: (Integral a) => String -> a
calculateMass rawMass = floor (read rawMass / 3) - 2
