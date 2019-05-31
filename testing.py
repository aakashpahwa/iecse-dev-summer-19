from flask import Flask,render_template,request,Response
import json

app = Flask(__name__)

data = {
	1 : {
		"name" : "abcd",
		"description" : "4 letters",
		"winners" : "Shashi Tharoor",
		"reviews" : "LLOOOLLL",
		"status" : "cancelled"
		},
	2 : {
		"name" : "1234",
		"description" : "4 numbers",
		"winners" : "Ramanujan",
		"reviews" : "FFFFFF",
		"status" : "inactive"
	}
}


@app.route('/getEventDescription', methods=['POST'])
def despage():
	content=request.json
	if "eventid" in content :
		eventid = int(content["eventid"])
		if eventid in data:
			ret = data[eventid]["description"]
			ret = json.dumps(ret)
			return Response(ret, status = 200, mimetype='application/json')
		else :
			return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')
	else :
		return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')	


@app.route('/getEventWinners', methods=['POST'])
def winpage():
	content=request.json
	if "eventid" in content :
		eventid = int(content["eventid"])
		if eventid in data:
			ret = data[eventid]["winners"]
			ret = json.dumps(ret)
			return Response(ret, status = 200, mimetype='application/json')
		else :
			return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')
	else :
		return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')


@app.route('/getEventReviews', methods=['POST'])
def revpage():
	content=request.json
	if "eventid" in content :
		eventid = int(content["eventid"])
		if eventid in data:
			ret = data[eventid]["reviews"]
			ret = json.dumps(ret)
			return Response(ret, status = 200, mimetype='application/json')
		else :
			return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')
	else :
		return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')


@app.route('/getEventStatus', methods=['POST'])
def statpage():
	content=request.json
	if "eventid" in content :
		eventid = int(content["eventid"])
		if eventid in data:
			ret = data[eventid]["status"]
			ret = json.dumps(ret)
			return Response(ret, status = 200, mimetype='application/json')
		else :
			return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')
	else :
		return Response("{\"success\":\"false\"}" ,status = 200, mimetype= 'application/json')

app.run (host='0.0.0.0', port=5000, debug=True)