[Zurück](Nikolaus.md)

---

# Zweite Aufgabe

Verändere in folgendem Programm ([`Pendulum.elm`](../src/task02/Pendulum.elm)):

```elm
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)
import AnimationFrame

view : Time -> Element
view t =
  let
    alpha = cos (t/500) * pi/3
    a = 100 * sin alpha
    b = -100 * cos alpha
  in
    collage 400 300
      [ traced defaultLine (path [ (0,0), (a,b) ])
      , move (a,b) (outlined defaultLine (circle 10))
      ]

timer : Signal Time
timer = AnimationFrame.frame

main : Element
main = view (100 * millisecond)
```

nur `main`, so dass `timer` das Pendel zum Schwingen "antreibt".

Hinweise:
* Statt `Element` muss `main` dann den Typ `Signal Element` haben.
* Ein Signal kann man sich entweder als einen sich kontinuierlich ändernden Wert (also letztlich als eine Funktion von Zeit zu Wert) vorstellen oder als eine Sequenz von diskret eintretenden Änderungen auf einen neuen Wert (also letztlich als eine Liste von Paaren aus Zeit und Wert).  
  Keine dieser beiden Interpretationen ist in Elm konkret/explizit, sondern `Signal` bleibt abstrakt.
* Auf Signalen lässt sich arbeiten mit Funktionen wie `Signal.map : (a -> b) -> Signal a -> Signal b` sowie diversen weiteren aus dem [Standardmodul `Signal`](http://package.elm-lang.org/packages/elm-lang/core/latest/Signal) (siehe auch einführende Erläuterungen dort).
* Ebenfalls hilfreich wird hier das [`Time`-Modul](http://package.elm-lang.org/packages/elm-lang/core/latest/Time) sein, jedoch soll *nicht* `Time.every` verwendet werden.
* Um besseren Einblick in das Verhalten des Programms, insbesondere Werte auf einzelnen Signalen, zu erhalten, lässt sich im Debug-Modus (Klick auf Werkzeugsymbol neben Programmname nach Aufruf von `elm-reactor`) die Funktion [`Debug.watch`](http://package.elm-lang.org/packages/elm-lang/core/latest/Debug#watch) verwenden.

