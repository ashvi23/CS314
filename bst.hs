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

{-HOW TO RUN:
ghci
:load bst
let nums = [1,2,3,4] -- the numbers you want in the tree 
lt nt = makeTree nums -- creates the tree
insertNode _ nt -- inserts a specified element to the tree
deleteNode _ nt -- deletes a specified element from the tree
	-> must exist in the given tree ex you cant 
	create nt then insert a node and then delete that inserted node usng nt, 
	because nt is immutable only copies are created of nt. 
	Original nt does not have new node

to insert a node and have it be a part of that list do
let xt = insertNode _ nt
deleteNode xt _ will work

-}

-- takes in a list and makes it into a tree
makeTree :: (Ord a) => [a] -> BST a
makeTree x = foldr insertNode Empty $ reverse x

-- creates a single node with two empty children
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



