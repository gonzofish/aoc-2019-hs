import Fuel
import ReadAoC

main = do
  contents <- getContents
  putStrLn $ show $ calculateFuel $ readInput contents
