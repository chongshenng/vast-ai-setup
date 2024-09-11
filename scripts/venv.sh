#!/bin/bash

# Set the Python version and virtual environment directory
PYTHON_VERSION="python3.11"
VENV_DIR=".venv"

# Check if python3.11 is installed
if ! command -v $PYTHON_VERSION &> /dev/null
then
    echo "$PYTHON_VERSION could not be found. Please install Python 3.11."
    exit 1
fi

# Create the virtual environment
$PYTHON_VERSION -m venv $VENV_DIR

# Check if virtual environment was created successfully
if [ -d "$VENV_DIR" ]; then
  echo "Virtual environment created in $VENV_DIR"
else
  echo "Failed to create virtual environment."
  exit 1
fi

# Activate the virtual environment
source $VENV_DIR/bin/activate

# Check if requirements.txt exists, then install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found. Skipping dependency installation."
fi

echo "Virtual environment setup complete."