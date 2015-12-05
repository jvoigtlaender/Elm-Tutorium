[Zurück](Stamping.md)

---

# Sechste Aufgabe

Wollen wir Bedienelemente wie HTML-Knöpfe umsetzen, brauchen wir ein neues Konzept.
Bisherige Signalquellen (wie `Time`, `Mouse`) haben keine graphische Repräsentation, außerdem existieren sie einfach und immer, ohne erzeugt werden zu müssen.
Im Gegensatz dazu muss ein HTML-Knopf zunächst überhaupt dargestellt werden, und nur wenn er dargestellt wurde, kann er auch durch den Nutzer bedient werden und somit als Signalquelle fungieren.
Zudem sollte es möglich sein, abhängig vom Programmzustand einen solchen Knopf ein- oder eben auch auszublenden (oder auch mehrere Knöpfe und andere Bedienelemente).
Folglich würde auch die Signalquelle dynamisch entstehen und gegebenenfalls wieder verschwinden.
Dynamisch konfigurierbare Signalgraphen, also quasi `Signal (Signal a)`, werden in Elm jedoch nicht unterstützt.

Um mit gegebenenfalls dynamisch erzeugten Bedienelementen umzugehen, wird daher eine Indirektion eingeführt.
Dafür gibt es das Konzept der `Mailbox`.
Eine Mailbox hat eine Adresse und stellt ein Signal bereit:

```elm
type alias Mailbox a = { address : Address a, signal : Signal a }
```

Eine Mailbox wird unter Angabe eines Initialwertes mittels

```elm
Signal.mailbox : a -> Mailbox a
```

erzeugt, ihr können dann über ihre Addresse durch Event-Handler wie `onClick` Werte übermittelt werden (siehe unten), und über das der Mailbox zugehörige Signal können andere Programmteile auf diese Werte reagieren.
Dabei kann eine einzelne Mailbox als Kanal für Werte aus verschiedenen Bedienelementen fungieren.

Das folgende Programmfragment zeigt eine typische Nutzung:

```elm
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address, Mailbox)

type Action = ...

actions : Mailbox Action
actions = Signal.mailbox ...

update : Action -> Int -> Int
update action c = ...

view : Int -> Html
view c = div []
         [ div [] [ text (toString c) ]
         , button [ onClick actions.address ... ] [ text "Zero" ]
         , ...
         ]

main : Signal Html
main = Signal.map view (Signal.foldp update 0 actions.signal)
```

Erklärungen:
* Statt graphischer Elemente wie bisher benutzen wir nun Standard-HTML, daher auch `main : Signal Html` statt dem bisherigen `main : Signal Element`.
* HTML wird erzeugt durch Funktionen wie `text : String -> Html` und `div : List Attribute -> List Html -> Html`.
  Analog zu `div` gibt es Funktionen für praktisch alle bekannten HTML-Elemente.
  Üblicherweise nehmen sie eine Liste von Attributen und eine Liste von HTML-Kindknoten als Eingabe.
  Oft wird eine der beiden Listen leer sein.
* Attribute werden wiederum durch bekannten HTML-Attributen entsprechende Funktionen erzeugt, etwa `autofocus : Bool -> Attribute`, jedoch auch durch Event-Handler wie `onClick : Address a -> a -> Attribute`.
* Der Ausdruck `button [ onClick actions.address ... ] [ text "Zero" ]` erzeugt also einen HTML-Knopf, der mit "Zero" beschriftet ist, und der bei Nutzerklick den Wert `...` an die `actions`-Mailbox übermittelt.
  (Die beiden Vorkommen der gleichen Typvariable im oben angegebenen Typ von `onClick` sorgen dafür, dass man nur passend getypte Werte an eine Mailbox senden kann.)
  Jeder Konsument des Signals `actions.signal` wird diesen Wert dann als Eingabe geliefert bekommen.

## Aufgabe

Vervollständige obiges Programmfragment, so dass insgesamt drei Knöpfe angezeigt werden, beschriftet mit "Zero", "Up", "Down", und dass der ebenfalls angezeigte Zähler mit jedem Klick auf "Zero" zurückgesetzt, jedem Klick auf "Up" erhöht und jedem Klick auf "Down" verringert wird.

---

[Weiter](Tasks.md)

