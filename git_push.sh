#!/bin/bash

# 获取当前日期时间作为提交信息
commit_msg=$(date "+%Y-%m-%d %H:%M:%S")

echo "🔍 正在检查远程仓库状态..."

# 获取远程更新
git fetch origin

# 对比本地和远程的 main 分支
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse origin/main)
BASE=$(git merge-base @ origin/main)

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "✅ 本地与远程仓库一致，开始提交..."
elif [ "$LOCAL" = "$BASE" ]; then
    echo "⚠️ 本地落后于远程仓库，请先执行：git pull"
    exit 1
elif [ "$REMOTE" = "$BASE" ]; then
    echo "📤 本地领先于远程，可推送更新。"
else
    echo "❌ 本地与远程分支已经分叉，请手动处理冲突。"
    exit 1
fi

# ==== Hexo 部署部分 ====
echo "🛠️ 正在生成 Hexo 静态文件..."
hexo clean
hexo g

echo "🚀 正在部署 Hexo 到远程仓库..."
hexo d

echo "🎉 Hexo 部署完成！"

# ==== Git 提交部分 ====
# 添加更改并提交
echo "🔄 正在添加更改..."
git add .

echo "📝 正在提交：$commit_msg"
git commit -m "$commit_msg"

# 推送到远程
echo "🚀 正在推送到 main 分支..."
git push origin main

echo "✅ 提交完成！"
