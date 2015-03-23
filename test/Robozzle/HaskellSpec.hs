module Robozzle.HaskellSpec (main, spec) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "what instead we can do is here" $
    it "next step" $
      True `shouldBe` True

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
