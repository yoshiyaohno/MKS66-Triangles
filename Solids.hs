module Solids where

import Line
import Transform
import qualified Data.List as L

--stitch4 :: Vect a -> Vect a -> Vect a -> Vect a -> [Line a]

box :: (Floating a, Enum a) => a -> a -> a -> a -> a -> a -> [Vect a]
box cx cy cz w h d =
    -- y a h o o
    [ Vect cx cy cz 1, Vect (cx + w) cy cz 1
    , Vect cx cy cz 1, Vect cx (cy + h) cz 1
    , Vect cx (cy + h) cz 1, Vect (cx + w) (cy + h) cz 1
    , Vect (cx + w) cy cz 1, Vect (cx + w) (cy + h) cz 1
    , Vect cx cy cz 1, Vect cx cy (cz + d) 1
    , Vect cx (cy + h) cz 1, Vect cx (cy + h) (cz + d) 1
    , Vect (cx + w) cy cz 1, Vect (cx + w) cy (cz + d) 1
    , Vect (cx + w) (cy + h) cz 1, Vect (cx + w) (cy + h) (cz + d) 1
    , Vect cx cy (cz + d) 1, Vect (cx + w) cy (cz + d) 1
    , Vect cx cy (cz + d) 1, Vect cx (cy + h) (cz + d) 1
    , Vect cx (cy + h) (cz + d) 1, Vect (cx + w) (cy + h) (cz + d) 1
    , Vect (cx + w) cy (cz + d) 1, Vect (cx + w) (cy + h) (cz + d) 1
    ]

sphere :: (Floating a, Enum a) => a -> a -> a -> a -> [Vect a]
sphere cx cy cz r =
    [Vect (cx + r * cos thet) (cy + r * sin thet * cos phi)
          (cz + r * sin thet * sin phi) 1
            | thet <- [0, 0.06 .. pi], phi <- [0, 0.09 .. 2*pi]]

torus :: (Floating a, Enum a) => a -> a -> a -> a -> a -> [Vect a]
torus cx cy cz r0 r1 =
    [Vect (cx + r0 * cos thet * cos phi + r1 * cos phi) (cy + r0 * sin thet)
          (cz - sin phi * (r0 * cos thet + r1)) 1
            | thet <- [0, 0.09 .. 2*pi], phi <- [0, 0.09 .. 2*pi]]

