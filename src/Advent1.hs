module Advent1
  ( solve1,
    solve2,
  )
where

import Data.List (sort)

solve1 :: IO ()
solve1 = interact (show . maxValue . getElfValues)

solve2 :: IO ()
solve2 = interact (show . top3sum . getElfValues)

top3sum :: [Integer] -> Integer
top3sum (e1 : e2 : e3 : rest) = topNsum (sort [e1, e2, e3]) rest

-- | Given a empty list of n ints and another list, find the largest n ints and return their sum
topNsum :: [Integer] -> [Integer] -> Integer
topNsum (topHead : topTail) (element : listTail) = topNsum (sort (max topHead element : topTail)) listTail
topNsum topList _ = sum topList

maxValue :: [Integer] -> Integer
maxValue (firstElem : myList) = foldr max firstElem myList

getElfValues :: String -> [Integer]
getElfValues = sumElf . mapToInts . stripEmptyElves . groupByElf . lines

sumElf :: [[Integer]] -> [Integer]
sumElf = map sum

mapToInts :: [[String]] -> [[Integer]]
mapToInts = map (map (\myString -> read myString :: Integer))

stripEmptyElves :: [[String]] -> [[String]]
stripEmptyElves ([] : listOfLists) = stripEmptyElves listOfLists
stripEmptyElves listOfLists = listOfLists

groupByElf :: [String] -> [[String]]
groupByElf = groupByElf' []

groupByElf' :: [[String]] -> [String] -> [[String]]
groupByElf' acc [] = acc
groupByElf' acc ("" : stringListTail) = groupByElf' ([] : acc) stringListTail
groupByElf' (firstAccElement : restOfAcc) (someString : stringListTail) = groupByElf' ((someString : firstAccElement) : restOfAcc) stringListTail
groupByElf' [] myList = groupByElf' [[]] myList
