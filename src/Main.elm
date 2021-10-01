module Main exposing (main)

import Browser
import Html exposing (Html, div, input, span, text)
import Html.Attributes exposing (checked, name, style, type_, value)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type Converter
    = CtoF
    | FtoC


type alias Model =
    { celsius : String
    , converterType : Converter
    }


init : Model
init =
    { celsius = ""
    , converterType = CtoF
    }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newInput ->
            { model | celsius = newInput }



-- VIEW


view : Model -> Html Msg
view model =
    case String.toFloat model.celsius of
        Just celsius ->
            viewConverter model "blue" (String.fromFloat (celsius * 1.8 + 32)) "black"

        Nothing ->
            viewConverter model "red" "???" "red"


selector : Model -> Html Msg
selector model =
    div []
        [ div []
            [ input [ type_ "radio", name "converter", value "CtoF", checked (model.converterType == CtoF) ] []
            , text "Convert Celsius to Fahrenheit"
            ]
        , div []
            [ input [ type_ "radio", name "converter", value "FtoC", checked (model.converterType == FtoC) ] []
            , text "Convert Fahrenheit to Celsius"
            ]
        ]


viewConverter : Model -> String -> String -> String -> Html Msg
viewConverter model color equivalentTemp borderColor =
    div []
        [ selector model
        , span []
            [ input [ value model.celsius, onInput Change, style "width" "40px", style "border-color" borderColor ] []
            , text "°C = "
            , span [ style "color" color ] [ text equivalentTemp ]
            , text "°F"
            ]
        ]
