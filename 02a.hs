import IntCode

main = do
  contents <- getContents
  let input = readInput contents
  putStrLn $ show $ process input input 0
