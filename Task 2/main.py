from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def homepage():
	return render_template("home.html")

@app.route('/blog')
def blogpage():
	return render_template("blog.html")

@app.route('/contact')
def contactpage():
	return render_template("contact.html")

if __name__ == '__main__':
   app.run(debug = True)
