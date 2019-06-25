from flask import Flask, render_template, request , Response, jsonify
import json

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def events():
    return jsonify({
        "events": [
    {
        "name" : "GAMBIT",
        "rating" : "5",
        "type" : "code",
        "sdesc" : "Offline Coding Event",
        "ldesc" : "A fast paced offline coding event where you bet on your coding skills, to rise to the top of the leaderboard."
    },
    {
        "name" : "BATTLESHIP",
        "rating" : "4",
        "type" : "code",
        "sdesc" : "Offline Coding Event",
        "ldesc" : "An offline coding event where you code efficient algorithms to defeat the Syndicate at sea and keep them at bay.."
    },
    {
        "name" : "CICADA",
        "rating" : "4",
        "type" : "puzzle",
        "sdesc" : "A Puzzle Solving, Two Round Event",
        "ldesc" : "Think you're a code-breaker? Test your skills with Cicada, an event with some of the most head scratching puzzles you've ever seen. Rack your brains, first online and then offline in the final round."
    },
    {
        "name" : "NEGATIVE SPACE",
        "rating" : "3",
        "type" : "design",
        "sdesc" : "Offline Graphic Design Event",
        "ldesc" : "A Graphic Designing competition providing an unparalleled opportunity for emerging designers to gain exposure and put their creative skills to the test."
    },
    ]})

if __name__ == '__main__':
    app.run()
