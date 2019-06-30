from flask import Flask,render_template, request,Response,jsonify


app = Flask(__name__)

data = {
    1 : {
        "name" : "Afterburner",
        "type" : "code",
        "description" : "More Powah!",
        "winner" : "Dennis J",
        "status" : "inactive",
        "rating" : 3
    },
    2 : {
        "name" : "Artemis",
        "type" : "design",
        "description" : "Moonshot",
        "winner" : "Dennis T",
        "status" : "inactive",
        "rating" : 4
    }, 
    3 : {
        "name" : "Black Falcon",
        "type" : "dev",
        "description" : "Dicrete jet testing",
        "winner" : "Dennis G",
        "status" : "completed",
        "rating" : 5
    },
}

@app.route('/')
def homePage():
    return('Homepage endpoint')

@app.route('/getEvents',methods=['GET'])
def returnEvents():
    return jsonify(data)





# if __name__ == '__main__':
#     app.run()
app.run( host='0.0.0.0' , port=5000 , debug=True )