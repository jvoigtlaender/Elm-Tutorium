[Zurück](Inputs.md)

---

# Siebte Aufgabe

Wie in Haskell benötigen wir zusätzlich zum puren Sprachkern (und auch noch zusätzlich zu Signalen) eine Möglichkeit, Effekte einzubetten, und zwar möglichst diszipliniert.
Dafür gibt es das Konzept der Tasks.
Der Typkonstruktor `Task` spielt eine ähnliche Rolle wie `IO` in Haskell.
Tatsächlich gibt es einen dem monadischen `(>>=)` entsprechenden Operator:

```elm
andThen : Task x a -> (a -> Task x b) -> Task x b
```

Das erste Typargument von `Task` erfasst gegebenenfalls mögliche Fehler bei Ausführung eines Tasks.

So wie es in Haskell Funktionen wie `System.IO.readFile :: FilePath -> IO String` zum Lesen vom Filesystem gibt, gibt es in Elm nun Funktionen etwa zum Absetzen eines Http-Requests an eine bestimmte URL:

```elm
Http.get : Decoder a -> String -> Task Http.Error a
```

(Da Http-Responses im JSON-Format geliefert werden, ist hier noch die Angabe eines `Decoder`s nötig. Dieser wird im Beispiel unten aber schon vorgegeben sein.)

Außerdem werden Tasks verwendet, um native JavaScript-Bibliotheken quasi per FFI einzubinden, oder auch einfach um unabhängig von HTML-Bedienelementen einen Wert an eine Mailbox zu übermitteln:

```elm
Signal.send : Address a -> a -> Task x ()
```

Schließlich muss noch dafür gesorgt werden, dass Tasks tatsächlich ausgeführt werden.
Während das Anstoßen von `IO`-Effekten in Haskell einfach dadurch geschieht, dass `main` einen `IO`-Typ hat (während in Elm `main` weiter einen `Signal`-Typ haben soll), muss in Elm explizit ein "Port" definiert werden.
Für mit dem Schlüsselwort `port` deklarierte Signale von Tasks sorgt das Laufzeitsystem für die Ausführung (durch Weiterreichen an JavaScript).

Nach dieser langen Vorrede wollen wir nun [dieses Verhalten](http://jvoigtlaender.github.io/Elm-Tutorium/examples/Tasks.html) realisieren.

Im unten zu findenden Programmfragment sind schon vorgegeben:
* Die Erzeugung von Tasks zur Http-Abfrage aller Repositories eines GitHub-Nutzers per GitHub REST API, und Weitergabe an die Mailbox `results`.
* Eine Funktion `onInput : Address a -> (String -> a) -> Attribute`, die für ein mit `input : List Attribute -> List Html -> Html` erzeugtes HTML-Texteingabefeld die Rolle des `onClick` bei `button` übernehmen kann (wobei der an die Mailbox übermittelte Wert nun durch die Funktion `(String -> a)` von der aktuellen Texteingabe abhängt).

```elm
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json exposing ((:=))
import Signal exposing (Address, Mailbox)
import Task exposing (Task, andThen)

results : Mailbox (List String)
results = Signal.mailbox []

query : String -> Task Http.Error ()
query name =
  Http.get (Json.list ("html_url" := Json.string)) ("https://api.github.com/users/" ++ name ++ "/repos")
  `andThen`
  Signal.send results.address

port run : Signal (Task Http.Error ())
port run = Signal.map query (Signal.sampleOn ... ...)

onInput : Address a -> (String -> a) -> Attribute
onInput addr fun = on "input" targetValue (Signal.message addr << fun)

view : List String -> Html
view urls =
  div []
  [
    div []
    [ input [ onInput ... ... ] []
    , ...
    ]
  , ...
  ]

main : Signal Html
main = Signal.map view results.signal
```

Erweitere obiges Programm, bzw. passe es an, so dass das [Zielverhalten](http://jvoigtlaender.github.io/Elm-Tutorium/examples/Tasks.html) realisiert wird.

Hinweise:
* An `query` und `onInput` sind keine Änderungen nötig.
* `Signal.foldp` wird nicht benötigt.
* Zur Gestaltung der HTML-Ausgabe sind diverse HTML-Elemente und -Attribute aus dem Modul [`Html`](http://package.elm-lang.org/packages/evancz/elm-html/latest/Html) bzw. dem Modul [`Html.Attributes`](http://package.elm-lang.org/packages/evancz/elm-html/latest/Html-Attributes) hilfreich.

