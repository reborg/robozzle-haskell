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
    it "return same state if no command left to execute" $
      nextState (ShipState (0,1) (0,0) "") `shouldBe` ShipState (0,1) (0,0) ""
    it "should move forward one step" $
      nextState (ShipState (0,1) (0,12) "f") `shouldBe` ShipState (0,1) (0,13) ""

-- spec :: Spec
-- spec =
--   describe "whishful programming, how the real thing should look like, but it's too big" $
--     it "level completion rules" $
--       levelCompleted withinMaxNumberOfMoves starsPositions shipCommands `shouldBe` True
--       levelCompleted (withinMaxNumberOfMoves - 1) starsPositions shipCommands `shouldBe` True
--         where
--           withinMaxNumberOfMoves = 9
--           starsPositions = [(-2, 0), (2, 0)]
--           shipCommands = "rffllffff"
