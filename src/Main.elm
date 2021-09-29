module Main exposing (main)

import Browser
import Html exposing (Html, input, span, text)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { celsius : String
    }


init : Model
init =
    { celsius = ""
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
            viewConverter model.celsius "blue" (String.fromFloat (celsius * 1.8 + 32))

        Nothing ->
            viewConverter model.celsius "red" "???"


viewConverter : String -> String -> String -> Html Msg
viewConverter userInput color equivalentTemp =
    span []
        [ input [ value userInput, onInput Change, style "width" "40px" ] []
        , text "°C = "
        , span [ style "color" color ] [ text equivalentTemp ]
        , text "°F"
        ]
