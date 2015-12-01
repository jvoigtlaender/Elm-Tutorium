[Zurück](../README.md)

---

# Erste Aufgabe

Vervollständige [`Nikolaus.elm`](../src/task01/Nikolaus.elm), um das Haus des Nikolaus zu malen:

```elm
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

nikolaus : Form
nikolaus =
  group
  [ outlined defaultLine (rect 100 130)
  , traced defaultLine (path [ (-50,-65), (50,65) ])
  ]

main : Element
main = collage 400 300 [ nikolaus ]
```

Zielbild, etwa:

![Haus des Nikolaus](../images/Nikolaus.png)

Relevante Typsignaturen:

```elm
outlined : LineStyle -> Shape -> Form

defaultLine : LineStyle

rect : Float -> Float -> Shape

traced : LineStyle -> Path -> Form

path : List (Float, Float) -> Path

group : List Form -> Form

collage : Int -> Int -> List Form -> Element
```

## Zusatz 1

Male einen kleinen Kreis um die Hausspitze.

Hinweis: Ein Teilbild kann beliebig verschoben werden mittels folgender Funktion:

```elm
move : (Float, Float) -> Form -> Form
```

## Zusatz 2

Stelle "Mario" (`toForm (image 45 45 "http://elm-lang.org/imgs/mario/stand/right.gif")`) links neben das Haus. 

## Zusatz 3

Male statt dem einen Haus drei nebeneinander stehende gleiche Häuser.

