#!/bin/bash

set -e

INPUT_FILE="services.txt"
TARGET_SCRIPT="../open_aws_console.sh"

# 新しい data 配列を1行に整形
NEW_DATA=$(awk -F, '{
  gsub(/^[ \t]+|[ \t]+$/, "", $1);
  gsub(/^[ \t]+|[ \t]+$/, "", $2);
  printf "{\"title\": \"%s\", \"value\": \"%s\"},", $1, $2;
}' "${INPUT_FILE}" | sed 's/,$//')  # 最後のカンマ削除

# @raycast.argument2 の行を置換（macOS対応の方法）
TMP_FILE=$(mktemp)

# GNU sed
cat ../"${TARGET_SCRIPT}"  >| "${TMP_FILE}"
gsed -i -E "1b; /argument2/ s|(\[).*?|\1${NEW_DATA}\]}|" "${TMP_FILE}"

mv "${TMP_FILE}" "${TARGET_SCRIPT}"

echo "✅ Updated @raycast.argument2 in ${TARGET_SCRIPT}"
