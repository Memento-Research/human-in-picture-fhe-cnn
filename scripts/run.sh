#!/bin/bash

source cnn_venv/bin/activate

# ANSI escape codes for colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

IMAGE_SIZE="64"

# Remove .artifacts at the beginning
rm -rf .artifacts

while true; do
    python3 src/ConvolutionalNeuralNetwork.py "$IMAGE_SIZE"
    exit_code=$?

    if [ $exit_code -ne 1 ]; then
        echo -e "${GREEN}Program finished successfully.${NC}"
        break
    fi

    echo -e "${RED}Program exited with code 1. Deleting .artifacts and rerunning...${NC}"
    rm -rf .artifacts

done