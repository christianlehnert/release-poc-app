#!/usr/bin/env bash
# Unit tests (quality gate). A failing test blocks the pull request.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
source src/app.sh
out=$(greet "ping")
[ "$out" = "app dev: ping" ] || { echo "FAIL: greet returned '$out'"; exit 1; }
echo "ok: greet"
