import Data.List
-- https://hackage.haskell.org/package/base-4.12.0.0/docs/Data-List.html

main :: IO()
main = do

    print (count [1..10])
    print (count [1.1, 1.2, 1.3])
    print (sum1 [1.1, 1.2, 1.3])
    print (member 2.1 [1.1, 2.1, 3.1])
    print (null [])
    print (1:[2,3])        -- [1,2,3]
    print ([1,2] ++ [2,3]) -- [1,2,3,4]
    print (head [1, 2, 3])
    print (tail [1, 2, 3])
    print (nub [1,2,2,3])
    print (isPrime 20)
    print (generatePrimes 1 100)
    print (removeFirst 2 [1,2,3])


--Task1
count :: [a] -> Int
count []     = 0
count (_:xs) = 1 + count xs


--Task2
sum1 :: Num t => [t] -> t
sum1 []     = 0
sum1 (x:xs) = x + sum1 xs

-- Num -> +, -, *, ...
-- Eq  -> ==
-- Ord -> <, >, ...


--Task3
member :: Eq t => t -> [t] -> Bool
member _ []     = False
member z (x:xs) = z == x || member z xs


--Task4
isPrime :: Int -> Bool
isPrime n = [1, n] == [d | d <- [1..n], mod n d == 0]

generatePrimes :: Int -> Int -> [Int]
generatePrimes a b = [k | k <- [a..b], isPrime k]


--Task5
removeFirst :: Eq t => t -> [t] -> [t]
removeFirst _ []     = []
removeFirst z (x:xs) =
    if z == x then xs else x : (removeFirst z xs)

-- removeFirst 2 [0, 1, 2, 3] -> 0 : (removeFirst 2 [1, 2, 3])
-- -> 0 : 1 : (removeFirst 2 [2, 3]) -> 0 : 1 : [3]
-- -> 0 : [1, 3] -> [0, 1, 3]


--Task6
removeAll :: Eq t => t -> [t] -> [t]
removeAll _ []     = []
removeAll z (x:xs) =
    if z == x then (removeAll z xs) else x : (removeAll z xs)

removeAll1 :: Eq t => t -> [t] -> [t]
removeAll1 z xs = [x | x <- xs, x /= z]

removeAll2 :: Eq t => t -> [t] -> [t]
removeAll2 z xs
    | null xs      = []
    | z == head xs = removeAll2 z (tail xs)
    | otherwise    = (head xs) : removeAll2 z (tail xs)


--Task7
incrementAllBy :: [Int] -> Int -> [Int]
incrementAllBy xs z = [x + z | x <- xs]