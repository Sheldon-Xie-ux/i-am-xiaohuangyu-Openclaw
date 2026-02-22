#!/bin/bash
# OpenClaw 多 Agent 模板安装脚本

set -e

echo "🚀 OpenClaw Multi-Agent Template Setup"
echo "======================================="

# 检查 OpenClaw 是否安装
if ! command -v openclaw &> /dev/null; then
    echo "❌ OpenClaw 未安装，请先安装: https://docs.openclaw.ai"
    exit 1
fi

# 获取 OpenClaw 配置目录
OPENCLAW_DIR="${HOME}/.openclaw"
if [ ! -d "$OPENCLAW_DIR" ]; then
    echo "❌ OpenClaw 配置目录不存在"
    exit 1
fi

echo "✅ OpenClaw 已安装"

# 备份现有配置
echo "📦 备份现有配置..."
BACKUP_DIR="${OPENCLAW_DIR}/backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp -r "${OPENCLAW_DIR}/openclaw.json" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "${OPENCLAW_DIR}/agents" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "${OPENCLAW_DIR}/workspace" "$BACKUP_DIR/" 2>/dev/null || true
echo "✅ 配置已备份到: $BACKUP_DIR"

# 检查配置文件
echo "🔧 检查配置..."
if [ ! -f "config/openclaw.json" ]; then
    if [ -f "config/openclaw.json.template" ]; then
        echo "⚠️  未找到 openclaw.json，请复制模板并修改:"
        echo "   cp config/openclaw.json.template config/openclaw.json"
        echo "   然后编辑 config/openclaw.json 填写你的 API Keys"
        exit 1
    fi
fi

# 复制 Agent 模板
echo "📂 安装 Agent 模板..."
for agent in agents/*/; do
    agent_name=$(basename "$agent")
    target_dir="${OPENCLAW_DIR}/agents/${agent_name}/agent"
    
    mkdir -p "$target_dir"
    cp -r "${agent}"* "$target_dir/" 2>/dev/null || true
    
    # 创建工作区
    workspace_dir="${OPENCLAW_DIR}/workspace-${agent_name}"
    mkdir -p "$workspace_dir/memory" "$workspace_dir/data"
    
    echo "   ✅ 安装 $agent_name"
done

# 复制配置文件
if [ -f "config/openclaw.json" ]; then
    echo "📄 复制配置文件..."
    cp "config/openclaw.json" "${OPENCLAW_DIR}/openclaw.json"
    echo "✅ 配置文件已更新"
fi

echo ""
echo "🎉 安装完成!"
echo "============="
echo ""
echo "下一步:"
echo "1. 如果还没修改配置，请编辑: ${OPENCLAW_DIR}/openclaw.json"
echo "2. 填写你的 API Keys 和群组 ID"
echo "3. 运行: openclaw gateway restart"
echo ""
echo "📖 详细说明见: README.md"
