#!/bin/bash
echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Training the model..."
python train.py > train.log 2>&1

echo "Done. Logs saved to train.log"
