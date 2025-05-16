#!/bin/bash

INPUT_FILE="open_aws_console_services.txt"
TARGET_SCRIPT="open_aws_console.sh"

# 新しい data 配列を1行に整形
NEW_DATA=$(awk -F, '{
  gsub(/^[ \t]+|[ \t]+$/, "", $1);
  gsub(/^[ \t]+|[ \t]+$/, "", $2);
  printf "{\"title\": \"%s\", \"value\": \"%s\"},", $1, $2;
}' "$INPUT_FILE" | sed 's/,$//')  # 最後のカンマ削除

# @raycast.argument2 の行を置換（macOS対応の方法）
# 1. 一時ファイル作成
TMP_FILE=$(mktemp)

awk -v newdata="$NEW_DATA" '
{
  if ($0 ~ /@raycast.argument2/) {
    print $0;
    getline;
    sub(/\[.*\]/, "[" newdata "]");
  }
  print $0;
}' "$TARGET_SCRIPT" > "$TMP_FILE"

# 元ファイルを上書き
mv "$TMP_FILE" "$TARGET_SCRIPT"

echo "✅ Updated @raycast.argument2 in $TARGET_SCRIPT"
