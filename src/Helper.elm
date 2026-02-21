module Helper exposing (..)

import Html exposing (Html, a, div, h1, h2, h3, h4, h5, h6, text)
import Html.Attributes exposing (href)


type Grade
    = Approved
    | Failed
    | Pending


type AirplaneStatus
    = Cancelled
    | Delayed
    | OnTime
    | Boarding


joinWords : String -> String -> String
joinWords str1 str2 =
    str1 ++ str2


isUpperChars : List Char -> List Bool
isUpperChars chars =
    List.map Char.isUpper chars


evalChars : List Char -> (Char -> Bool) -> List Bool
evalChars chars validator =
    List.map validator chars


categoricalGrade : List Float -> List Grade
categoricalGrade grades =
    List.map
        (\n ->
            if n >= 7 then
                Approved

            else if n >= 0 then
                Failed

            else
                Pending
        )
        grades


airplaneScheduleAction : AirplaneStatus -> String
airplaneScheduleAction status =
    case status of
        Cancelled ->
            "Pedir reembolso"

        Delayed ->
            "Esperar"

        OnTime ->
            "Esperar"

        Boarding ->
            "Buscar boleto"


airportAction : List AirplaneStatus -> List String
airportAction statuses =
    List.map airplaneScheduleAction statuses


headers : String -> Html msg
headers content =
    div []
        [ h1 [] [ text content ]
        , h2 [] [ text content ]
        , h3 [] [ text content ]
        , h4 [] [ text content ]
        , h5 [] [ text content ]
        , h6 [] [ text content ]
        ]


hyperlink : String -> String -> Html msg
hyperlink url label =
    a [ href url ] [ text label ]
