import Data.List
import Data.Bool
import Data.Ord

data BST a= Empty | Node a (BST a) (BST a) deriving (Eq, Ord, Show, Read)
{-
-create node
-insert
-delete
-print
-isEmpty
-doesExit
-}
makeTree :: (Ord a) => [a] -> BST a
makeTree x = foldr insertNode Empty $ reverse x

createNode :: a -> BST a
createNode val = Node val Empty Empty

{-Compare the value to insert with the value of the current node
	if val to insert is < then recurse with the tree on left else recurse with tree on right-}

insertNode :: (Ord a) => a -> BST a -> BST a
insertNode x Empty = createNode x
insertNode x (Node n lt rt) 
	|x == n = Node x lt rt
	|x < n = Node n (insertNode x lt) rt
	|x > n = Node n lt (insertNode x rt)
	 
isElem :: (Ord a) => a -> BST a -> Bool
isElem x Empty = False
isElem x (Node n lt rt)
	|x < n = isElem x lt
	|x > n = isElem x rt
	|otherwise = True

deleteNode :: (Ord a) => a -> BST a -> BST a
deleteNode x Empty = Empty 
deleteNode x (Node n lt rt)
	|isElem x (Node n lt rt) == False = error "Target is not in tree"
deleteNode x (Node n lt rt)
	|x < n = Node n (deleteNode x lt) rt -- trav left
	|x > n = Node n lt (deleteNode x rt) -- trav right
	|x == n = if lt == Empty -- one right child
				then rt
				else 
					if rt == Empty -- one left child
					then lt
					else (Node (treeMin rt) lt newRT) 
					where newRT = deleteNode (treeMin rt) rt -- two children -> get leftmost 

treeMin :: (Ord a) => BST a -> a
treeMin (Node n Empty rt) = n
treeMin (Node n lt rt) = treeMin lt
		





--deleteNode x (Node n lt rt) = if (isElem x (Node n lt rt)) == False then error "Node not in tree" else
-- if x == n  --and one child
--deleteNode x (Node n Empty rt) = rt
--deleteNode x (Node n lt Empty) = lt	
-- if x == n and 2 children

-- deletes the actual target node and replaces it with its min
{-delete2 :: (Ord a)=> BST a -> BST a
delete2 x (Node n lt rt) = 
	if lt == Empty -- one right child
	then rt
	else 
		if rt == Empty -- one left child
		then lt
		else (Node (treeMin rt) lt newRT) 
		where newRT = deleteNode (treeMin rt) rt -- two children -> get leftmost
-}



