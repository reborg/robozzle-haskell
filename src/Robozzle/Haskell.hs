module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

data ShipState = ShipState Direction Position [Command]   -- this is a constructor def
               | InitialState [Command]                   -- and another one
type Direction = (Int, Int)
type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted n ps cs = null (ps \\ take (n + 1) (shipTrail cs))

shipTrail :: [Command] -> [Position]
shipTrail "f" = map position [InitialState "f", ShipState (0,1) (0,1) ""]
shipTrail "" = map position [InitialState ""]

position :: ShipState -> Position
position (InitialState _) = (0,0)
position (ShipState _ p _) = p

{-
- take aways so far:
- nested ifs or conds are not used, pattern matching on specific constant is preferred
- pattern match are used from the most general _ matchall
- 'fake' _ matchall are then gradually removed, test by test, accounting for more conditions
- implementation is removing "constants" that are only good during initial phase
- creates type alias and structured data at will (much easier for wishful programming than clj)
-}
