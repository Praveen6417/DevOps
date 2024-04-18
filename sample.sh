#!/bin/bash

# Run a command that generates both stdout and stderr
output=$(ls /nonexistent/directory 2>&1)

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Command succeeded."
else
    echo "Command failed with exit status $?."
fi

# Separate the captured output into stdout and stderr
echo "Standard Output:"
echo "$output" | grep -v "No such file"

echo "Standard Error:"
echo "$output" | grep "No such file"
