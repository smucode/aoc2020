module AocTest exposing (..)

import Aoc
import Array
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "Advent of code"
        [ test "puzzle" <|
            \_ ->
                Expect.equal
                    Aoc.current
                    (Just 33558)
        ]
