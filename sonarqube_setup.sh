#!/bin/bash

# Step 1: Download SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip

# Step 2: Unzip the package
unzip sonarqube-8.9.6.50800.zip

# Step 3: Rename directory for easier access
mv sonarqube-8.9.6.50800 sonar

# Step 4: Navigate to the executable directory
cd sonar/bin/linux-x86-64

# Step 5: Make the script executable
chmod +x sonar.sh

# Step 6: Start SonarQube
sh sonar.sh start

# Step 7: Dynamically tail the main log file
# Wait for logs to be generated
LOG_DIR="../../logs"
echo "Waiting for SonarQube logs to be generated..."
sleep 5

if [ -d "$LOG_DIR" ]; then
  # Tail all logs in the logs directory
  tail -f $LOG_DIR/*.log
else
  echo "Log directory does not exist. Check SonarQube startup."
  exit 1
fi
