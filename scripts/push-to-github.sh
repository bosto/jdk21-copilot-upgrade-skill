#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: ./scripts/push-to-github.sh <github-repo-url>"
  echo 'example: ./scripts/push-to-github.sh git@github.com:YOUR_USER/jdk21-copilot-upgrade-skill-repo.git'
  exit 1
fi

repo_url="$1"

git init
git add .
git commit -m "Add JDK 21 Copilot upgrade skill template"
git branch -M main
git remote add origin "$repo_url"
git push -u origin main
