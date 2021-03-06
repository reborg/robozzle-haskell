module Robozzle.HaskellSpec (main, spec) where

import Test.Hspec
import Robozzle.Haskell

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "basic facts" $ do
    it "if ship lies on only star, then it passes" $
      levelCompleted 0 [(0, 0)] "" `shouldBe` True
    it "if ship is somewhere else not on top of a star, it fails" $
      levelCompleted 1 [(0, 1)] "" `shouldBe` False
    it "if the ship moves then level completed" $
      levelCompleted 1 [(0, 1)] "f" `shouldBe` True
    it "if the ship moves but max number of moves is not achieved then fail" $
      levelCompleted 0 [(0, 1)] "f" `shouldBe` False
  describe "state computation" $ do
    it "return same state if no command left to execute" $ do
      nextState (ShipState (0,1) (0,0) "") `shouldBe` ShipState (0,1) (0,0) ""
      nextState (InitialState "rlfff") `shouldBe` ShipState (1,0) (0,0) "lfff"
    it "should move forward " $ do
      nextState (ShipState (0,1) (0,12) "f") `shouldBe` ShipState (0,1) (0,13) ""
      nextState (ShipState (0,1) (0,12) "ff") `shouldBe` ShipState (0,1) (0,13) "f"
      nextState (ShipState (0,-1) (0,12) "ff") `shouldBe` ShipState (0,-1) (0,11) "f"
      nextState (ShipState (-1,0) (8,9) "f") `shouldBe` ShipState (-1,0) (7,9) ""
    it "should turn" $ do
      nextState (ShipState (0,1) (0,0) "rrff") `shouldBe` ShipState (1,0) (0,0) "rff"
      nextState (ShipState (1,0) (0,0) "rrff") `shouldBe` ShipState (0,-1) (0,0) "rff"
      nextState (ShipState (0,1) (0,0) "llff") `shouldBe` ShipState (-1,0) (0,0) "lff"
      nextState (ShipState (-1,0) (0,0) "llff") `shouldBe` ShipState (0,-1) (0,0) "lff"

  describe "whishful programming, how the real thing should look like, but it's too big" $ do
    it "level completion rules" $ do
      levelCompleted withinMaxNumberOfMoves starsPositions shipCommands `shouldBe` True
      levelCompleted (withinMaxNumberOfMoves - 1) starsPositions shipCommands `shouldBe` False
        where
          withinMaxNumberOfMoves = 9
          starsPositions = [(-2, 0), (2, 0)]
          shipCommands = "rffllffff"
