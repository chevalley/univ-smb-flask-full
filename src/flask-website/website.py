from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def start(): 
    return render_template('auth.html')
    
@app.route("/index", methods=['POST'])
def index():
    pseudo = request.form['pseudo']
    mdp = request.form['mdp']
    data = list([pseudo, mdp])
    answer = requests.post('http://127.0.0.1:5001/api/recup-data', json = data)
    if answer.ok:
        return render_template('start.html')
    else:
        return render_template('auth.html')

@app.route("/logged")
def logged():
    return render_template('loggedusers.html')