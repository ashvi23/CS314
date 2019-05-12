#Queue Implmentation

#Queue class
class Queue:
	def __init__(self):
		self.queue = []
		
	def enqueue(self, data):
		self.queue.insert(0, data)
		
	def dequeue(self, data):
		temp = self.queue.pop()
		return temp
		
	def peek(self):
		if queue:
			return queue[-1] 
		else:
			return None	
			
	def isEmpty(self):
		if self.queue == []:
			return True
		else:
			return False
	
