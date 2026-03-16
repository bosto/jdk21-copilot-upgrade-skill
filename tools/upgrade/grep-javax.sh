#!/usr/bin/env bash
set -e

echo "Scanning source code for javax imports"
grep -RIn "import javax." src || true