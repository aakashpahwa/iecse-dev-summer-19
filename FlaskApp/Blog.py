from flask import Flask, render_template # Import Flask

app = Flask(__name__) # Initialize Flask App

@app.route('/') 
def homepage():
    return render_template("home.html") 

app.run( host='0.0.0.0' , port=5000 )
