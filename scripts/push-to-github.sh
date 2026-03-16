#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "usage: ./scripts/push-to-github.sh <github-repo-url>"
  exit 1
fi
repo_url="$1"
git init
git add .
git commit -m "Add customized JDK 21 upgrade Copilot skills template"
git branch -M main
git remote add origin "$repo_url"
git push -u origin main
