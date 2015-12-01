# Vorbereitungen

Bei Problemen mit den unten stehenden Anweisungen und Tests bitte entweder melden unter https://github.com/jvoigtlaender/Elm-Tutorium/issues oder per Email an [mich](http://www.janis-voigtlaender.eu/).

## Installation

Benötigt werden zunächst:
* auf jeden Fall `git`:  
  https://git-scm.com/downloads
* eventuell (siehe unten) `Node.js`:  
  https://nodejs.org/en/download/

Dann möchten wir Elm 0.16.

Zur Installation gibt es mehrere Möglichkeiten.
In der Reihenfolge des Empfohlenseins (meiner Meinung nach):

1. Installer, für spezielle Betriebssysteme:
  * [OS X](http://install.elm-lang.org/Elm-Platform-0.16.pkg)
  * [Windows](http://install.elm-lang.org/Elm-Platform-0.16.exe)
2. per `npm` (benötigt eine Installation von `Node.js`, siehe oben):  
   `npm install -g elm@0.16.0`,  
   unter Debian/Ubuntu vorher `apt-get install nodejs-legacy`
3. selbst kompilieren aus den Quellen (mit mindestens `ghc` 7.10 und `cabal` 1.18):  
   https://github.com/elm-lang/elm-platform#actually-build-elm-things,  
   unter Linux vorher `apt-get install ncurses` und (falls so ein Paket existiert): `apt-get install libtinfo-dev`

Je nach Installationsweg können danach noch folgende Dinge nötig sein:
* um später die REPL nutzen zu können (nicht unbedingt nötig):
  + Installation von `Node.js`, siehe oben
  + unter Linux,  
    `apt-get install libtinfo-dev`,  
    bzw. unter manchen Linuxes stattdessen sowas wie:  
    `apt-get install ncurses; cd /usr/lib; ln -s libncurses++w.so.6.0 libtinfo.so.5`
* Überprüfen, ob die Umgebungsvariable `ELM_HOME` gesetzt ist (insbesondere wenn oben Installer für OS X oder Windows benutzt):
  + sollte auf ein Verzeichnis zeigen, so dass `ELM_HOME/reactor/_reactor/debug.js` existiert
  + zum Beispiel `C:\Program Files (x86)\Elm Platform\0.16\share` unter Windows

Wer gern Editor-Unterstützung hat:  
http://elm-lang.org/install#syntax-highlighting

## Ausprobieren

Vorbemerkung: Falls es mit den Anweisungen unten ein Problem gibt etwa mit Fehlermeldungen der Art `invalid argument (invalid character)`, dann bitte in der Shell vorher ausführen:
* unter Windows, `chcp 65001`
* unter Unix-like, `export LANG=en_US.utf8`

Folgende Schritte bitte in einem leeren Verzeichnis ausführen:
* `elm-package install evancz/start-app -y`
* `elm-package install evancz/elm-html -y`
* `elm-package install evancz/elm-http -y`
* `elm-package install jwmerrill/elm-animation-frame -y`

Für spätere Verwendung (etwa falls während des Tutoriums keine Internetverbindung besteht), eine Kopie des kompletten Verzeichnisses erstellen und gut aufheben.

Nun Speichern einer Datei `Main.elm` mit folgendem Inhalt im (oben vorbereiteten) Verzeichnis:
```elm
module Main where

import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp

model = 0

view address model =
  div []
    [ div [] [ text (toString model) ]
    , button [ onClick address () ] [ text "step" ]
    ]

update action model =
  case action of
    () -> model + 1

main =
  StartApp.start { model = model, view = view, update = update }
```

Dann nacheinander folgende Tests:

1. Aufruf von `elm-make Main.elm --output Main.html`, dann Öffnen von `Main.html` in einem Browser.  
   Passiert etwas Sinnvolles?
2. Aufruf von `elm-reactor`, dann Öffnen von `http://localhost:8000/` in einem Browser, dort Klick auf `Main.elm`.  
   Passiert wieder etwas Sinnvolles?
3. Wie im vorigen Punkt, jedoch statt Klick auf `Main.elm` nun Klick auf das Werkzeugsymbol links davon.  
   Passiert etwas Sinnvolles und lässt sich nach ein paar Button-Klicks mit dem Schieber rechts die Zeit "vor-/zurückdrehen"?
4. Nur wenn später Nutzung der REPL gewünscht:  
   Aufruf von `elm-repl`, dann am Prompt das Kommando `import Main` und Test `1+1`, anschließend `:exit`.

