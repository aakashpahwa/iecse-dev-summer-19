from flask import Flask, render_template, request , Response # Import Flask
import json

app = Flask(__name__) # Initialize Flask App

data = {
    1 : {
        "name" : "Bamboozled",
        "description" : "Offline Non Technical Event",
        "winner": "Deadsoul",
        "reviews": "10/10 would recommend",
        "status": "inactive"

    },
    2 : {
        "name" : "Cicada",
        "description" : "Online Cryptic Hunt",
        "winner": "Deadsoul",
        "reviews": "Mindbinding",
        "status": "active"
    },
    3 : {
        "name" : "Online coding",
        "description" : "Online coding event spanning over 3 days",
        "winner": "Deadsoul",
        "reviews": "Cool",
        "status": "delayed"
    }
}

@app.route('/getEventDescription' , methods=['POST']) 
def EventDescription():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                datanew = {}
                datanew["name"] = data[event_id]["name"]
                datanew["description"] = data[event_id]["description"]
                datanew["success"] = True
                return Response( json.dumps(datanew) , status = 200 , mimetype='application/json' ) 
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )       

@app.route('/getEventWinners' , methods=['POST']) 
def EventWinners():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                datanew = {}
                datanew["winner"] = data[event_id]["winner"]
                datanew["success"] = True
                return Response( json.dumps(datanew) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )      

@app.route('/getEventReviews' , methods=['POST']) 
def EventReviews():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                datanew = {}
                datanew["reviews"] = data[event_id]["reviews"]
                datanew["success"] = True
                return Response( json.dumps(datanew) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )      

@app.route('/getEventStatus' , methods=['POST']) 
def EventStatus():
    content = request.json
    if "event_id" in content:
        try: 
            event_id = int(content["event_id"])
            if event_id in data:
                datanew = {}
                datanew["status"] = data[event_id]["status"]
                datanew["success"] = True
                return Response( json.dumps(datanew) , status = 200 , mimetype='application/json' )
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) 
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )


app.run( host='0.0.0.0' , port=5000 ) 
