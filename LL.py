#Python Linked List Implementation

#Node Class
class Node(object):
	def __init__ (self, data = None, next = None):
		self.data = data
		self.next = next
		
	def getData(self):
		return self.data
		
	def getNext(self):
		return self.next
		
	def setNext(self, next_node):
		self.next = next_node
		
#LL Class
class LL(object):
	def __init__ (self, head = None):
		self.head = head
		
	#Insert Method
	def insert(self, data):
		node = Node(data)
		node.setNext(self.head)
		self.head = node
		
	#Delete Method
	def delete(self, data):
		ptr = self.head
		prev = None
		while ptr is not None:
			if ptr.getData == data:
				prev.setNext(ptr.getNext())
				break
			else:
				prev = ptr
				ptr = ptr.getNext()
		if prev is None:
			self.head = ptr.getNext()
		if ptr is None:
			print "Data is not in linked list."
