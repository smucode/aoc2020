module Aoc exposing (..)

import Array
import Data


current : Int
current =
    day3_part2



-- 3b / 7560370818


day3_part2 =
    [ ( 1, 1 )
    , ( 1, 3 )
    , ( 1, 5 )
    , ( 1, 7 )
    , ( 2, 1 )
    ]
        |> List.map (\x -> day3_part1 x Data.topology)
        |> List.foldl (*) 1



-- 3a / 169


day3_part1 : ( Int, Int ) -> List (Array.Array String) -> number
day3_part1 ( colSkip, rowSkip ) topology =
    topology
        |> List.indexedMap
            (\i n ->
                if modBy colSkip i == 0 then
                    Just n

                else
                    Nothing
            )
        |> List.filterMap identity
        |> List.foldl
            (\topo ( x, trees ) ->
                let
                    next =
                        modBy (Array.length topo) (x + rowSkip)

                    nextTrees =
                        if Array.get x topo == Just "#" then
                            trees + 1

                        else
                            trees
                in
                ( next, nextTrees )
            )
            ( 0, 0 )
        |> Tuple.second



-- 2b / 605


puzzle2_part2 : Int
puzzle2_part2 =
    Data.passwords
        |> List.filter
            (\( ( a, b ), char, password ) ->
                password
                    |> String.split ""
                    |> Array.fromList
                    |> (\arr ->
                            [ Array.get (a - 1) arr == Just char
                            , Array.get (b - 1) arr == Just char
                            ]
                                |> List.filter identity
                                |> List.length
                                |> (==) 1
                       )
            )
        |> List.length



-- 2a / 556


puzzle2_part1 : Int
puzzle2_part1 =
    Data.passwords
        |> List.filterMap
            (\( ( min, max ), char, password ) ->
                password
                    |> String.split ""
                    |> List.filter ((==) char)
                    |> List.length
                    |> (\n ->
                            if n >= min && n <= max then
                                Just n

                            else
                                Nothing
                       )
            )
        |> List.length



-- 1b / 253928438


puzzle1_part2 : number
puzzle1_part2 =
    zip Data.data1 Data.data1
        |> List.filter (\( x, y ) -> x + y < 2020)
        |> zip Data.data1
        |> List.filterMap
            (\( x, ( y, z ) ) ->
                if x + y + z == 2020 then
                    Just <| x * y * z

                else
                    Nothing
            )
        |> List.head
        |> Maybe.withDefault 0



-- 1a / 1010884


puzzle1_part1 : number
puzzle1_part1 =
    zip Data.data1 Data.data1
        |> List.filterMap
            (\( x, y ) ->
                if x + y == 2020 then
                    Just <| x * y

                else
                    Nothing
            )
        |> List.head
        |> Maybe.withDefault -1


p1p1 : List number -> List number -> number
p1p1 l1 l2 =
    case ( List.head l1, List.head l2 ) of
        ( Just x1, Just x2 ) ->
            if x1 + x2 == 2020 then
                x1 * x2

            else
                p1p1 (List.drop 1 l1) l2

        ( Just _, Nothing ) ->
            0

        ( Nothing, Just _ ) ->
            p1p1 Data.data1 (List.drop 1 l2)

        ( Nothing, Nothing ) ->
            0


zip : List a -> List b -> List ( a, b )
zip l1 l2 =
    List.foldl (\x xs -> xs ++ List.map (\y -> ( x, y )) l2) [] l1
