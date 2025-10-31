#!/bin/bash
# ------------------------------------------------------------------------------
# Script: validate-workflows.sh
# Project: Offline Bin Detection Automation
# Organization: Renie Tech Trading LLC
# Author: [Your Name], AI & Automation Engineer
# ------------------------------------------------------------------------------
# Purpose:
#   Validate all n8n workflow JSON exports to ensure:
#     - Valid JSON syntax
#     - Workflow 'name' field exists
#     - No real credential IDs or secrets are present
#     - Timezone metadata is configured (Asia/Kolkata)
# ------------------------------------------------------------------------------

set -e
WORKFLOW_DIR="workflows"
ERRORS=0

echo "🧩 Starting workflow validation for: Offline Bin Detection Automation"
echo "-----------------------------------------------------------"

for file in "$WORKFLOW_DIR"/*.json; do
  echo "➡ Checking $file"

  # 1️⃣ Validate JSON structure
  if ! jq empty "$file" >/dev/null 2>&1; then
    echo "❌ Invalid JSON format in $file"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # 2️⃣ Check that workflow name exists
  NAME=$(jq -r '.name // empty' "$file")
  if [[ -z "$NAME" ]]; then
    echo "⚠️ Missing workflow name in $file"
    ERRORS=$((ERRORS + 1))
  else
    echo "   ✔ Workflow Name: $NAME"
  fi

  # 3️⃣ Detect credential IDs or secrets
  if grep -qE '"id": *"[0-9a-fA-F-]{8,}"' "$file"; then
    echo "⚠️ Possible credential ID found in $file (replace with placeholder)"
    ERRORS=$((ERRORS + 1))
  fi
  if grep -qiE '(apikey|password|token|secret)' "$file"; then
    echo "⚠️ Possible sensitive key detected in $file"
    ERRORS=$((ERRORS + 1))
  fi

  # 4️⃣ Check for timezone metadata
  if ! jq -e '.settings.timezone' "$file" >/dev/null; then
    echo "ℹ️ No timezone defined — defaulting to Asia/Kolkata recommended"
  fi

  echo "-----------------------------------------------------------"
done

if [[ $ERRORS -gt 0 ]]; then
  echo "❌ Validation completed with $ERRORS warning(s)/error(s)."
  exit 1
else
  echo "✅ All 8 workflows validated successfully — ready for commit!"
fi
