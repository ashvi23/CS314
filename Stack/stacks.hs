import Data.List
import Data.Bool
data MyStack a = MyStack [a]
	deriving (Show, Eq)
{-myStackPop:: [a] -> [a]
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
-}

myPush :: a -> MyStack a -> MyStack a
myPush b (MyStack xs) =  MyStack(b:xs)

myPop ::  MyStack a -> MyStack a
myPop (MyStack xs) = if length xs == 0 then error "Empty Stack" else MyStack(tail xs)
--myPop (MyStack xs) = MyStack(tail xs)

myIsEmpty :: MyStack a -> Bool
myIsEmpty (MyStack xs) = if length xs == 0 then True else False

myPeek:: MyStack a -> a
myPeek (MyStack (x:xs)) = if length xs == 0 then error "Empty Stack" else x

