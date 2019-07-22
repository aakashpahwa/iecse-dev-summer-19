from flask import Flask,render_template, request,Response
import json

app= Flask(__name__)

data = {
    1 : {
        "name" : "Cricket World Cup",
        "description" : "Hyped",
        "winner" : "India",
        "status" : "completed",
        "review" : "'Overrated"
    },
    2 : {
        "name" : "Wimbledon",
        "description" : "Boring",
        "winner" : "Roger Federrer",
        "status" : "inactive",
        "review" : "'Interesting"
    }, 
    3 : {
        "name" : "Fifa World Cup",
        "description" : "Fun massacare",
        "winner" : "England",
        "status" : "completed",
        "review" : "'Fun"
    },
}

@app.route('/getEventDescription' , methods=['POST']) 
def descPage():
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
def winnersPage():
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
def reviewsPage():
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
def statusPage():
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
