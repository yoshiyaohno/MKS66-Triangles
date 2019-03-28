module Solids where

import Line
import Transform
import qualified Data.List as L

newtype Triangle a = Triangle (Vect a, Vect a, Vect a)

instance Functor Triangle where
    fmap f (Triangle (a, b, c)) = Triangle (fmap f a, fmap f b, fmap f c)

toEdges :: Triangle a -> [Line a]
toEdges (Triangle (a, b, c)) = [Line a b, Line b c, Line a c]

drawTriangles :: Color -> [Triangle Double] -> DrawAction
drawTriangles c = mconcat . concat
                    . map (map (drawLine c) . toEdges . fmap round)

-- these four points go clockwise to face the normal into you
stitch4 :: Vect t -> Vect t -> Vect t -> Vect t -> [Triangle t]
stitch4 a b c d = [Triangle (a, b, c), Triangle (a, c, d)]

box :: (Floating a, Enum a) => a -> a -> a -> a -> a -> a -> [Triangle a]
box cx cy cz w h d = let
    [p000, p001, p010, p011, p100, p101, p110, p111] = 
        [Vect (cx + qx * w) (cy + qy * h) (cz + qz * d) 1
            | qx <- [0,1], qy <- [0,1], qz <- [0,1]]
                in stitch4 p000 p010 p110 p100
                   ++ stitch4 p100 p110 p111 p101
                   ++ stitch4 p111 p011 p001 p101
                   ++ stitch4 p110 p010 p000 p001
                   ++ stitch4 p011 p111 p110 p010
                   ++ stitch4 p000 p100 p101 p001
    -- y a h o o

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

