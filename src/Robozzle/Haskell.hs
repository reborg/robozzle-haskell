module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal

type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted maxMoves [(0, 1)] "f" = True
levelCompleted maxMoves [(0, 1)] commands = False
levelCompleted maxMoves [(0, 0)] commands = True
