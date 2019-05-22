from flask import Flask, render_template , redirect, url_for,request
app = Flask(__name__)

@app.route('/home')
def homepage():
	return render_template("index.html")


@app.route('/blog')
def blogpage():
	return render_template("blog.html")

@app.route('/contact')
def contactpage():
	return render_template("contact.html")

app.run( host='0.0.0.0',port=5000)