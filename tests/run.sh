#!/usr/bin/env bash
# Unit tests (quality gate). A failing test blocks the pull request.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
source src/app.sh
out=$(greet "ping")
[ "$out" = "app dev: ping" ] || { echo "FAIL: greet returned '$out'"; exit 1; }
echo "ok: greet"
out=$(login "anna")
[ "$out" = "welcome anna" ] || { echo "FAIL: login returned '$out'"; exit 1; }
if login "" 2>/dev/null; then echo "FAIL: login without user must fail"; exit 1; fi
echo "ok: login"
