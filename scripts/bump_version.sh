#!/usr/bin/env bash
set -euo pipefail
NEW="${1:?pass new versionName like 1.2.3}"
PROP="gradle.properties"

# VERSION_NAME
if grep -q '^VERSION_NAME=' "$PROP"; then
  sed -i.bak "s/^VERSION_NAME=.*/VERSION_NAME=${NEW}/" "$PROP"
else
  echo "VERSION_NAME=${NEW}" >> "$PROP"
fi

# VERSION_CODE +1
if grep -q '^VERSION_CODE=' "$PROP"; then
  CUR=$(grep '^VERSION_CODE=' "$PROP" | cut -d= -f2)
  NEXT=$((CUR+1))
  sed -i.bak "s/^VERSION_CODE=.*/VERSION_CODE=${NEXT}/" "$PROP"
else
  echo "VERSION_CODE=1" >> "$PROP"
fi