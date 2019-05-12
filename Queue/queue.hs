import Data.List
import Data.Bool
data MyQueue a = MyQueue [a]
	deriving (Show, Eq)
{-myEnqueue:: a->[a]->[a]
myEnqueue x xs = xs ++ (x:[])

myDequeue:: [a] -> [a]
myDequeue [] = error "Queue Empty"
myDequeue xs = tail xs

myFront:: [a] -> a
myFront [] = error "Queue empty"
myFront xs = xs!!0 -}

myEnqueue :: a -> MyQueue a -> MyQueue a
myEnqueue b (MyQueue xs) =  MyQueue(xs ++[b])

myDequeue ::  MyQueue a -> MyQueue a
myDequeue (MyQueue xs) = if length xs == 0 then error "Empty Stack" else MyQueue(tail xs)

myIsEmpty :: MyQueue a -> Bool
myIsEmpty (MyQueue xs) = if length xs == 0 then True else False

myPeek:: MyQueue a -> a
myPeek (MyQueue (x:xs)) = if length xs == 0 then error "Empty Stack" else x

