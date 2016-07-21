module Program exposing (..)

import Html.App as Html
import Html exposing (img, audio, div)
import Html.Attributes exposing (src, style, loop, autoplay, hidden, property)
import Time exposing (..)
import Http
import Task
import Json.Encode as JsonEncode


main : Program Never
main =
    Html.program
        { init = ( initialModel, performRequestSpaceCatTask )
        , update = update
        , view = view
        , subscriptions = (\model -> Time.every (3 * second) (always FetchSpaceCat))
        }



-- MODEl


type alias Model =
    { spaceCatGifUrl : String }


initialModel : Model
initialModel =
    { spaceCatGifUrl = "" }



-- UPDATE


type Msg
    = FetchSpaceCat
    | SpaceCatSuccess Http.Response
    | SpaceCatFail Http.RawError


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchSpaceCat ->
            ( model, performRequestSpaceCatTask )

        SpaceCatSuccess response ->
            ( { model | spaceCatGifUrl = response.url }, Cmd.none )

        SpaceCatFail err ->
            ( model, Cmd.none )


performRequestSpaceCatTask : Cmd Msg
performRequestSpaceCatTask =
    Task.perform SpaceCatFail SpaceCatSuccess spaceCatRequest


spaceCatRequest : Task.Task Http.RawError Http.Response
spaceCatRequest =
    Http.send Http.defaultSettings
        { verb = "GET"
        , headers = []
        , url = "http://thecatapi.com/api/images/get?format=src&type=gif&category=space&results_per_page=1"
        , body = Http.empty
        }



-- VIEW


view : Model -> Html.Html Msg
view model =
    div []
        [ audio [ src "music/magic-fly-music-video.mp3", property "currentTime" (JsonEncode.float 12.6), loop True, autoplay True, hidden True ] []
        , img [ src model.spaceCatGifUrl, fullScreenStyle ] []
        ]


fullScreenStyle : Html.Attribute Msg
fullScreenStyle =
    style
        [ ( "width", "100%" )
        , ( "height", "100%" )
        , ( "position", "absolute" )
        , ( "top", "0px" )
        , ( "left", "0px" )
        , ( "z-index", "-1" )
        ]
