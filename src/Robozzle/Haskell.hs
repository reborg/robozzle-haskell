module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted _ ps "f" = null (ps \\ [(0,0),(0,1)])
levelCompleted _ ps "" = null (ps \\ [(0,0)])
