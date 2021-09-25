module Main exposing (main)

import Browser
import Char exposing (isDigit, isLower, isUpper)
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder, style, type_, value)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { username : String
    , password : String
    , confirm : String
    }


init : Model
init =
    Model
        ""
        ""
        ""



-- UPDATE


type Message
    = Username String
    | Pass String
    | Confirm String


update : Message -> Model -> Model
update msg model =
    case msg of
        Username username ->
            { model | username = username }

        Pass pass ->
            { model | password = pass }

        Confirm pass ->
            { model | confirm = pass }



-- VIEW
--viewInput: String -> String -> String ->


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput inputType inputPlaceholder inputValue toMsg =
    input [ type_ inputType, placeholder inputPlaceholder, value inputValue, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if String.length model.username == 0 then
        div [ style "color" "red" ] [ text "Username cannot be empty" ]

    else if String.length model.password == 0 then
        div [ style "color" "red" ] [ text "Password cannot be empty" ]

    else if model.password /= model.confirm then
        div [ style "color" "red" ] [ text "Passwords don't match" ]

    else if String.length model.password < 8 then
        div [ style "color" "red" ] [ text "Password should be at least 8 characters" ]

    else if not (String.any isDigit model.password) then
        div [ style "color" "red" ] [ text "Password needs to have a digit" ]

    else if not (String.any isLower model.password) then
        div [ style "color" "red" ] [ text "Password needs to have a lower case letter" ]

    else if not (String.any isUpper model.password) then
        div [ style "color" "red" ] [ text "Password needs to have an upper case letter" ]

    else
        div [ style "color" "green" ] [ text "OK" ]


view : Model -> Html Message
view model =
    div []
        [ viewInput "text" "Username" model.username Username
        , viewInput "password" "Password" model.password Pass
        , viewInput "password" "Confirm password" model.confirm Confirm
        , viewValidation model
        ]
