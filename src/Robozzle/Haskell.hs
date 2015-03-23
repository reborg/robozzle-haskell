module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

data ShipState = ShipState Direction Position [Command]
type Direction = (Int, Int)
type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted n ps cs = null (ps \\ take (n + 1) (shipTrail cs))

shipTrail :: [Command] -> [Position]
-- shipTrail "f" = [(0,0),(0,1)]
shipTrail "f" = map position [ShipState (0,1) (0,0) "f", ShipState (0,1) (0,1) ""]
shipTrail "" = [(0,0)]

position :: ShipState -> Position
position (ShipState _ p _) = p

{-
- take aways so far:
- nested ifs or conds are not used, pattern matching on specific constant is preferred
- pattern match are used from the most general _ matchall
- 'fake' _ matchall are then gradually removed, test by test, accounting for more conditions
- implementation is removing "constants" that are only good during initial phase
-}
