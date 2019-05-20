from flask import Flask , render_template

app = Flask(__name__)

@app.route('/')
def homePage():
    return render_template("index.html")

@app.route('/blog')
def blogPage():
    return render_template("blogPage.html")

@app.route('/contact')
def contactPage():
    return render_template("contactPage.html")

app.run(host='0.0.0.0',port = 5000)

