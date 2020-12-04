module Aoc exposing (..)

import Array
import Data
import Dict
import Regex


current : Int
current =
    day4_part2



-- 4a


validators =
    [ ( "byr (Birth Year) - four digits; at least 1920 and at most 2002."
      , Dict.get "byr"
            >> Maybe.andThen String.toInt
            >> Maybe.andThen
                (\year ->
                    if year >= 1920 && year <= 2002 then
                        Just ()

                    else
                        Nothing
                )
      )
    , ( "iyr (Issue Year) - four digits; at least 2010 and at most 2020."
      , Dict.get "iyr"
            >> Maybe.andThen String.toInt
            >> Maybe.andThen
                (\year ->
                    if year >= 2010 && year <= 2020 then
                        Just ()

                    else
                        Nothing
                )
      )
    , ( "eyr (Expiration Year) - four digits; at least 2020 and at most 2030."
      , Dict.get "eyr"
            >> Maybe.andThen String.toInt
            >> Maybe.andThen
                (\year ->
                    if year >= 2020 && year <= 2030 then
                        Just ()

                    else
                        Nothing
                )
      )
    , ( """hgt (Height) - a number followed by either cm or in:
              If cm, the number must be at least 150 and at most 193.
              If in, the number must be at least 59 and at most 76."""
      , Dict.get "hgt"
            -->> Debug.log "hgt"
            >> Maybe.andThen
                (\hgt ->
                    if String.endsWith "cm" hgt then
                        hgt
                            |> String.replace "cm" ""
                            |> String.toInt
                            |> Maybe.andThen
                                (\cm ->
                                    if cm >= 150 && cm <= 193 then
                                        Just ()

                                    else
                                        Nothing
                                )

                    else if String.endsWith "in" hgt then
                        hgt
                            |> String.replace "in" ""
                            |> String.toInt
                            |> Maybe.andThen
                                (\n ->
                                    if n >= 59 && n <= 76 then
                                        Just ()

                                    else
                                        Nothing
                                )

                    else
                        Nothing
                )
        -->> Debug.log ""
      )
    , ( "hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f."
      , Dict.get "hcl"
            -->> Debug.log "hcl"
            >> Maybe.andThen
                (\hcl ->
                    let
                        hclRe =
                            Regex.fromStringWith { caseInsensitive = True, multiline = True } "\\#[0-9a-f]{6}"
                                |> Maybe.withDefault Regex.never
                    in
                    if Regex.contains hclRe hcl then
                        Just ()

                    else
                        Nothing
                )
      )
    , ( "ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth."
      , Dict.get "ecl"
            -->> Debug.log "ecl"
            >> Maybe.andThen
                (\ecl ->
                    if List.member ecl [ "amb", "blu", "brn", "gry", "grn", "hzl", "oth" ] then
                        Just ()

                    else
                        Nothing
                )
      )
    , ( "pid (Passport ID) - a nine-digit number, including leading zeroes."
      , Dict.get "pid"
            -->> Debug.log "pid"
            >> Maybe.andThen
                (\pid ->
                    let
                        pidRe =
                            Regex.fromStringWith { caseInsensitive = True, multiline = True } "^[0-9]{9}$"
                                |> Maybe.withDefault Regex.never
                    in
                    if Regex.contains pidRe pid then
                        Just ()

                    else
                        Nothing
                )
      )
    ]


day4_part2 =
    Data.passports
        |> Regex.split splitLines
        |> List.filterMap
            (Regex.split splitWhitespace
                >> List.map (String.split ":")
                >> List.filterMap
                    (\x ->
                        case x of
                            [ a, b ] ->
                                Just ( a, b )

                            _ ->
                                Nothing
                    )
                >> Dict.fromList
                >> (\dict ->
                        validators
                            |> List.map Tuple.second
                            |> List.filterMap (\validate -> validate dict)
                            |> (\l ->
                                    if List.length l == 7 then
                                        Just ()

                                    else
                                        Nothing
                               )
                   )
            )
        |> List.length


splitLines =
    Regex.fromStringWith { caseInsensitive = True, multiline = True } "\\n\\s*\\n"
        |> Maybe.withDefault Regex.never


splitWhitespace =
    Regex.fromStringWith { caseInsensitive = True, multiline = True } "\\s+"
        |> Maybe.withDefault Regex.never


f1 =
    [ "byr"
    , "iyr"
    , "eyr"
    , "hgt"
    , "hcl"
    , "ecl"
    , "pid"

    --, "cid"
    ]
        |> List.sort


f2 =
    [ "byr"
    , "iyr"
    , "eyr"
    , "hgt"
    , "hcl"
    , "ecl"
    , "pid"
    , "cid"
    ]
        |> List.sort



-- 230


day4_part1 =
    Data.passports
        |> Regex.split splitLines
        |> List.map
            (Regex.split splitWhitespace
                >> List.map (String.split ":")
                >> List.filterMap List.head
                >> List.filter (String.trim >> String.isEmpty >> not)
                >> List.sort
            )
        |> List.filter (\l -> l == f1 || l == f2)
        |> List.length



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
