from flask import Flask, render_template, request , Response # Import Flask
import json

app = Flask(__name__) # Initialize Flask App

data = {
    1 : {
        "name" : "Gambit",
        "description" : "Legal Gambling??",
        "winner" : "Idk",
        "reviews" : "Amaze because of my work",
        "status" : "What? Like online offline?"
    },
    2 : {
        "name" : "Battleship",
        "description" : "Boommmm",
        "winner" : "Not me lmao",
        "reviews" : "Very cool. Gambit was cooler tho",
        "status" : "Financial status?"
    },
    3 : {
        "name" : "Online Coding",
        "description" : "Why are only coding events mentioned wtf??",
        "winner" : "Srinjoy",
        "reviews" : "Made me realise i suck at coding lolololol",
        "status" : "I am very poor"
    }
}

@app.route('/getEventDescription' , methods=['POST']) # Decorator, wrapping function homepage
def homepage():
    content = request.json
    if "event_id" in content:
        try: # Wrap in Try-Except in case event_id is sent in a non-acceptable format and int typecast fails
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["name"] = data[event_id]["name"]
                ret["description"] = data[event_id]["description"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' ) # Found
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Event Id does not exist in data
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Incorrect Event_id format
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Event_id not sent in request


@app.route('/getEventWinners' , methods=['POST']) # Decorator, wrapping function homepage
def homepage1():
    content = request.json
    if "event_id" in content:
        try: # Wrap in Try-Except in case event_id is sent in a non-acceptable format and int typecast fails
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["name"] = data[event_id]["name"]
                ret["winners"] = data[event_id]["winners"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' ) # Found
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Event Id does not exist in data
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Incorrect Event_id format
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )

@app.route('/getEventReviews' , methods=['POST']) # Decorator, wrapping function homepage
def homepage2():
    content = request.json
    if "event_id" in content:
        try: # Wrap in Try-Except in case event_id is sent in a non-acceptable format and int typecast fails
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["name"] = data[event_id]["name"]
                ret["reviews"] = data[event_id]["reviews"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' ) # Found
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Event Id does not exist in data
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Incorrect Event_id format
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )


@app.route('/getEventStatus' , methods=['POST']) # Decorator, wrapping function homepage
def homepage3():
    content = request.json
    if "event_id" in content:
        try: # Wrap in Try-Except in case event_id is sent in a non-acceptable format and int typecast fails
            event_id = int(content["event_id"])
            if event_id in data:
                ret = {}
                ret["name"] = data[event_id]["name"]
                ret["status"] = data[event_id]["status"]
                ret["success"] = True
                return Response( json.dumps(ret) , status = 200 , mimetype='application/json' ) # Found
            else:
                return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Event Id does not exist in data
        except:
            return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' ) # Incorrect Event_id format
    else:
        return Response( "{\"success\":\"false\"}" , status = 200 , mimetype='application/json' )

if __name__ == '__main__':
    app.run()
