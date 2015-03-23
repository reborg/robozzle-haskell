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
