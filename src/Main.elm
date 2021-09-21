module Main exposing (main)

import Browser
import Html exposing (button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement
    | Increment10
    | Decrement10
    | Reset


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Increment10 ->
            model + 10

        Decrement10 ->
            model - 10

        Reset ->
            0

view model =
    div [ class "container" ]
        [ button [ class "btn", onClick Decrement10 ] [ text "-10" ]
        , button [ class "btn", onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ class "btn", onClick Increment ] [ text "+" ]
        , button [ class "btn", onClick Increment10 ] [ text "+10" ]
        , button [ class "btn", onClick Reset ] [ text "Reset" ]
        ]
