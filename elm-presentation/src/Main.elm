module Main exposing (..)

import Html exposing (text, div)
import Html.Attributes exposing (..)
import Html.App as Html
import Array exposing (..)
import Keyboard
import Keyboard.Extra exposing (..)
import Config exposing (..)


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
                slideLayout slide' model.page (Array.length model.slides)

            Nothing ->
                emptyLayout


slideLayout : Html.Html Msg -> Int -> Int -> Html.Html Msg
slideLayout slide page total =
    div
        [ style
            [ ( "margin", "25px auto" )
            , ( "width", "90%" )
            , ( "height", "90%" )
            ]
        ]
        [ div
            [ style
                [ ( "height", "10%" )
                , ( "text-align", "center" )
                , ( "background-color", "deeppink" )
                ]
            ]
            [ text "HEADER" ]
        , div
            [ style
                [ ( "height", "80%" )
                , ( "padding", "20px" )
                , ( "background-color", "#494949" )
                ]
            ]
            [ slide ]
        , div
            [ style
                [ ( "height", "10%" )
                , ( "text-align", "center" )
                , ( "background-color", "deeppink" )
                ]
            ]
            [ text "FOOTER", text (pagination page total) ]
        ]


pagination : Int -> Int -> String
pagination page total =
    "(" ++ (toString page) ++ "/" ++ (toString total) ++ ")"


emptyLayout : Html.Html Msg
emptyLayout =
    div [] []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.ups KeyPress ]
