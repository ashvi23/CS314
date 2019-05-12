import os
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def main():
		return render_template('homepage.html')

@app.route('/Functional') 
def functional():
	return render_template('functional.html') 

@app.route('/Imperative')
def imperative():
	return render_template('imperative.html') 

@app.route('/static_page')
def static_page():
	return render_template('static_page.html') 

@app.route('/Dynamic')
def dynamic():
	return render_template('dynamic.html') 

@app.route('/DS')
def data_structure():
	output = 'Data Structures'
	return output

@app.route('/Stacks/')
def stacks():
	return render_template('stacks.html')
@app.route('/Linklist/')
def linklist():
	return render_template('linklist.html')
@app.route('/BST/')
def bst():
	return render_template('bst.html')
@app.route('/Queue/')
def queue():
	return render_template('queue.html')
if __name__ == '__main__':
	port = int(os.environ.get('PORT', 5000))
	app.run(host='0.0.0.0', port = port)

