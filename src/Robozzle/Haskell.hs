module Robozzle.Haskell
  where

import Robozzle.Haskell.Internal
import Data.List

data ShipState = ShipState Direction Position [Command]   -- this is a constructor def
               | InitialState [Command]                   -- and another one
               deriving (Eq, Show)                        -- by deriving we get the "show" feature and comparison
type Direction = (Int, Int)
type Position = (Int, Int)
type Command = Char

levelCompleted :: Int -> [Position] -> [Command] -> Bool
levelCompleted n ps cs = null (ps \\ take (n + 1) (shipTrail cs))

shipTrail :: [Command] -> [Position]
shipTrail = map position . iterate nextState . InitialState

position :: ShipState -> Position
position (InitialState _) = (0,0)
position (ShipState _ p _) = p

nextState :: ShipState -> ShipState
nextState (InitialState cs) = nextState (ShipState (0,1) (0,0) cs)
nextState (ShipState (dx,dy) (x,y) (c:cs))
  | c == 'f' = ShipState (dx,dy) ((x + dx),(y + dy)) cs
  | c == 'r' = ShipState (dy,-dx) ((x),(y)) cs
  | c == 'l' = ShipState (-dy,dx) ((x),(y)) cs
nextState s = s

{-
- take aways so far:
- nested ifs or conds are not used, pattern matching on specific constant is preferred
- pattern match are used from the most general _ matchall
- 'fake' _ matchall are then gradually removed, test by test, accounting for more conditions
- implementation is removing "constants" that are only good during initial phase
- extract function always use pattern match constant for place where it was extracted from
- creates type alias and structured data at will (much easier for wishful programming than clj)
- sometimes working on abstractions, like from pairs to mapping positions, or nextState given another state
- refactoring: hierarchical fn calls are mutated into composition and partial application to remove parenth
- refactoring: multiple pattern matching on same thing can be made a conditional single pattern matching
-}
