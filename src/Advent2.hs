module Advent2
  ( solve1,
    solve2,
  )
where

import Data.List (sort)

solve1 :: IO ()
solve1 = interact (show . sum . map (scoreForRound . toActionTuple) . lines)

solve2 = interact (show . sum . map (scoreForRound . replacePlayerAction . toActionTuple) . lines)

-- Replace outcome XYZ with player action XYZ
replacePlayerAction :: (Char, Char) -> (Char, Char)
replacePlayerAction (opponent, 'X') = (opponent, getLoseMove opponent)
replacePlayerAction (opponent, 'Y') = (opponent, getDrawMove opponent)
replacePlayerAction (opponent, 'Z') = (opponent, getWinMove opponent)

getLoseMove 'A' = 'Z'
getLoseMove 'B' = 'X'
getLoseMove 'C' = 'Y'

getDrawMove 'A' = 'X'
getDrawMove 'B' = 'Y'
getDrawMove 'C' = 'Z'

getWinMove 'A' = 'Y'
getWinMove 'B' = 'Z'
getWinMove 'C' = 'X'

toActionTuple (a : _space : b : _nothing) = (a, b)

scoreForRound :: (Char, Char) -> Integer
scoreForRound (opponent, player) = scoreFromAction player + scoreFromOutcome (opponent, player)

scoreFromAction 'X' = 1
scoreFromAction 'Y' = 2
scoreFromAction 'Z' = 3

winPoints = 6
drawPoints = 3
losePoints = 0

scoreFromOutcome :: (Char, Char) -> Integer
scoreFromOutcome (opponent, player) = if isDraw (opponent, player) then drawPoints else scoreFromNonDrawOutcome (opponent, player)
scoreFromNonDrawOutcome ('A', 'Y') = winPoints
scoreFromNonDrawOutcome ('B', 'Z') = winPoints
scoreFromNonDrawOutcome ('C', 'X') = winPoints
scoreFromNonDrawOutcome (_, _) = losePoints

isDraw ('A', 'X') = True
isDraw ('B', 'Y') = True
isDraw ('C', 'Z') = True
isDraw _ = False
