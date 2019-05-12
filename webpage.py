from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def main():
		return render_template('homepage.html')

@app.route('/Functional') 
def functional():
	output = 'Functional'
	return output 

@app.route('/Imperative')
def imperative():
	output = 'Imperative'
	return output

@app.route('/static_page')
def static_page():
	output = 'Static'
	return output

@app.route('/Dynamic')
def dynamic():
	output = 'Dynamic'
	return output

@app.route('/DS')
def data_structure():
	output = 'Data Structures'
	return output
@app.route('/Stacks/')
def stacks():
	return render_template('stacks.html')
if __name__ == '__main__':
	app.run(host='0.0.0.0', port = 5000)
