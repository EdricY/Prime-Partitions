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

main = primePartitions 42
-- primePartitions n =
--   primePartitions2 n 1 []

-- primePartitions2 :: Integer -> Integer -> [Integer] -> [[Integer]] -> [[Integer]]

-- primePartitions2 n k part full =
--   let primes = primesBetween (k+1) n
  
  
--   primePartitions3 n k part full p
--   if n == 0 then full++[part]
--   else
--     if n > k then
--       map (primePartitions3 n k part full) primes
--       primePartitions3 (n-p) p (part++[p])
--       else 

-- primePartitions n =
--   map (primePartitions2 n 1 [] []) (primesBetween 2 n)

-- primePartitions2 n k part full p =
--   if n == 0 then (full++[part])
--   else
--     if n > k then map (primePartitions2 (n-p) p (part++[p])) (primesBetween (k+1) n)
--     else []

-- ppr n k lst =
--   n | n == 0    = print lst
--     | n > k     = ppr n
--     | otherwise = print "end"

-- primePartitions :: Integer -> Integer -> [Integer] -> [Integer]

-- primePartitions n k lst =
--   if n == 0 then
--     lst
--   else
--     if n > k then
--       map (primePartitions2 n k lst) (primesBetween (k+1) n)
--     else []
    
-- primePartitions2 :: Integer -> Integer -> [Integer] -> Integer -> Integer

-- primePartitions2 n k lst p = 
--   primePartitions (n-p) p (lst++[p])

--  n = n - p
--  k = p
--  lst ++ [p]
--  if n == 0 then
--    print lst
--  else if n > k then
--    map (primePartitions2 n k lst) primesBetween (k+1) n

