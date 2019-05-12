import Data.List
import Data.Bool

data Linklist a = Cons a (Linklist a)| Null  deriving (Show, Eq)

-- takes in list [x...y], builds (Cons x(Cons y Null))
myBuild:: [a] -> Linklist a
myBuild = foldr Cons Null

myToList :: Linklist a -> [a]
myToList Null = []
myToList (Cons a ll) = a:(myToList ll)

isNull :: Linklist a -> Bool
isNull Null = True
isNull (Cons a _) = False

{-isElem :: Eq a => Linklist a -> Bool
isElem target Null = False
isElem target (Cons a _) = True-	| target == a = True
	| target /= a = isElem target (myNext ll)-}

myhead :: Linklist a -> a
myhead Null = error "Link List is empty"
myhead l = case l of 
	Cons a _ -> a

myNext:: Linklist a -> Linklist a
myNext Null = error "Next is NULL"
myNext (Cons _ ll) = ll

myInsertFront :: a -> Linklist a -> Linklist a
myInsertFront a ll = Cons a ll

myInsertEnd :: a-> Linklist a -> Linklist a
myInsertEnd a (Cons x ll) = myBuild ( (myToList ll) ++ [a])
{-
myDelete :: Eq a => Linklist a -> Linklist a 
myDelete t (Cons a ll) -}
