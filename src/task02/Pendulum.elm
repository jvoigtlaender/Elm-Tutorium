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

