from flask import Flask, render_template # Import Flask

app = Flask(__name__) # Initialize Flask App

@app.route('/') 
def home():
    return render_template("home.html")

@app.route('/blog') 
def blog():
    return render_template("blog.html") 

@app.route('/contactus') 
def contactus():
    return render_template("contactus.html") 

app.run( host='0.0.0.0' , port=5000 )
