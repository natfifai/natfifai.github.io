#!/bin/bash
# Publish script — builds and pushes to GitHub
# Usage: ./publish.sh "commit message"

cd /data/.openclaw/workspace/fifer-digital-blog

# Build site to verify no errors
hugo --minify
if [ $? -ne 0 ]; then
    echo "ERROR: Hugo build failed"
    exit 1
fi

# Git add, commit, push
git add -A
git commit -m "${1:-New content update}"
git push origin main

echo "Published successfully!"
