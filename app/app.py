from flask import Flask, request, render_template, jsonify
import random
import time

from flask.helpers import send_from_directory

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods= ['POST'])
def process():
    first_name = request.form['firstName']
    last_name = request.form['lastName']
    welcome_list = ['Welkom', 'Welcome', 'Ласкаво просимо']
    output = f'{first_name} {last_name}'
    if first_name and last_name:
      return jsonify({'output': f'{random.choice(welcome_list)} {output}'})
    return jsonify({'error' : 'Missing data!'})

@app.route('/frameworks', methods= ['GET'])
def frameworks():
    return send_from_directory('static', 'features.json'), 200
    

if __name__ == '__main__':
    app.run(debug=True)
