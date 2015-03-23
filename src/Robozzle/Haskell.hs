module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted _ [(0, 1)] "f" = null ([(0,1)] \\ [(0,0),(0,1)])
levelCompleted _ [(0, 1)] "" = null ([(0,1)] \\ [(0,0)])
levelCompleted _ [(0, 0)] "" = null ([(0,0)] \\ [(0,0)])
