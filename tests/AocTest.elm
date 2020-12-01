module AocTest exposing (..)

import Aoc
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "Advent of code"
        [ test "a1_1" <| \_ -> Expect.equal Aoc.puzzle1_part1 1010884
        , test "a1_2" <| \_ -> Expect.equal Aoc.puzzle1_part2 -1
        ]
