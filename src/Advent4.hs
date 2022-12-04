module Advent4
  ( solve1,
    solve2,
  )
where

import Data.List.Split (splitOn)

solve1 :: IO ()
solve1 = interact (show . sum . map (fromEnum . hasFullOverlap . parseLine) . lines)

solve2 = interact (show . sum . map (fromEnum . hasAnyOverlap . parseLine) . lines)

hasFullOverlap :: [Integer] -> Bool
hasFullOverlap (l1 : h1 : l2 : h2 : _) = (l1 <= l2 && h1 >= h2) || (l1 >= l2 && h1 <= h2)

hasAnyOverlap :: [Integer] -> Bool
hasAnyOverlap (l1 : h1 : l2 : h2 : _) = (l1 <= h2) && (h1 >= l2)

parseLine :: [Char] -> [Integer]
parseLine s = concatMap (map toInt . splitOn "-") (splitOn "," s)

toInt :: String -> Integer
toInt s = read s :: Integer
