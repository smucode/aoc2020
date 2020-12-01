module Aoc exposing (..)

import Data



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


p1p2Internal _ _ _ =
    List.unzip



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
