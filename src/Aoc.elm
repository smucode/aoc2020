module Aoc exposing (..)

import Array exposing (Array)
import Data
import Dict exposing (Dict)
import HyperCube
import InfiniCube
import List.Extra as List
import Parser exposing ((|.), (|=), Parser, end, int, succeed, symbol)
import Pratt exposing (infixLeft, literal)
import Regex
import Set



--1717001
--523731


current : Maybe Int
current =
    Just <| d25 1717001 523731 1 1



-- 25


d25 : Int -> Int -> Int -> Int -> Int
d25 card door target key =
    if target == door then
        key

    else
        d25 1717001
            523731
            (modBy 20201227 (target * 7))
            (modBy 20201227 (key * card))



--while (target !== door) {
--  target = (target * 7) % 20201227;
--  key = (key * card) % 20201227;
--}



--console.log(key)
-- d24


d24 : String -> Maybe Int
d24 =
    Regex.split splitLines
        >> d24Int


d24Int : List String -> Maybe Int
d24Int tiles_ =
    tiles_
        |> List.foldl (\x xs -> move (String.split "" x) ( 0, 0 ) xs) Dict.empty
        |> (\t ->
                List.range 1 100
                    |> List.foldl
                        (\_ tiles ->
                            tiles
                        )
                        t
           )
        |> Dict.values
        |> List.count ((==) Black)
        |> Just


type Color
    = Black


move : List String -> ( Int, Int ) -> Dict ( Int, Int ) Color -> Dict ( Int, Int ) Color
move str ( x, y ) dict =
    case str of
        [] ->
            Dict.update ( x, y )
                (\v ->
                    if v == Just Black then
                        Nothing

                    else
                        Just Black
                )
                dict

        "e" :: rest ->
            move rest ( x + 1, y ) dict

        "s" :: "e" :: rest ->
            move rest ( x, y - 1 ) dict

        "s" :: "w" :: rest ->
            move rest ( x - 1, y - 1 ) dict

        "w" :: rest ->
            move rest ( x - 1, y ) dict

        "n" :: "w" :: rest ->
            move rest ( x, y + 1 ) dict

        "n" :: "e" :: rest ->
            move rest ( x + 1, y + 1 ) dict

        _ ->
            Debug.todo "💥"



-- d22a


d22a cards_ =
    let
        cards =
            cards_
                |> Regex.split splitDoubleNewline
                |> (\x ->
                        case x of
                            [ p1, p2 ] ->
                                ( p1
                                    |> Regex.split splitLines
                                    |> List.drop 1
                                    |> List.filterMap String.toInt
                                , p2
                                    |> Regex.split splitLines
                                    |> List.drop 1
                                    |> List.filterMap String.toInt
                                )

                            _ ->
                                ( [], [] )
                   )

        playRound (( d1, d2 ) as decks) cache =
            if Dict.member decks cache then
                ( d1 ++ d2, [] )

            else
                let
                    updatedCache =
                        Dict.insert decks () cache
                in
                case decks of
                    ( p1Card :: p1Deck, p2Card :: p2Deck ) ->
                        if List.length p1Deck >= p1Card && List.length p2Deck >= p2Card then
                            case playRound ( List.take p1Card p1Deck, List.take p2Card p2Deck ) Dict.empty of
                                ( _, [] ) ->
                                    playRound ( p1Deck ++ [ p1Card, p2Card ], p2Deck ) updatedCache

                                ( [], _ ) ->
                                    playRound ( p1Deck, p2Deck ++ [ p2Card, p1Card ] ) updatedCache

                                _ ->
                                    Debug.todo "💥"

                        else if p1Card > p2Card then
                            playRound ( p1Deck ++ [ p1Card, p2Card ], p2Deck ) updatedCache

                        else
                            playRound ( p1Deck, p2Deck ++ [ p2Card, p1Card ] ) updatedCache

                    _ ->
                        decks
    in
    playRound cards Dict.empty
        |> (\( a, b ) -> a ++ b)
        |> List.reverse
        |> List.indexedMap (\i a -> (i + 1) * a)
        |> List.sum
        |> Just



-- 21


d21a foods_ =
    let
        foods =
            foods_
                |> Regex.split splitLines
                |> List.map (String.split "(contains")
                |> List.filterMap
                    (\l ->
                        case l of
                            [ ing, alg ] ->
                                Just
                                    ( ing
                                        |> String.trim
                                        |> String.split " "
                                        |> List.map String.trim
                                    , alg
                                        |> String.trim
                                        |> String.replace ")" ""
                                        |> String.split ", "
                                    )

                            _ ->
                                Nothing
                    )

        --|> Debug.log "parsed"
        allergens =
            foods
                |> List.concatMap Tuple.second
                |> List.unique

        ingredients =
            foods
                |> List.concatMap Tuple.first

        --|> Debug.log "allergens"
        byAllergen : List ( String, List String )
        byAllergen =
            allergens
                |> List.map
                    (\allergen ->
                        foods
                            |> List.filterMap
                                (\( f, a ) ->
                                    if List.member allergen a then
                                        Just <| Set.fromList f

                                    else
                                        Nothing
                                )
                            |> (\l ->
                                    case l of
                                        [] ->
                                            Set.empty

                                        [ a ] ->
                                            a

                                        a :: as_ ->
                                            List.foldl Set.intersect a as_
                               )
                            |> Set.toList
                            |> Tuple.pair allergen
                    )
                |> Debug.log "byAllergen"

        uniqueByAllergenHelp byAllergen_ ided =
            case byAllergen_ of
                [] ->
                    ided

                ( x, [ y ] ) :: xs ->
                    uniqueByAllergenHelp
                        (xs |> List.map (Tuple.mapSecond (List.filter ((/=) y))))
                        (( x, y ) :: ided)

                x :: xs ->
                    uniqueByAllergenHelp (xs ++ [ x ]) <| ided

        uniqueByAllergen =
            uniqueByAllergenHelp byAllergen []
                |> Debug.log "uniqueByAllergen"

        withAllergens =
            byAllergen
                |> List.concatMap Tuple.second
                |> Debug.log "with allergens"

        noAllergens =
            ingredients
                |> List.filter (\x -> not <| List.member x withAllergens)

        --|> Debug.log "no allergens"
    in
    uniqueByAllergen
        |> List.sortBy Tuple.first
        |> List.map Tuple.second
        |> String.join ","
        |> Debug.log "RESULT"
        |> always (Just 21)



-- 20


d20a data =
    let
        tiles : List ( Int, List String )
        tiles =
            d20parser data

        edges : List ( Int, List String )
        edges =
            tiles
                |> List.map (Tuple.mapSecond getSides)
                |> Debug.log "EDDGES"

        neighbors : List ( Int, List String )
        neighbors =
            edges
                |> List.map
                    (\( k, es ) ->
                        ( k
                        , es
                            |> List.filter
                                (\e ->
                                    List.any
                                        (\( k2, es2 ) ->
                                            k2 /= k && (List.member e es2 || List.member (String.reverse e) es2)
                                        )
                                        edges
                                )
                        )
                    )
    in
    neighbors
        |> List.filter (\( k, es ) -> List.length es == 2)
        |> List.map Tuple.first
        |> List.foldl (*) 1
        |> Just


getSides : List String -> List String
getSides tile =
    let
        transposed =
            tile
                |> List.map (String.split "")
                |> List.transpose
                |> List.map (String.join "")
    in
    List.filterMap identity
        [ List.head transposed |> Maybe.map String.reverse
        , List.head tile
        , List.head (List.reverse transposed)
        , List.head (List.reverse tile) |> Maybe.map String.reverse
        ]


splitDoubleNewline =
    Regex.fromString "\\n\\n"
        |> Maybe.withDefault Regex.never


d20parser : String -> List ( Int, List String )
d20parser data =
    data
        |> Regex.split splitDoubleNewline
        |> List.map (Regex.split splitLines)
        |> List.filterMap
            (\strs ->
                case strs of
                    first :: rest ->
                        first
                            |> String.replace "Tile " ""
                            |> String.replace ":" ""
                            |> String.toInt
                            |> Maybe.map (\id -> ( id, rest ))

                    _ ->
                        Nothing
            )



-- 19


d19a rules_ messages_ =
    let
        rules : Dict Int (List (List String))
        rules =
            rules_
                |> Regex.split splitLines
                |> List.map (String.trim >> String.split ":")
                |> List.filterMap
                    (\parts ->
                        case parts of
                            [ k, v ] ->
                                k
                                    |> String.toInt
                                    |> Maybe.map (\n -> ( n, String.trim v ))

                            _ ->
                                Nothing
                    )
                |> List.map
                    (\( k, v ) ->
                        ( k
                        , v
                            |> String.split "|"
                            |> List.map (String.trim >> String.split " ")
                        )
                    )
                |> Dict.fromList

        expand : Int -> List (List String) -> String
        expand depth values =
            if depth > 20 then
                ""

            else
                values
                    |> List.map
                        (List.map
                            (\v ->
                                case String.toInt v of
                                    Just n ->
                                        rules
                                            |> Dict.get n
                                            |> Maybe.map (expand <| depth + 1)
                                            |> Maybe.withDefault ""

                                    Nothing ->
                                        v |> String.replace "\"" ""
                            )
                            >> String.join ""
                        )
                    |> String.join "|"
                    |> (\x ->
                            if List.length values > 1 then
                                "(" ++ x ++ ")"

                            else
                                x
                       )

        messages =
            messages_
                |> Regex.split splitLines
                |> List.map String.trim

        regex =
            rules
                |> Dict.get 0
                |> Maybe.map (expand 0)
                |> Maybe.map (\x -> "^(" ++ x ++ ")$")
    in
    regex
        |> Maybe.andThen Regex.fromString
        |> Maybe.map
            (\re ->
                messages
                    |> List.filter (Regex.contains re)
                    |> List.length
            )



-- 18a


d18a str =
    str
        |> Regex.split splitLines
        |> List.filterMap parse
        |> List.sum
        |> Just


mathExpression : Parser Int
mathExpression =
    Pratt.expression
        { oneOf =
            [ literal int
            , parenthesizedExpression
            ]
        , andThenOneOf =
            [ infixLeft 2 (symbol "+") (+)
            , infixLeft 1 (symbol "*") (*)
            ]
        , spaces = Parser.spaces
        }


parenthesizedExpression : Pratt.Config Int -> Parser Int
parenthesizedExpression config =
    succeed identity
        |. symbol "("
        |= Pratt.subExpression 0 config
        |. symbol ")"


parser : Parser Int
parser =
    succeed identity
        |= mathExpression
        |. end


parse : String -> Maybe Int
parse expr =
    Parser.run parser expr
        |> Result.toMaybe



-- 17b  /1680


d17b sat =
    let
        cube =
            HyperCube.initialize sat
    in
    List.range 1 6
        |> List.foldl
            (\_ c ->
                HyperCube.mapNeighbours
                    (\( k, maybeValue ) n ->
                        let
                            num =
                                n
                                    |> List.filter (Tuple.second >> (==) (Just "#"))
                                    |> List.length
                        in
                        case maybeValue of
                            Just "#" ->
                                if num == 2 || num == 3 then
                                    Just ( k, "#" )

                                else
                                    Nothing

                            _ ->
                                if num == 3 then
                                    Just ( k, "#" )

                                else
                                    Nothing
                    )
                    c
            )
            cube
        |> HyperCube.values
        |> List.filterMap
            (\v ->
                if v == "#" then
                    Just "#"

                else
                    Nothing
            )
        |> List.length
        |> Just



-- 17a


d17a sat =
    let
        cube =
            InfiniCube.initialize sat
    in
    List.range 1 6
        |> List.foldl
            (\_ c ->
                InfiniCube.mapNeighbours
                    (\( k, maybeValue ) n ->
                        let
                            num =
                                n
                                    |> List.filter (Tuple.second >> (==) (Just "#"))
                                    |> List.length
                        in
                        case maybeValue of
                            Just "#" ->
                                if num == 2 || num == 3 then
                                    Just ( k, "#" )

                                else
                                    Nothing

                            _ ->
                                if num == 3 then
                                    Just ( k, "#" )

                                else
                                    Nothing
                    )
                    c
            )
            cube
        |> InfiniCube.values
        |> List.filterMap
            (\v ->
                if v == "#" then
                    Just "#"

                else
                    Nothing
            )
        |> List.length
        |> Just



-- 16 b


d16_b :
    List ( String, ( ( Int, Int ), ( Int, Int ) ) )
    -> List Int
    -> List (List Int)
    -> Maybe Int
d16_b validRanges myTicket nearbyTickets_ =
    let
        allRanges : List ( Int, Int )
        allRanges =
            validRanges
                |> List.map Tuple.second
                |> List.concatMap (\( a, b ) -> [ a, b ])

        isFieldInvalid : Int -> Bool
        isFieldInvalid n =
            List.all
                (\( mn, mx ) -> not (n >= mn && n <= mx))
                allRanges

        nearbyTicketsWithoutInvalid : List (List Int)
        nearbyTicketsWithoutInvalid =
            nearbyTickets_
                |> List.filter (\fields -> not <| List.any isFieldInvalid fields)

        nearbyTicketsByCategory : List (List Int)
        nearbyTicketsByCategory =
            nearbyTicketsWithoutInvalid
                |> List.transpose

        _ =
            Debug.log "validity" ( List.length nearbyTickets_, List.length nearbyTicketsWithoutInvalid )

        _ =
            Debug.log "ranges/tix" ( List.length validRanges, List.length nearbyTicketsByCategory )

        assignCats nearby ranges result =
            case nearby of
                ( idx, cats ) :: rest ->
                    let
                        matches =
                            List.filter
                                (\( _, ( ( min1, max1 ), ( min2, max2 ) ) ) ->
                                    List.all
                                        (\c -> (c >= min1 && c <= max1) || (c >= min2 && c <= max2))
                                        cats
                                )
                                ranges
                    in
                    case matches of
                        [] ->
                            Debug.todo "0, really?"

                        [ ( cat, _ ) ] ->
                            assignCats
                                rest
                                (List.filter (Tuple.first >> (/=) cat) ranges)
                                (Array.set idx cat result)

                        n ->
                            assignCats
                                (rest ++ [ ( idx, cats ) ])
                                ranges
                                result

                [] ->
                    result

        assigned : Array String
        assigned =
            assignCats
                (List.indexedMap (\i x -> ( i, x )) nearbyTicketsByCategory)
                validRanges
                (Array.initialize (List.length validRanges) (always ""))

        _ =
            Debug.log "assigned" <| List.zip myTicket <| Array.toList assigned
    in
    assigned
        |> Array.toList
        |> List.zip myTicket
        |> List.filter (\( _, cat ) -> String.contains "departure" cat)
        |> List.map Tuple.first
        |> List.foldl (*) 1
        |> Just



-- 16 / 28882


d16_a ranges nearby =
    nearby
        |> List.filter (\n -> List.all (\( mn, mx ) -> not (n >= mn && n <= mx)) ranges)
        |> List.sum
        |> Just



-- 62714


d15 : Maybe Int
d15 =
    let
        start =
            [ 2, 0, 1, 9, 5, 19 ]
    in
    Just <|
        day15_part1
            (start
                |> List.take (List.length start - 1)
                |> List.indexedMap (\i n -> ( n, i + 1 ))
                |> Dict.fromList
            )
            (start |> List.reverse |> List.head)
            (List.length start)



-- day15 a


day15_part1 : Dict Int Int -> Maybe Int -> Int -> Int
day15_part1 cache lastSpoken_ prevTurn =
    case lastSpoken_ of
        Just lastSpoken ->
            if prevTurn == 30000000 then
                lastSpoken

            else
                let
                    turn =
                        prevTurn + 1
                in
                case Dict.get lastSpoken cache of
                    Just when ->
                        let
                            speak =
                                (turn - 1) - when
                        in
                        day15_part1
                            (Dict.insert lastSpoken (turn - 1) cache)
                            (Just speak)
                            turn

                    Nothing ->
                        day15_part1
                            (Dict.insert lastSpoken (turn - 1) cache)
                            (Just 0)
                            turn

        _ ->
            0



-- 14 b
-- 3564822193820


day14_part2 data =
    List.foldl fp2 ( Dict.empty, "" ) data
        |> Tuple.first
        |> Dict.values
        |> List.map fromBinary
        |> List.sum
        |> Just


fp2 :
    ( String, String )
    -> ( Dict Int (Array Int), String )
    -> ( Dict Int (Array Int), String )
fp2 ( instr, value ) ( dict, mask_ ) =
    case ( String.toInt instr, String.toInt value ) of
        ( Just addr, Just num ) ->
            let
                addrs =
                    getAddrs
                        (Array.toList <| toBinary addr)
                        (String.split "" mask_)
                        [ [] ]
                        |> List.foldl
                            (\x xs ->
                                Dict.insert
                                    (fromBinary <| Array.fromList x)
                                    (toBinary num)
                                    xs
                            )
                            dict
            in
            ( addrs
            , mask_
            )

        _ ->
            ( dict, value )


getAddrs : List Int -> List String -> List (List Int) -> List (List Int)
getAddrs addr mask_ addrs =
    case ( addr, mask_ ) of
        ( x :: xs, y :: ys ) ->
            case y of
                "0" ->
                    -- unchanged
                    getAddrs xs ys <|
                        List.map (\a -> a ++ [ x ]) addrs

                "1" ->
                    -- 1
                    getAddrs xs ys <|
                        List.map (\a -> a ++ [ 1 ]) addrs

                _ ->
                    -- floating
                    getAddrs xs ys <|
                        List.concat
                            [ List.map (\a -> a ++ [ 0 ]) addrs
                            , List.map (\a -> a ++ [ 1 ]) addrs
                            ]

        _ ->
            addrs



-- 14 / 7997531787333


day14_part1 : List ( String, String ) -> Maybe Int
day14_part1 data =
    List.foldl
        (\( instr, value ) ( dict, mask_ ) ->
            case ( String.toInt instr, String.toInt value ) of
                ( Just pos, Just n ) ->
                    ( Dict.insert pos
                        (mask (toBinary n) mask_)
                        dict
                    , mask_
                    )

                _ ->
                    -- its a mask
                    ( dict, value )
        )
        ( Dict.empty, "" )
        data
        |> Tuple.first
        |> Dict.values
        |> List.map fromBinary
        |> List.sum
        |> Just


mask : Array Int -> String -> Array Int
mask value mask_ =
    mask_
        |> String.split ""
        |> List.map String.toInt
        |> List.zip (Array.toList value)
        |> List.map
            (\( v, m ) ->
                m
                    |> Maybe.map identity
                    |> Maybe.withDefault v
            )
        |> Array.fromList


fromBinary : Array Int -> Int
fromBinary arr =
    fromBinaryInternal arr (Array.length arr - 1) 0


fromBinaryInternal : Array Int -> Int -> Int -> Int
fromBinaryInternal arr idx res =
    case Array.get idx arr of
        Just n ->
            let
                m =
                    case Array.length arr - idx - 1 of
                        0 ->
                            1

                        x ->
                            2 ^ x
            in
            fromBinaryInternal
                arr
                (idx - 1)
                ((m * n) + res)

        Nothing ->
            res


toBinary : Int -> Array Int
toBinary n =
    toBinaryInternal n (36 - 1) <|
        Array.initialize 36 (always 0)


toBinaryInternal : Int -> Int -> Array Int -> Array Int
toBinaryInternal n idx arr =
    if n == 0 then
        arr

    else
        toBinaryInternal
            (n // 2)
            (idx - 1)
            (Array.set idx (modBy 2 n) arr)



--13


day13_part2 ( _, str ) =
    let
        sched =
            str
                |> String.split ","
                |> List.indexedMap
                    (\i s ->
                        String.toInt s
                            |> Maybe.map (\n -> ( i, n ))
                    )
                |> List.filterMap identity

        max =
            sched
                |> List.map Tuple.second
                |> List.maximum
    in
    Maybe.map (\m -> d13b m sched 1) max


d13b : Int -> List ( Int, Int ) -> Int -> Int
d13b departure schedules step =
    case schedules of
        ( offset, bus ) :: rest ->
            if modBy bus (departure + offset) == 0 then
                d13b departure rest (step * bus)

            else
                d13b (departure + step) schedules step

        [] ->
            departure



--2215


day13_part1 ( time, str ) =
    let
        sched =
            str
                |> String.split ","
                |> List.filterMap String.toInt
    in
    d13 time sched


d13 time sched =
    sched
        |> List.map (\s -> ( s, firstAfter time s 0 ))
        |> List.sortBy Tuple.second
        |> List.head
        |> Maybe.map (\( bus, delta ) -> bus * delta)


firstAfter target bus time =
    if time > target then
        time - target

    else
        firstAfter target bus (time + bus)



--13a
--12b 62045


day12_part2 =
    Data.nav
        |> List.foldl
            (\( d, amount ) ( ( north, east ) as wp, ( shipNorth, shipEast ) as ship ) ->
                case d of
                    "N" ->
                        ( ( north + amount, east ), ship )

                    "S" ->
                        ( ( north - amount, east ), ship )

                    "E" ->
                        ( ( north, east + amount ), ship )

                    "W" ->
                        ( ( north, east - amount ), ship )

                    "L" ->
                        case modBy 4 (amount // 90) of
                            0 ->
                                ( ( north, east ), ship )

                            1 ->
                                ( ( east, -north ), ship )

                            2 ->
                                ( ( -north, -east ), ship )

                            3 ->
                                ( ( -east, north ), ship )

                            _ ->
                                Debug.todo "💥"

                    "R" ->
                        case modBy 4 (amount // 90) of
                            0 ->
                                ( ( north, east ), ship )

                            1 ->
                                ( ( -east, north ), ship )

                            2 ->
                                ( ( -north, -east ), ship )

                            3 ->
                                ( ( east, -north ), ship )

                            _ ->
                                Debug.todo "💥"

                    "F" ->
                        ( ( north, east ), ( shipNorth + (north * amount), shipEast + (east * amount) ) )

                    _ ->
                        ( ( north, east ), ship )
            )
            ( ( 1, 10 ), ( 0, 0 ) )
        |> (\( _, ( north, east ) ) -> abs north + abs east)
        |> Just



-- 12a -1710


day12_part1 =
    Data.nav
        |> List.foldl
            (\( d, amount ) ( facing, n, e ) ->
                case d of
                    "N" ->
                        ( facing, n + amount, e )

                    "S" ->
                        ( facing, n - amount, e )

                    "E" ->
                        ( facing, n, e + amount )

                    "W" ->
                        ( facing, n, e - amount )

                    "L" ->
                        ( facing - amount, n, e )

                    "R" ->
                        ( facing + amount, n, e )

                    "F" ->
                        if facing == 0 then
                            ( facing, n, e + amount )

                        else
                            case modBy 4 (facing // 90) of
                                0 ->
                                    -- "E"
                                    ( facing, n, e + amount )

                                1 ->
                                    -- "S"
                                    ( facing, n - amount, e )

                                2 ->
                                    -- "W"
                                    ( facing, n, e - amount )

                                3 ->
                                    -- "N"
                                    ( facing, n + amount, e )

                                _ ->
                                    Debug.todo "💥"

                    _ ->
                        ( facing, n, e )
            )
            ( 0, 0, 0 )
        |> (\( facing, north, east ) -> abs north + abs east)
        |> Just



-- 11b


day11_part2 =
    d11b Data.seats 98



--d11b Data.seatsTest 10


d11b seats width =
    let
        dirs =
            [ -1
            , 1
            , width + 1
            , width + 1 - 1
            , width + 1 + 1
            , -width - 1
            , -width - 1 - 1
            , -width - 1 + 1
            ]

        occupiedInDirection i d =
            case Array.get (i + d) seats of
                Just "." ->
                    occupiedInDirection (i + d) d

                Just "#" ->
                    True

                _ ->
                    False

        numOccupied i =
            List.filter (\d -> occupiedInDirection i d) dirs
                |> List.length

        next =
            Array.indexedMap
                (\i seat ->
                    case seat of
                        "#" ->
                            if numOccupied i >= 5 then
                                "L"

                            else
                                seat

                        "L" ->
                            if numOccupied i == 0 then
                                "#"

                            else
                                seat

                        _ ->
                            seat
                )
                seats
    in
    if next == seats then
        seats
            |> Array.filter ((==) "#")
            |> Array.length
            |> Just

    else
        d11b next width



--11a / 2483


day11_part1 =
    d11 Data.seats 98


d11 seats width =
    let
        free =
            "L"

        occupied =
            "#"

        adjacent i =
            [ i - 1, i + 1, i - width, i - (width + 1), i - (width + 2), i + width, i + (width + 1), i + (width + 2) ]
                |> List.map (\x -> Array.get x seats)

        numOccupied i =
            adjacent i
                |> List.filter ((==) (Just occupied))
                |> List.length

        next =
            Array.indexedMap
                (\i seat ->
                    case seat of
                        "#" ->
                            if numOccupied i >= 4 then
                                free

                            else
                                occupied

                        "L" ->
                            if numOccupied i == 0 then
                                occupied

                            else
                                free

                        _ ->
                            seat
                )
                seats
    in
    if next == seats then
        seats
            |> Array.filter ((==) "#")
            |> Array.length
            |> Just

    else
        d11 next width



-- 10b / 442136281481216


day10_part2 =
    dx2 ( 0, 0 ) Dict.empty
        |> Tuple.first
        |> Just


type alias Memo =
    Dict ( Int, Int ) Int


dx2 : ( Int, Int ) -> Memo -> ( Int, Memo )
dx2 ( prev, offset ) memo =
    case List.drop offset Data.adapters of
        next :: rest ->
            if next - prev <= 3 then
                if List.isEmpty rest then
                    ( 1, memo )

                else
                    let
                        id1 =
                            ( next, offset + 1 )

                        ( s1, m1 ) =
                            -- keep going
                            case Dict.get id1 memo of
                                Just n ->
                                    ( n, memo )

                                Nothing ->
                                    dx2 id1 memo

                        m1_ =
                            Dict.insert id1 s1 m1

                        id2 =
                            ( prev, offset + 1 )

                        ( s2, m2 ) =
                            -- skip one
                            case Dict.get id2 m1_ of
                                Just n ->
                                    ( n, m1_ )

                                Nothing ->
                                    dx2 id2 m1_

                        m2_ =
                            Dict.insert id2 s2 m2
                    in
                    ( s1 + s2, m2_ )

            else
                ( 0, memo )

        [] ->
            ( 1, memo )



--10a / 2475


day10_part1 =
    let
        diffs =
            Data.adapters
                |> List.sort
                |> (\adapters ->
                        List.foldl
                            (\nxt ( prev, dfs ) ->
                                ( nxt, dfs ++ [ nxt - prev ] )
                            )
                            ( 0, [] )
                            adapters
                   )
    in
    diffs
        |> Tuple.second
        |> List.partition ((==) 1)
        |> (\( a, b ) -> List.length a * (List.length b + 1))
        |> Just



-- 9b / 219202240


day9_part2 =
    d9b_ 0 1


invalid =
    1639024365


d9b_ : Int -> Int -> Maybe Int
d9b_ first last =
    let
        slice =
            Data.xmas
                |> List.drop first
                |> List.take (last - first)
    in
    case compare (List.sum slice) invalid of
        EQ ->
            Maybe.map2 (+) (List.minimum slice) (List.maximum slice)

        GT ->
            d9b_ (first + 1) (first + 2)

        LT ->
            d9b_ first (last + 1)



-- 9a / 1639024365


day9_part1 =
    d9 0


d9 offset =
    let
        preamble_ =
            Data.xmas
                |> List.drop offset
                |> List.take 25
                |> (\p ->
                        zip p p
                            |> List.map
                                (\( a, b ) ->
                                    if a == b then
                                        -1

                                    else
                                        a + b
                                )
                   )

        num_ =
            Data.xmas
                |> List.drop (offset + 25)
                |> List.head
    in
    Data.xmas
        |> List.drop (offset + 25)
        |> List.head
        |> Maybe.andThen
            (\num ->
                if List.member num preamble_ then
                    d9 (offset + 1)

                else
                    Just num
            )



--8b / 758


day8_part2 =
    Data.bootcode
        |> Array.fromList
        |> d8p2 0 0 [] False


d8p2 ptr acc called nochange codes =
    if ptr == Array.length codes then
        Just acc

    else if List.member ptr called then
        Nothing

    else
        case Array.get ptr codes of
            Just ( inst, val ) ->
                let
                    nop_ =
                        d8p2 (ptr + 1) acc (ptr :: called)

                    acc_ =
                        d8p2 (ptr + 1) (acc + val) (ptr :: called)

                    jmp_ =
                        d8p2 (ptr + val) acc (ptr :: called)
                in
                case inst of
                    "nop" ->
                        if nochange then
                            nop_ nochange codes

                        else
                            case jmp_ True codes of
                                Just r ->
                                    Just r

                                Nothing ->
                                    nop_ False codes

                    "acc" ->
                        acc_ nochange codes

                    "jmp" ->
                        if nochange then
                            jmp_ nochange codes

                        else
                            case nop_ True codes of
                                Just r ->
                                    Just r

                                Nothing ->
                                    jmp_ False codes

                    _ ->
                        Nothing

            Nothing ->
                Nothing



--8a / 1594


day8_part1 =
    Data.bootcode
        |> Array.fromList
        |> d8p1 0 0 []


d8p1 ptr acc called codes =
    if List.member ptr called then
        Just acc

    else
        case Array.get ptr codes of
            Just ( inst, val ) ->
                case inst of
                    "nop" ->
                        d8p1 (ptr + 1) acc (ptr :: called) codes

                    "acc" ->
                        d8p1 (ptr + 1) (acc + val) (ptr :: called) codes

                    "jmp" ->
                        d8p1 (ptr + val) acc (ptr :: called) codes

                    _ ->
                        Just acc

            Nothing ->
                Just acc



-- 7b
-- 2431


day7_part2 =
    let
        bagSplitter =
            Regex.fromStringWith { caseInsensitive = True, multiline = True } " bags contain "
                |> Maybe.withDefault Regex.never

        bagMatcher =
            Regex.fromString "(\\d) ([\\w ]+) bags?"
                |> Maybe.withDefault Regex.never

        parsed : Dict String (Dict String Int)
        parsed =
            Data.bags
                |> List.map (Regex.splitAtMost 1 bagSplitter)
                |> List.filterMap
                    (\list ->
                        case list of
                            [ head, tail ] ->
                                Just
                                    ( head
                                    , tail
                                        |> Regex.find bagMatcher
                                        |> List.filterMap
                                            (\{ submatches } ->
                                                case submatches of
                                                    [ Just v, Just k ] ->
                                                        case String.toInt v of
                                                            Just n ->
                                                                Just ( k, n )

                                                            Nothing ->
                                                                Nothing

                                                    _ ->
                                                        Nothing
                                            )
                                        |> Dict.fromList
                                    )

                            _ ->
                                Nothing
                    )
                |> Dict.fromList
    in
    d7p2 [ "shiny gold" ] 0 parsed


d7p2 candidates num data =
    case candidates of
        candidate :: xs ->
            case Dict.get candidate data of
                Just dict ->
                    let
                        inner =
                            dict
                                |> Dict.toList
                                |> List.map
                                    (\( k, n ) ->
                                        n * d7p2 [ k ] 1 data
                                    )
                                |> List.sum
                    in
                    d7p2 xs (num + inner) data

                Nothing ->
                    d7p2 xs num data

        [] ->
            num



--7a
--335


day7_part1 =
    let
        bagSplitter =
            Regex.fromStringWith { caseInsensitive = True, multiline = True } " bags contain "
                |> Maybe.withDefault Regex.never

        bagMatcher =
            Regex.fromString "\\d ([\\w ]+) bags?"
                |> Maybe.withDefault Regex.never

        parsed =
            Data.bags
                |> List.map (Regex.splitAtMost 1 bagSplitter)
                |> List.filterMap
                    (\list ->
                        case list of
                            [ head, tail ] ->
                                Just
                                    ( head
                                    , tail
                                        |> Regex.find bagMatcher
                                        |> List.concatMap (.submatches >> List.filterMap identity)
                                    )

                            _ ->
                                Nothing
                    )
    in
    findInternal [ "shiny gold" ] [] parsed
        |> List.unique
        |> List.length


findInternal : List String -> List String -> List ( String, List String ) -> List String
findInternal candidates matches bags =
    case candidates of
        [] ->
            matches

        candidate :: remaindingCandidates ->
            let
                ( candicates_, matches_ ) =
                    List.foldl
                        (\( bagKey, bagValues ) ( rem_, mat_ ) ->
                            if List.member candidate bagValues then
                                if List.member bagKey mat_ then
                                    ( rem_, mat_ )

                                else
                                    ( List.unique <| bagKey :: rem_, List.unique <| bagKey :: mat_ )

                            else
                                ( rem_, mat_ )
                        )
                        ( remaindingCandidates, matches )
                        bags
            in
            findInternal candicates_ matches_ bags



--6b
--3476


day6_part2 =
    Data.customs
        |> Regex.split splitLines
        |> List.map
            (Regex.split splitWhitespace
                >> List.filterMap nonBlank
                >> List.map (String.split "" >> Set.fromList)
            )
        |> List.map
            (\sets ->
                let
                    intersections =
                        List.foldl
                            Set.intersect
                            (List.head sets |> Maybe.withDefault Set.empty)
                            (List.drop 1 sets)
                in
                Set.size intersections
            )
        |> List.sum



--6a / 6686


day6_part1 =
    Data.customs
        |> Regex.split splitLines
        |> List.map
            (String.split ""
                >> List.filterMap nonBlank
                >> Set.fromList
                >> Set.size
            )
        |> List.sum


nonBlank str =
    case String.trim str of
        "" ->
            Nothing

        s ->
            Just s



-- 5b


day5_part2 =
    let
        all =
            List.range 0 (798 - 1)

        taken =
            Data.boardingPasses
                |> List.map (String.split "" >> getSeat)

        free =
            all
                |> List.filterMap
                    (\s ->
                        if List.member s taken then
                            Nothing

                        else
                            Just s
                    )
                |> List.reverse
                |> List.head
                |> Maybe.withDefault 0
    in
    free



-- 883


day5_part1 =
    Data.boardingPasses
        |> List.map (String.split "" >> getSeat)
        |> List.maximum
        |> Maybe.withDefault 0


getSeat : List String -> Int
getSeat passport =
    let
        col =
            List.foldl
                (\x xs ->
                    if x == "F" then
                        List.take (List.length xs // 2) xs

                    else
                        List.drop (List.length xs // 2) xs
                )
                (List.range 0 127)
                (List.take 7 passport)

        row =
            List.foldl
                (\x xs ->
                    if x == "L" then
                        List.take (List.length xs // 2) xs

                    else
                        List.drop (List.length xs // 2) xs
                )
                (List.range 0 7)
                (List.drop 7 passport)
    in
    Maybe.map2 (\c r -> (c * 8) + r) (List.head col) (List.head row)
        |> Maybe.withDefault 0



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
    Regex.fromStringWith { caseInsensitive = True, multiline = True } "\\n"
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
