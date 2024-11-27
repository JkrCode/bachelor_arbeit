#!/bin/bash

# Navigate to the mono folder
echo "Navigating to the /mono folder..."
cd mono/ || { echo "Failed to navigate to /mono/ folder. Exiting."; exit 1; }

# Execute the existing script
echo "Executing build script in /mono/ folder..."
./deploy.sh

# Check if the script executed successfully
if [ $? -eq 0 ]; then
    echo "Build and deployment completed successfully!"
else
    echo "Build or deployment failed!"
    exit 1
fi

# Return to the root directory
echo "Returning to the root directory..."
cd ..
