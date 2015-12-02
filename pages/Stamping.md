[Zurück](Counting.md)

---

# Fünfte Aufgabe (eventuell überspringen)

Setze durch Vervollständigung folgenden Programms:

```elm
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse
import Color exposing (..)

type alias State = ...

initial : State
initial = ...

update : (Float, Float) -> State -> State
update (x,y) state = ...

view : (Float, Float) -> State -> Element
view (x,y) state = ...

main : Signal Element
main = ...
```

[dieses Verhalten](http://jvoigtlaender.github.io/Elm-Tutorium/examples/Stamping.html) um. (Bewege die Maus und klicke zwischendurch ein paar Mal.)

Hinweise:
* Ein ausgefülltes regelmäßiges `5`-Eck mit Umkreisradius `15` malt man zum Beispiel mit `filled blue (ngon 5 15)`.
* Zur Konvertierung zwischen `Int` und `Float` gibt es `toFloat : Int -> Float` sowie diverse Rundungsfunktionen.

## Zusatz

Erweitere nun das Programm, so dass nach jedem Klick der "Stempel" etwas größer wird (und in der Folge danach auch entsprechend größere Abdrücke hinterlässt).

