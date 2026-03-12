# CrazyCattle3D Multiplayer server
from flask import Flask, jsonify
import json, random

started = False
npcs = {}
port = 0

def init():
    global started, npcs, port
    with open("config.json", 'r') as config:
        config = json.load(config)
        port = config["port"]
        # spawn npcs = npc count
        for i in range(config["botcount"]):
            npcs[str(i)] = [random.randint(-95, 180), 0, random.randint(-180, 40), 0, 0, 0, 0]
init() # this function is a function just for container purposes. Might cause later trigger in the future.

app = Flask(__name__)
@app.route('/npcs')
def npc_return():
    if started:
        return jsonify(npcs)
    else:
        return jsonify("ERROR: Currently in lobby.")


started = True # testing

if __name__ == '__main__':
    app.run(port=port)
