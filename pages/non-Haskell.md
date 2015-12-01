# Einige Unterschiede zu Haskell

## Syntax

* keine list comprehensions
* nur `let`, kein `where`
* pattern-matching fast nur mit `case`, entsprechend nur eine Definitionsgleichung per Funktion
* kein explizites Layout mit `{ ; }`

<table>
  <tr>
    <th>Haskell</th>
    <td><pre lang="haskell">:</pre></td>
    <td><pre lang="haskell">::</pre></td>
    <td><pre lang="haskell">[Int]</pre></td>
    <td><pre lang="haskell">type</pre></td>
    <td><pre lang="haskell">data</pre></td>
    <td><pre lang="haskell">newtype</pre></td>
    <td>...</td>
  </tr>

  <tr>
    <th>Elm</th> 
    <td><pre lang="elm">::</pre></td>
    <td><pre lang="elm">:</pre></td>
    <td><pre lang="elm">List Int</pre></td>
    <td><pre lang="elm">type alias</pre></td>
    <td><pre lang="elm">type</pre></td>
    <td>existiert nicht</td>
    <td>...</td>
  </tr>
</table>

## Standardtypen und -funktionen

* `String`s sind nicht Listen von `Char`s
* `Set`s, `Dict`s, `Array`s
* record types with subtyping

<table>
  <tr>
    <th>Haskell</th>
    <td><pre lang="haskell">id</pre></td>
    <td><pre lang="haskell">const</pre></td>
    <td><pre lang="haskell">.</pre></td>
    <td>...</td>
  </tr>

  <tr>
    <th>Elm</th> 
    <td><pre lang="elm">identity</pre></td>
    <td><pre lang="elm">always</pre></td>
    <td><pre lang="elm"><<</pre></td>
    <td>...</td>
  </tr>
</table>

## Sprachfeatures

Keine Typklassen!

Aber `Array.map`, `Dict.map`, `Json.Decode.map`, `List.map`, `Maybe.map`, ...

Und überladene Typen für einige spezifische Zwecke:
```elm
(+) : number -> number -> number

sort : List comparable -> List comparable

(++) : appendable -> appendable -> appendable

lexicographic : (comparable, comparable') -> (comparable, comparable') -> Bool
lexicographic (a,b) (x,y) = a < x || a == x && b <= y
```

Modul-`import` per Default immer qualifizert. Explizite Abweichung mittels etwa `import List exposing (map)`.

Keine `IO`-Monade, da anderes Interaktionskonzept. Aber `Task`-Typkonstruktor spielt eine ähnliche Rolle.

## Semantik

Strikte Auswertung!

