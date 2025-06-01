#!/usr/bin/env bash

set -e

# Repo settings
REPO_URL="https://github.com/AstroNvim/template.git"
REPO_DIR="template"

# Clone the repo if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning $REPO_URL into $REPO_DIR..."
    git clone "$REPO_URL" "$REPO_DIR"
else
    echo "Repo already exists. Pulling latest changes..."
    git -C "$REPO_DIR" pull
fi

# Copy changes, excluding .git, this script, and possibly other patterns
echo "Copying files from $REPO_DIR to current directory..."

rsync -av --exclude='.git' --exclude='*.sh' --exclude='*.md' "$REPO_DIR"/ ./

echo "Done."
