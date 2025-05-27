#!/usr/bin/env bash
set -euo pipefail # quits the script in case of failure, pulls an error in case of not setted variables,
# makes the entire pipeline fail in case of failure.

cd "$(dirname "$0")"

failed=0
for t in test_*.sh; do
  printf '==> %s\n' "$t"
  if ! bash "$t"; then #checks if the execution failed. 
    echo "FAIL"
    failed=1
  fi
done
[[ $failed -eq 0 ]] && echo "All tests passed"
exit $failed
