import Graphics.Element exposing (..)
import Mouse

main : Signal Element
main = Signal.map show (Signal.foldp (\_ c -> c + 1) 0 Mouse.clicks)

