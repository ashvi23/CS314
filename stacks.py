#Stack Implementation

#Stack class
class Stack:
	def __init__(self):
		self.stack = []
	
	def push(self, data):
		self.stack.append(data)
		
	def pop(self, data):
		temp = self.stack.pop()
		return temp
		
	def peek(self):
		if stack:
			return stack[-1] 
		else:
			return None
		
	def isEmpty(self):
		if self.stack == []:
			return True
		else:
			return False
