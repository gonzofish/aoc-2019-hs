import IntCode
import System.Environment

main = do
  args <- getArgs
  contents <- getContents
  let (noun, verb) = readArgs args
      input = setValue 1 noun $ setValue 2 verb $ readInput contents
  putStrLn $ show $ process input input 0

readArgs :: [String] -> (Int, Int)
readArgs [] = (0, 0)
readArgs [rawNoun] = (read rawNoun, 0)
readArgs (rawNoun : rawVerb : _) = (read rawNoun, read rawVerb)
