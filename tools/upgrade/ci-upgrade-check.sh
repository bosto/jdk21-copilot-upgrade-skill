#!/usr/bin/env bash
set -euo pipefail

bash tools/upgrade/grep-javax.sh .
bash tools/upgrade/grep-legacy-apis.sh .
bash tools/upgrade/scan-dependencies.sh .
echo "CI-style upgrade checks completed"
