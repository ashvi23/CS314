import Data.List
import Data.Bool

myStackPop:: [a] -> [a]
myStackPop [] = []
myStackPop [s] = []
myStackPop xs = tail(xs)

myStackPush:: a->[a]->[a]
myStackPush x xs = x:xs

myStackisEmpty:: [a] -> Bool
myStackisEmpty [] = True 
myStackisEmpty xs = False

myStackPeek:: [a] -> a
myStackPeek [] = error "Stack empty"
myStackPeek xs = xs!!0 


