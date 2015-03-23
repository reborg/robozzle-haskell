# robozzle-haskell

Thanks https://vimeo.com/8445870, enjoyed the steady flow.

Some notes of what I've observed:

* nested ifs or conds are not used, pattern matching on specific constant is preferred
* pattern match are used from the most general _ matchall
* 'fake' _ matchall are then gradually removed, test by test, accounting for more conditions
* implementation is removing "constants" that are only good during initial phase
* extract function always use pattern match constant for place where it was extracted from
* creates type alias and structured data at will (much easier for wishful programming than clj)
* sometimes working on abstractions, like from pairs to mapping positions, or nextState given another state
* refactoring: hierarchical fn calls are mutated into composition and partial application to remove parenth
* refactoring: multiple pattern matching on same thing can be made a conditional single pattern matching

## Installation

        cabal sandbox init
        cabal install hspec
        cabal configure --enable-tests && cabal build

## Usage

        cabal test
