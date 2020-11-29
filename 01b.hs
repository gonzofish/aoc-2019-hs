import Fuel
import ReadAoC

main = do
  contents <- getContents
  putStrLn $ show $ sum . map calculateModuleFuel $ readInput contents

calculateModuleFuel :: (RealFrac a) => a -> a
calculateModuleFuel mass
  | fuel <= 0 = 0
  | otherwise = fuel + calculateModuleFuel fuel
  where
    fuel = (fromIntegral $ calculateFuel [mass])
