isPrime n =
  if n <= 1 then False
  else isPrime2 2 n

isPrime2 x n = 
  if x < n then
    if mod n x == 0 then False
    else isPrime2 (x+1) n
  else True

primesBetween :: Integer -> Integer -> [Integer]

primesBetween a b =
  [ x | x <- [a..b+1], isPrime x ]

plus3 :: Integer -> Integer

plus3 x = x+3

-- https://stackoverflow.com/questions/19772427/haskell-generate-subsets
subsets :: [Integer] -> [[Integer]]
subsets [] = [[]]
subsets (x:xs) = subsets xs ++ map (x:) (subsets xs)

-- primePartitions :: Integer -> [IO ()]
primePartitions n =
  mapM putStrLn (
    map getPartitionString (
      filter (sumsTo n) (
        subsets (primesBetween 2 n)
      )
    )
  )

getPartitionString [x] = show x
getPartitionString (x:xs) =
  (show x) ++ " + "++ (getPartitionString xs)

printPrimePartition lst =
  print (getPartitionString lst)

sumsTo :: Integer -> [Integer] -> Bool
sumsTo n (x:xs) =
  if n < 0 then False
  else sumsTo (n-x) xs

sumsTo n [] = 
  if n == 0 then True
  else False

main = do
  putStrLn "Enter a number:"
  n <- getLine
  putStrLn ""
  primePartitions (read n)
