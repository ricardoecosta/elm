module Slide exposing (..)

import Html
import Markdown


slide : String -> Html.Html a
slide markdown =
    Markdown.toHtml [] markdown
