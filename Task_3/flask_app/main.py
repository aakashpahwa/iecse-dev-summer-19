from flask import Flask, render_template, request , Response
import json
import mysql

app = Flask(__name__) 

data = {
    1 : {
        "name" : "Battleship",
        "description" : "Offline coding Event",
        "winner": "Nitigya",
        "reviews": "10/10 would recommend",
        "status": "inactive"

    },
    2 : {
        "name" : "Cicada",
        "description" : "Online Cryptic Hunt",
        "winner": "Aakash",
        "reviews": "Mindbinding , head scratching puzzles , had fun",
        "status": "active"
    },
    3 : {
        "name" : "Online coding",
        "description" : "Online coding event spanning over 3 days",
        "winner": "Archit",
        "reviews": "It was easy af -Archit",
        "status": "delayed"
    }
}

@app.route('/getEventDescription' , methods=['POST']) 
def homepage():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["name"] = data[event_id]["name"]
                ret["description"] = data[event_id]["description"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )     

@app.route('/getEventWinners' , methods=['POST']) 
def homepage_3():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["winner"] = data[event_id]["winner"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )      

@app.route('/getEventReviews' , methods=['POST']) 
def homepage_1():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["reviews"] = data[event_id]["reviews"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )      

@app.route('/getEventStatus' , methods=['POST']) 
def homepage_2():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["status"] = data[event_id]["status"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )      

app.run( host='0.0.0.0' , port=5000 , debug=True ) 

