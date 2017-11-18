module Tests exposing (..)

import Char
import Expect exposing (Expectation)
import Inflect
import Test exposing (..)


singularsToPlurals : List ( String, String )
singularsToPlurals =
    [ ( "foo", "foos" )
    , ( "axis", "axes" )
    , ( "bus", "buses" )
    , ( "matrix", "matrices" )
    , ( "ox", "oxen" )
    , ( "quiz", "quizzes" )
    , ( "wife", "wives" )
    , ( "safe", "saves" )
    , ( "half", "halves" )
    , ( "foss", "fosses" )
    , ( "news", "news" )
    , ( "medium", "media" )
    , ( "diagnosis", "diagnoses" )
    , ( "hive", "hives" )
    , ( "series", "series" )
    , ( "octopus", "octopi" )
    , ( "vertex", "vertices" )
    , ( "database", "databases" )
    , ( "equipment", "equipment" )
    , ( "fish", "fish" )
    , ( "police", "police" )
    ]
        |> List.concatMap
            (\( singular, plural ) ->
                [ ( singular, plural )
                , ( capitalizeFirst singular, capitalizeFirst plural )
                ]
            )


capitalizeFirst : String -> String
capitalizeFirst string =
    case String.uncons string of
        Just ( head, tail ) ->
            String.cons (Char.toUpper head) tail

        Nothing ->
            string


suite : Test
suite =
    describe "Inflect"
        [ describe "pluralize" <|
            List.map
                (\( singular, plural ) ->
                    test (singular ++ " -> " ++ plural) <| \_ -> Inflect.pluralize singular |> Expect.equal plural
                )
                singularsToPlurals
        , describe "singularize" <|
            List.map
                (\( singular, plural ) ->
                    test (plural ++ " -> " ++ singular) <| \_ -> Inflect.singularize plural |> Expect.equal singular
                )
                singularsToPlurals
        ]
