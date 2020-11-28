module Fuel
  ( calculateFuel,
  )
where

calculateFuel :: (RealFrac a, Integral b) => [a] -> b
calculateFuel = foldl (\total mass -> total + calculateFuel' mass) 0

calculateFuel' :: (RealFrac a, Integral b) => a -> b
calculateFuel' mass = floor (mass / 3) - 2

-- calculateFuel :: (Integral a, RealFrac a) => [a] -> a
-- calculateFuel = foldl (\total mass -> total + calculateFuel' mass) 0

-- calculateFuel' :: (Integral a, RealFrac a) => a -> a
-- calculateFuel' mass = floor (mass / 3) - 2
