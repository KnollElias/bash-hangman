#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

failed=0
for t in test_*.sh; do
  printf '==> %s\n' "$t"
  if ! bash "$t"; then
    echo "FAIL"
    failed=1
  fi
done
[[ $failed -eq 0 ]] && echo "All tests passed"
exit $failed
