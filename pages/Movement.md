[Zurück](Pendulum.md)

---

# Dritte Aufgabe

Setze [dieses Verhalten](http://jvoigtlaender.github.io/Elm-Tutorium/examples/Movement.html) um.
Es sollen also in Reaktion auf Mausbewegungen immer genau die Kreise rot sein, die näher am gemeinsamen Mittelpunkt sind als der Mauszeiger (und die anderen grün).

Hinweise:
* Das Modul [`Mouse`](http://package.elm-lang.org/packages/elm-lang/core/latest/Mouse) enthält ein Signal `position : Signal (Int, Int)`.
* Das Modul [`Color`](http://package.elm-lang.org/packages/elm-lang/core/latest/Color) enthält `red`, `green`, etc.
* Außerdem kann statt wie bisher `defaultLine : LineStyle` nun `solid : Color -> LineStyle` verwendet werden.
* Die Koordinatensysteme für `Mouse.position` und für das Malen innerhalb eines `collage`-Aufrufs unterscheiden sich. Zum Herausfinden der Details dazu eignet sich wieder [`Debug.watch`](http://package.elm-lang.org/packages/elm-lang/core/latest/Debug#watch).

---

[Weiter](Counting.md)

