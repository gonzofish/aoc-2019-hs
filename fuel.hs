module Fuel
  ( calculateFuel,
  )
where

calculateFuel :: (RealFrac a, Integral b) => [a] -> b
calculateFuel = sum . map (\mass -> floor (mass / 3) - 2)
