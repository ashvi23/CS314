#BST Implementation

#BST Node
class BSTNode(object):
	
	def __init__(self, data):
		self.data = data
		self.left = None
		self.right = None
		
#Insert Method
def insert(root, data):
	if root is None:
		root = Node(data)
		return root
	
	if data < root.data:
		root.left = insert(root.left, data)
	elif data > root.data:
		root.right = insert(root.right, data)
		
	return root

		
#Min value node - returns node with the smallest data in the tree
def minVal(root):
	ptr = root
	
	while(ptr.left is not None):
		ptr = ptr.left
		
	return ptr
					
#Delete Method
def delete(root, data):
	if root is None:
		return root
	
	if data < root.data:
		root.left = delete(root.left, data)
	elif data > root.data:
		root.right = delete(root.right, data)
	else:
		if root.left is None:
			temp = root.right
			root = None
			return temp
		elif root.right is None:
			temp = root.left
			root = None
			return temp
		else: # two children
			temp = minVal(root.right)
			root.data = temp.data
			root.right = delete(root.right, temp.data)
			
	return root	
