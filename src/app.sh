#!/usr/bin/env bash
# The "application": answers with its name and version. Stands in for a real service.
set -euo pipefail
version=$(cat "$(dirname "$0")/VERSION" 2>/dev/null || echo dev)
greet() { echo "app ${version}: ${1:-hello}"; }
login() {
  if [ -z "${1:-}" ]; then echo "user required" >&2; return 1; fi
  echo "welcome ${1}"
}
if [ "${BASH_SOURCE[0]}" = "$0" ]; then greet "$@"; fi
