from flask import Flask, render_template # Import Flask

app = Flask(__name__) # Initialize Flask App

@app.route('/') # Decorator, wrapping function homepage 
def homepage():
    return render_template("index.html") 

app.run( host='0.0.0.0' , port=5000 ) # The Flask App will run on localhost, at port 5000