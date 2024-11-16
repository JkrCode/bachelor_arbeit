#!/bin/bash

# Configuration
REMOTE_USER="admin1"               # Your SSH username
REMOTE_HOST="raspberrypi1"         # Your remote machine's hostname or IP address
PORT=8080                          # The port to check

# Connect to the remote machine and stop the server
echo "Connecting to $REMOTE_USER@$REMOTE_HOST to stop the server on port $PORT..."

ssh -t $REMOTE_USER@$REMOTE_HOST << EOF
    echo "Looking for process running on port $PORT..."
    PID=\$(lsof -t -i :$PORT)

    if [ -n "\$PID" ]; then
        echo "Process found on port $PORT with PID \$PID. Stopping it..."
        sudo kill -9 \$PID
        echo "Server on port $PORT has been stopped."
    else
        echo "No process found running on port $PORT."
    fi
EOF

echo "Done."
