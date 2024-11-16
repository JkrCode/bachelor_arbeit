#!/bin/bash

# Load environment variables
source .env

# Build for ARM
echo "Building for ARM..."
GOOS=linux GOARCH=arm GOARM=7 go build -o monolith

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi

echo "Build successful!"

# Install sshpass if not already installed
if ! command -v sshpass &> /dev/null; then
    echo "sshpass is not installed. Installing..."
    sudo apt-get update && sudo apt-get install -y sshpass
fi

# Transfer binary
echo "Transferring binary to remote host..."
sshpass -p "$REMOTE_PASS" scp monolith $REMOTE_USER@$REMOTE_HOST:/home/admin1/BA/monolith

# Make binary executable and run it
echo "Starting application on remote host..."
sshpass -p "$REMOTE_PASS" ssh $REMOTE_USER@$REMOTE_HOST "chmod +x /home/admin1/BA/monolith && cd /home/admin1/BA/monolith && ./monolith"