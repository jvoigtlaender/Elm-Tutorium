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

