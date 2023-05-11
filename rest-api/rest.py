import json
import asyncio
from flask import Flask, request, render_template, jsonify
from flask_cors import CORS
import websockets


rest = Flask(__name__)
CORS(rest)

async def send_to_websocket(text):
    async with websockets.connect("ws://localhost:1865/ws") as websocket:
        await websocket.send(json.dumps({'text': text}))
        response = json.loads(await websocket.recv())
        return response.get('content', 'No content found in response')

@rest.route('/send_text', methods=['POST'])
def send_text():
    text = request.form.get('text')
    content = asyncio.run(send_to_websocket(text))
    return jsonify({'content': content})

@rest.route('/')
def index():
    return render_template('index.html')
