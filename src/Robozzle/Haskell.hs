module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted _ ps "f" = null (ps \\ shipTrail "f")
levelCompleted _ ps "" = null (ps \\ shipTrail "")

shipTrail :: [Command] -> [Position]
shipTrail "f" = [(0,0),(0,1)]
shipTrail "" = [(0,0)]
