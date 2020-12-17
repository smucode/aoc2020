module HyperCube exposing
    ( Cell
    , HyperCube
    , initialize
    , mapNeighbours
    , values
    )

import Dict exposing (Dict)
import List.Extra as List


type alias Pt =
    ( ( Int, Int, Int ), Int )


type alias Cell a =
    ( Pt, Maybe a )


type alias HyperCube a =
    Dict Pt a


values : HyperCube a -> List a
values =
    Dict.values


plane : ( Int, Int, Int ) -> List ( Int, Int, Int )
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


plane3d : ( Int, Int, Int ) -> List ( Int, Int, Int )
plane3d ( x, y, z ) =
    List.concat
        [ plane ( x, y, z - 1 )
        , plane ( x, y, z )
        , plane ( x, y, z + 1 )
        ]


neighbours : Pt -> List Pt
neighbours ( ( x, y, z ), w ) =
    List.concat
        [ List.map (\p -> ( p, w - 1 )) (plane3d ( x, y, z ))
        , List.map (\p -> ( p, w )) (plane3d ( x, y, z ))
            |> List.filter ((/=) ( ( x, y, z ), w ))
        , List.map (\p -> ( p, w + 1 )) (plane3d ( x, y, z ))
        ]


mapNeighbours :
    (( Pt, Maybe a )
     -> List ( Pt, Maybe a )
     -> Maybe ( Pt, b )
    )
    -> HyperCube a
    -> HyperCube b
mapNeighbours fn cube =
    let
        allNeighbours : List ( Pt, Maybe a )
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


initialize : List (List a) -> HyperCube a
initialize list =
    list
        |> List.indexedMap
            (\x inner ->
                List.indexedMap (\y a -> ( ( ( x, y, 0 ), 0 ), a )) inner
            )
        |> List.concat
        |> Dict.fromList
