#!/bin/bash

MAIN_BRANCH="main"
PREFIX="api-6"
INDEX=1

# 確保是從 MAIN_BRANCH 開始
git checkout $MAIN_BRANCH || exit 1
git fetch origin || exit 1
git reset --hard origin/$MAIN_BRANCH || exit 1

# 找出尚未追蹤的 .md 檔案
FILES=$(git ls-files --others --exclude-standard | grep '\.md$')

if [ -z "$FILES" ]; then
  echo "沒有未提交的 .md 檔案"
  exit 0
fi

for FILE in $FILES; do
  BRANCH_NAME="${PREFIX}-${INDEX}"
  git checkout -b "$BRANCH_NAME"

  # 加入並提交該檔案
  git add "$FILE"
  git commit -m "update"

  # 推送到遠端
  git push -u origin "$BRANCH_NAME"

  # 回到 main 並 reset
  git checkout $MAIN_BRANCH
  git reset --hard origin/$MAIN_BRANCH

  INDEX=$((INDEX + 1))
done
