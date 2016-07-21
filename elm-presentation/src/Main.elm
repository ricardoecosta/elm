module Main exposing (..)

import Html exposing (text, div, h3, em, node)
import Html.Attributes exposing (..)
import Html.App as Html
import Array exposing (..)
import Keyboard
import Keyboard.Extra exposing (..)
import Config exposing (..)
import CDN exposing (skeleton)


main : Program Never
main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { slides : Array (Html.Html Msg)
    , page : Int
    }


initialModel : Model
initialModel =
    { slides = Array.fromList Config.slides
    , page = 1
    }



-- UPDATE


type Msg
    = KeyPress Keyboard.KeyCode


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        total =
            Array.length model.slides
    in
        case msg of
            KeyPress keyCode ->
                if keyCode == leftArrow then
                    ( { model | page = previous total model.page }, Cmd.none )
                else if keyCode == rightArrow then
                    ( { model | page = next total model.page }, Cmd.none )
                else
                    ( model, Cmd.none )


clampPage : Int -> Int -> Int
clampPage total =
    clamp 1 total


next : Int -> Int -> Int
next total page =
    clampPage total (page + 1)


previous : Int -> Int -> Int
previous total page =
    clampPage total (page - 1)



-- VIEW


view : Model -> Html.Html Msg
view model =
    let
        slide =
            Array.get (model.page - 1) model.slides
    in
        case slide of
            Just slide' ->
                [ slideLayout slide' model.page (Array.length model.slides) ] |> container

            Nothing ->
                container []


container : List (Html.Html Msg) -> Html.Html Msg
container components =
    div []
        (skeleton.css
            :: components
        )


slideLayout : Html.Html Msg -> Int -> Int -> Html.Html Msg
slideLayout slide page total =
    div
        [ style
            [ ( "margin", "25px auto" )
            , ( "width", "900px" )
            , ( "height", "700px" )
            ]
        ]
        [ div
            [ style
                [ ( "height", "50px" )
                , ( "text-align", "center" )
                , ( "background-color", "deeppink" )
                ]
            ]
            [ h3 [ style [ ( "color", "white" ) ] ] [ text "AN OVERVIEW OF ELM" ] ]
        , div
            [ style
                [ ( "height", "625px" )
                , ( "padding", "20px" )
                , ( "background-color", "lightgrey" )
                ]
            ]
            [ slide ]
        , div
            [ style
                [ ( "height", "25px" )
                , ( "text-align", "center" )
                , ( "background-color", "deeppink" )
                ]
            ]
            [ div [ style [ ( "color", "white" ) ] ] [ text ("LONDON TECH BI-WEEKLY MEETING :: UNIBET 2016 :: " ++ (pagination page total)) ] ]
        ]


pagination : Int -> Int -> String
pagination page total =
    "[" ++ (toString page) ++ "/" ++ (toString total) ++ "]"



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.ups KeyPress ]
