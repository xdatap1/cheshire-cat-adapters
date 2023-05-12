<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f5f5f5;
        }

#chatbox {
    flex-grow: 1;
    overflow-y: auto;
    padding: 10px;
    border-bottom: 1px solid #ccc;
    background-color: #fff;
    margin-top: auto; /* Added to push the chatbox to the top */
}

#inputContainer {
    display: flex;
    padding: 10px;
    background-color: #fff;
    box-shadow: 0px -1px 5px rgba(0,0,0,0.1);
    margin-top: auto; /* Added to push the input container to the top */
}


        #userInput {
            flex-grow: 1;
            height: 30px;
            padding: 5px;
            border: 1px solid #ccc;
            margin-right: 10px;
        }

        button {
            height: 30px;
            padding: 5px 10px;
            border: none;
            color: #fff;
            background-color: #4285f4;
            cursor: pointer;
            min-width: 100px; /* Added to give the button a minimum width */
        }

        button:hover {
            background-color: #2b78e4;
        }

        .message {
            margin-bottom: 10px;
            line-height: 1.4;
        }

        .server {
            color: #4285f4;
            font-weight: bold;
        }

        .client {
            color: #34a853;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="chatbox"></div>
    <div id="inputContainer">
        <input id="userInput" type="text" />
        <button onclick="sendMessage()">Send</button>
    </div>

   <script>
        // Initialize a new WebSocket connection to the server
        const socket = new WebSocket('ws://localhost:1865/ws');

        // Connection opened
        socket.addEventListener('open', (event) => {
            writeToChatBox('Connected to the AI Agent.');
        });

        // Listen for messages
        socket.addEventListener('message', (event) => {
            // Parse the JSON object from the server
            const serverMessage = JSON.parse(event.data);
            writeToChatBox('AI Agent: ' + serverMessage.content);
        });

        // Connection closed
        socket.addEventListener('close', (event) => {
            writeToChatBox('Disconnected from the AI Agent.');
        });

        // Write a message to the chat box
        function writeToChatBox(message) {
            const chatbox = document.getElementById('chatbox');
            chatbox.innerHTML += message + '<br />';
            chatbox.scrollTop = chatbox.scrollHeight;
        }

        // Send a message to the server
        function sendMessage() {
            const userInput = document.getElementById('userInput');
            // Send a JSON object with a "text" field
            if(userInput.value.trim() !== '') { // Prevent sending empty messages
                const message = JSON.stringify({ text: userInput.value });
                socket.send(message);
                writeToChatBox('You: ' + userInput.value);
                userInput.value = '';
            }
        }

        // Listen for enter key in the input field
        document.getElementById('userInput').addEventListener('keyup', function(event) {
            // Number 13 is the "Enter" key on the keyboard
            if (event.key === 'Enter') {
                // Cancel the default action, if needed
                event.preventDefault();
                // Trigger the button element with a click
                sendMessage();
            }
        });
    </script>
</body>
</html>
