module InfiniCube exposing
    ( Cell
    , InfiniCube
    , initialize
    , mapNeighbours
    , values
    )

import Dict exposing (Dict)
import List.Extra as List


type alias Cell a =
    ( ( Int, Int, Int ), Maybe a )


type alias InfiniCube a =
    Dict ( Int, Int, Int ) a


values : InfiniCube a -> List a
values =
    Dict.values


plane ( x, y, z ) =
    [ ( x, y, z )
    , ( x - 1, y, z )
    , ( x + 1, y, z )
    , ( x, y - 1, z )
    , ( x - 1, y - 1, z )
    , ( x + 1, y - 1, z )
    , ( x, y + 1, z )
    , ( x - 1, y + 1, z )
    , ( x + 1, y + 1, z )
    ]


neighbours : ( Int, Int, Int ) -> List ( Int, Int, Int )
neighbours ( x, y, z ) =
    List.concat
        [ plane ( x, y, z - 1 )
        , plane ( x, y, z ) |> List.filter ((/=) ( x, y, z ))
        , plane ( x, y, z + 1 )
        ]


mapNeighbours :
    (( ( Int, Int, Int ), Maybe a )
     -> List ( ( Int, Int, Int ), Maybe a )
     -> Maybe ( ( Int, Int, Int ), b )
    )
    -> InfiniCube a
    -> InfiniCube b
mapNeighbours fn cube =
    let
        allNeighbours : List ( ( Int, Int, Int ), Maybe a )
        allNeighbours =
            cube
                |> Dict.keys
                |> List.concatMap neighbours
                |> List.unique
                |> List.map (\k -> ( k, Dict.get k cube ))

        allCells =
            cube
                |> Dict.toList
                |> List.map (Tuple.mapSecond Just)
    in
    [ allNeighbours, allCells ]
        |> List.concat
        |> List.filterMap
            (\( k, v ) ->
                fn
                    ( k, v )
                    (neighbours k |> List.map (\k_ -> ( k_, Dict.get k_ cube )))
            )
        |> Dict.fromList


initialize : List (List a) -> InfiniCube a
initialize list =
    list
        |> List.indexedMap
            (\x inner ->
                List.indexedMap (\y a -> ( ( x, y, 0 ), a )) inner
            )
        |> List.concat
        |> Dict.fromList
