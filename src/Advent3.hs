module Advent3
  ( solve1,
    solve2,
  )
where

import Data.Char (ord)
import Data.Foldable (find)
import Data.List (sort)
import Data.Set (Set, empty, fromList, intersection, toList)
import qualified Data.Set as Set

solve1 :: IO ()
solve1 = interact (show . sum . map getValue . lines)

solve2 = interact (show . sum . map (valueFromChar . getCommonItem) . groupByThree . lines)

-- Part 2

groupByThree :: [String] -> [[String]]
groupByThree (a : b : c : rest) = [a, b, c] : groupByThree rest
groupByThree [] = []

getCommonItem :: [String] -> Char
getCommonItem (groupHead : groupTail) = head (toList (foldr intersection (fromList groupHead) (map fromList groupTail)))

-- Part 1

getValue :: [Char] -> Integer
getValue line = list2listDuplicateValue (toSetTuple (splitInHalf line))

splitInHalf :: [Char] -> ([Char], [Char])
splitInHalf line = (splitAt (length line `div` 2) line)

toSetTuple :: ([Char], [Char]) -> ([Char], [Char])
toSetTuple (x, y) = (toList (fromList x), toList (fromList y))

list2listDuplicateValue :: ([Char], [Char]) -> Integer
list2listDuplicateValue ([], _) = 0
list2listDuplicateValue (aHead : aTail, b) = char2listDuplicateValue aHead b + list2listDuplicateValue (aTail, b)

char2listDuplicateValue :: Char -> [Char] -> Integer
char2listDuplicateValue char (stringHead : stringTail) = valueFromPair char stringHead + char2listDuplicateValue char stringTail
char2listDuplicateValue _ [] = 0

valueFromPair :: Char -> Char -> Integer
valueFromPair x y = if x == y then valueFromChar x else 0

valueFromChar :: Char -> Integer
valueFromChar char = valueFromOrd (toInteger (ord char))

-- Lowercase item types a through z have priorities 1 through 26.
-- Uppercase item types A through Z have priorities 27 through 52.
valueFromOrd :: Integer -> Integer
valueFromOrd i = if i >= 97 then i -96 else i - 38
