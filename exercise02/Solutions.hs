main :: IO()
main = do

    print (myGCD 15 10)
    print (15 `myGCD` 10)
    print (div 12 5)
    print (12 `div` 5) -- 2
    print (12 `mod` 7) -- 5
    print ((+) 12 7)
    print (sumDigitsRec 1234)
    print (sumDigitsIter 1234)
    print (reverseNumber 1234)


--Task1
myGCD :: Int -> Int -> Int
myGCD a b
    | a == b    = a
    | a > b     = myGCD (a - b) b
    | otherwise = myGCD a (b - a)


--Task2
countDigits :: Int -> Int
countDigits n =
    if n < 10
    then 1
    else 1 + countDigits (n `div` 10)


--Task3
sumDigitsRec :: Int -> Int
sumDigitsRec n =
    if n < 10
    then n
    else (n `mod` 10) + sumDigitsRec (n `div` 10)



helper1 :: Int -> Int -> Int
helper1 res k =
    if k == 0
    then res
    else helper1 (res + k `mod` 10) (k `div` 10)

helper2 :: Int -> Int -> Int
helper2 res 0 = res
helper2 res k = helper2 (res + k `mod` 10) (k `div` 10)


--Task4
sumDigitsIter :: Int -> Int
sumDigitsIter n = helper2 0 n

sumDigitsIter1 :: Int -> Int
sumDigitsIter1 n = helper 0 n
 where
  helper res 0 = res
  helper res k = helper (res + k `mod` 10) (k `div` 10)


--Task5
-- 123
-- 321 = 3 * 10^2 + 2 * 10^1 + 1 * 10^0
-- 321 = ((0 * 10 + 3) * 10 + 2) * 10 + 1   
reverseNumber :: Integer -> Integer
reverseNumber n = helper 0 n
 where
  helper res 0 = res
  helper res k = helper (res * 10 + k `mod` 10) 