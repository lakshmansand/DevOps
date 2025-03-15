#!/bin/bash

# Exit if any command fails
set -e

echo "Running frontend.sh..."
sudo bash frontend.sh

echo "Running mysql.sh..."
sudo bash mysql.sh

echo "Running backend.sh..."
sudo bash backend.sh

echo "All scripts executed successfully!"
