#!/bin/bash

# Remove node_module within workspace
# Use on your machine only

echo "Deleting node_module in workspace ..."
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +

echo "Done !!"