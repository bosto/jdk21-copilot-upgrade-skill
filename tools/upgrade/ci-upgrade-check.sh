#!/usr/bin/env bash
set -euo pipefail
mkdir -p .upgrade-output
bash tools/upgrade/grep-javax.sh . | tee .upgrade-output/javax-scan.txt
bash tools/upgrade/grep-legacy-apis.sh . | tee .upgrade-output/legacy-api-scan.txt
bash tools/upgrade/scan-middleware.sh . | tee .upgrade-output/middleware-scan.txt
bash tools/upgrade/scan-dependencies.sh . | tee .upgrade-output/dependency-scan.txt
bash tools/upgrade/check-docker-jenkins-runtime.sh . | tee .upgrade-output/runtime-hints.txt
echo "CI-style upgrade checks completed"
