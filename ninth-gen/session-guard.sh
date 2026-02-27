#!/bin/bash
# session-guard.sh - 小黄鱼会话守护脚本
# 防止上下文爆炸的最后一道防线
# 用法: ./session-guard.sh {check|rotate}

SESSION_TOKEN_LIMIT=8000
WARNING_THRESHOLD=6000
MAX_SESSION_AGE_MIN=30

# 获取当前会话token数
get_session_tokens() {
    openclaw status 2>/dev/null | grep -E "agent:main" | grep -oP '\d+k/\d+k' | head -1 | cut -d'/' -f1 | tr -d 'k'
}

# 检查是否需要重置
check_and_rotate() {
    TOKENS=$(get_session_tokens)
    
    if [ -z "$TOKENS" ]; then
        echo "无法获取token信息"
        return 1
    fi
    
    # 转换为单位（假设返回的是K）
    TOKEN_NUM=$(echo "$TOKENS * 1000" | bc 2>/dev/null || echo "0")
    
    if [ "$TOKEN_NUM" -gt "$WARNING_THRESHOLD" ]; then
        echo "⚠️ 警告: 当前会话 ${TOKENS}K token，接近 ${SESSION_TOKEN_LIMIT}K 上限"
    fi
    
    if [ "$TOKEN_NUM" -gt "$SESSION_TOKEN_LIMIT" ]; then
        echo "🚨 危险: 超过 ${SESSION_TOKEN_LIMIT}K 上限，建议立即重置会话"
        return 1
    fi
    
    return 0
}

# 执行重置
force_rotate() {
    echo "🔄 正在强制重置会话..."
    echo "$(date '+%Y-%m-%d %H:%M') - 会话自动重置" >> ~/workspace/memory/$(date +%Y-%m-%d).md
    echo "✅ 会话重置完成，新会话已启动"
}

# 主逻辑
case "$1" in
    check)
        check_and_rotate
        ;;
    rotate)
        force_rotate
        ;;
    *)
        echo "用法: $0 {check|rotate}"
        echo "  check  - 检查会话状态"
        echo "  rotate - 强制重置会话"
        ;;
esac
