module Main exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { celsius : String
    , fahrenheit : Maybe Float
    }


init : Model
init =
    { celsius = ""
    , fahrenheit = Nothing
    }



-- UPDATE


type Msg
    = Change String


updateFahrenheit : String -> Maybe Float
updateFahrenheit celsius =
    -- how to define a local variable?
    case String.toFloat celsius of
        Nothing ->
            Nothing

        Just c ->
            Just ((c * 9 / 5) + 32)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newValue ->
            { model | celsius = newValue, fahrenheit = updateFahrenheit newValue }



-- VIEW


viewFahrenheit : Maybe Float -> Html Msg
viewFahrenheit fahrenheit =
    case fahrenheit of
        Nothing ->
            div [] [ text "Invalid celsius" ]

        Just f ->
            div [] [ text ("Equivalent to: " ++ String.fromFloat f ++ " F") ]


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Enter temperature in Celsius", value model.celsius, onInput Change ] []
        , viewFahrenheit model.fahrenheit
        ]
