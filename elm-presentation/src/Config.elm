module Config exposing (..)

import Markdown
import Html


markdownSlide : String -> Html.Html msg
markdownSlide markdown =
    Markdown.toHtml [] markdown


slides : List (Html.Html msg)
slides =
    [ slide1
    , slide2
    , slide3
    , slide4
    , slide5
    , slide6
    , slide7
    , slide8
    , slide9
    , slide10
    , slide11
    , slide12
    , slide13
    , slide14
    , slide15
    , slide16
    , slide17
    ]


slide1 : Html.Html msg
slide1 =
    markdownSlide """

<br><br>

![](images/elm-logo.png)

<br>

&nbsp;&nbsp;&nbsp;&nbsp;Ricardo Costa
"""


slide2 : Html.Html msg
slide2 =
    markdownSlide """
# Why did I pick Elm?

#### ⇒ to learn a pure functional language

#### ⇒ to know more about the inspiration of redux

#### ⇒ to look at a very promissing option for FE web development

#### ⇒ this is not a **javascript vs whatever** presentation

#### ⇒ take off your OOP hat for a moment

#### ⇒ this presentation was written in Elm
"""


slide3 : Html.Html msg
slide3 =
    markdownSlide """
# So Elm huh? What is it? o_O

#### ⇒ a pure functional language

#### ⇒ a strict language

#### ⇒ based on ML languages, influenced by Haskel, but simpler

#### ⇒ compiles to javascript and runs in the browser

#### ⇒ everything is caught by the compiler, no runtime errors

#### ⇒ by Evan Czaplicki during his thesis on concurrent FRP
"""


slide4 : Html.Html msg
slide4 =
    markdownSlide """
# Agenda

#### ⇒ Functions

#### ⇒ Type System

#### ⇒ Friendly Compiler

#### ⇒ Semantic Versioning

#### ⇒ Elm Architecture

#### ⇒ Live Demo
"""


slide5 : Html.Html msg
slide5 =
    markdownSlide """
# Functions

#### ⇒ all functions are pure

#### ⇒ all functions are side effects free

#### ⇒ all function are curried by default

"""


slide6 : Html.Html msg
slide6 =
    markdownSlide """
# Functions

#### ⇒ examples:

![](images/functions.png)
"""


slide7 : Html.Html msg
slide7 =
    markdownSlide """
# Type System

#### ⇒ static and strong type system

#### ⇒ no need to define data types, but more readable if defined

#### ⇒ union data types and records

#### ⇒ duck typing

#### ⇒ no null references, adios 'undefined is not a function'

#### ⇒ immutability
"""


slide8 : Html.Html msg
slide8 =
    markdownSlide """
# Type System

#### ⇒ examples:

![](images/types.png)
"""


slide9 : Html.Html msg
slide9 =
    markdownSlide """
# Friendly Compiler

![](images/naming.png)

-- from http://elm-lang.org/blog/compiler-errors-for-humans
"""


slide10 : Html.Html msg
slide10 =
    markdownSlide """
# Friendly Compiler

![](images/missing-field.png)

-- from http://elm-lang.org/blog/compiler-errors-for-humans
"""


slide11 : Html.Html msg
slide11 =
    markdownSlide """
# Friendly Compiler

![](images/list.png)

-- from http://elm-lang.org/blog/compiler-errors-for-humans
"""


slide12 : Html.Html msg
slide12 =
    markdownSlide """
# Semantic Versioning

#### ⇒ elm package checks if PATCH, MINOR or MAJOR version

#### ⇒ forces you to bump MAJOR version if it's a breaking change
"""


slide13 : Html.Html msg
slide13 =
    markdownSlide """
# The Elm Architecture

#### ⇒ **redux** was inspired by **Elm Architecture**

#### ⇒ three main actors:

#### &nbsp;&nbsp;&nbsp;&nbsp;⇒ Model

#### &nbsp;&nbsp;&nbsp;&nbsp;⇒ View

#### &nbsp;&nbsp;&nbsp;&nbsp;⇒ Update

![](images/elm-arch-program.png)
"""


slide14 : Html.Html msg
slide14 =
    markdownSlide """
# The Elm Architecture

#### ⇒ interactions between actors:

![](images/elm-arch-diagram.png)

 -- from http://www.slideshare.net/theburningmonk/my-adventure-with-elm-polyconf-16
"""


slide15 : Html.Html msg
slide15 =
    markdownSlide """
# Live Demo

<br><br>

# ********* ELM SPACE CATS ********
"""


slide16 : Html.Html msg
slide16 =
    markdownSlide """
# The End |> Thank You |> Questions?

<br><br><br><br><br><br><br><br>

#### read more about Elm at:
#### &nbsp;&nbsp;&nbsp;&nbsp;⇒ http://guide.elm-lang.org/
#### &nbsp;&nbsp;&nbsp;&nbsp;⇒ http://elm-lang.org/
"""


slide17 : Html.Html msg
slide17 =
    markdownSlide """
# Who is using Elm commercially?

![](images/commercial-users.png)
"""



-- conclusion: forget about OOP, functions, immutability, composition, central state
