# OpenClaw 多 Agent Token 优化模板

> 开箱即用，5分钟搭建多 Agent 架构，Token 消耗降低 60%

---

## 🐟 新增: 小黄鱼第九代生存方案 (2026-02-28)

**彻底解决上下文爆炸问题！**

| 指标 | 优化前 | 第九代方案 | 降幅 |
|-----|-------|-----------|-----|
| 单次token | 31万 | 8千 | **97%** |
| 响应时间 | 4分钟+ | 3-20秒 | **95%** |

**📦 方案内容:**
- ✅ 8K token 硬性上限配置
- ✅ 30分钟会话自动重置
- ✅ 会话守护脚本
- ✅ 记忆系统模板

**👉 [点击查看第九代完整方案](./ninth-gen/)**

---


> 开箱即用，5分钟搭建多 Agent 架构，Token 消耗降低 60%

## 📦 包含内容

```
openclaw-multi-agent-template/
├── README.md                 # 使用说明
├── config/
│   └── openclaw.json.template    # 主配置模板
├── agents/
│   ├── main/                 # 主 Agent 模板
│   ├── trader/              # 交易员 Agent 模板
│   └── assistant/           # 通用助手 Agent 模板
└── scripts/
    └── setup.sh             # 一键安装脚本
```

## 🚀 快速开始

### 步骤 1: 下载模板

```bash
git clone https://github.com/your-repo/openclaw-multi-agent-template.git
cd openclaw-multi-agent-template
```

### 步骤 2: 配置 API Keys

编辑 `config/openclaw.json.template`:

```json
{
  "models": {
    "providers": {
      "kimi-coding": {
        "baseUrl": "https://api.moonshot.cn/v1",
        "apiKey": "YOUR_KIMI_API_KEY"
      },
      "openai": {
        "baseUrl": "https://api.openai.com/v1",
        "apiKey": "YOUR_OPENAI_API_KEY"
      }
    }
  }
}
```

### 步骤 3: 修改群组 ID

找到你的飞书群组 ID，替换配置文件中的占位符：

```json
"bindings": [
  {
    "agentId": "trader",
    "match": {
      "channel": "feishu",
      "peer": {
        "kind": "group",
        "id": "YOUR_GROUP_ID"  // <-- 修改这里
      }
    }
  }
]
```

### 步骤 4: 运行安装脚本

```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 步骤 5: 重启 Gateway

```bash
openclaw gateway restart
```

## 📊 效果对比

| 指标 | 单 Agent | 多 Agent (本模板) | 提升 |
|------|----------|------------------|------|
| 日均 Token | ~500k | ~200k | **↓ 60%** |
| 响应速度 | 8-12s | 3-5s | **↑ 2x** |
| 任务并行 | 1 | 4 | **↑ 4x** |

## 🎯 核心优化点

### 1. 物理隔离
- 每个 Agent 独立 workspace
- 只加载相关记忆
- 避免上下文污染

### 2. 智能路由
- 飞书群组自动绑定
- 无需 @指定 Agent
- 减少引导 Token

### 3. 模型分层
- 简单任务: GPT-4o-mini (便宜 10x)
- 复杂任务: Kimi K2.5
- 按需选择

### 4. 上下文修剪
- 自动压缩旧消息
- 记忆 Flush 机制
- 文件化存储

## 📁 Agent 模板说明

### main (主 Agent)
- **职责**: 架构协调、任务派发
- **模型**: Kimi K2.5
- **触发**: 私聊

### trader (交易员)
- **职责**: 数据分析、报告生成
- **模型**: Kimi K2.5
- **触发**: 交易群

### assistant (通用助手)
- **职责**: 日常问答、内容创作
- **模型**: GPT-4o-mini
- **触发**: 助手群

## 🔧 自定义配置

### 添加新 Agent

1. 复制模板:
```bash
cp -r agents/assistant agents/myagent
```

2. 修改 `agents/myagent/SOUL.md` 定义个性

3. 添加到 `openclaw.json`:
```json
{
  "id": "myagent",
  "workspace": "/workspace-myagent",
  "model": "gpt-4o-mini"
}
```

4. 配置路由绑定

### 修改模型

编辑 Agent 的 `openclaw.json`:
```json
"model": {
  "primary": "gpt-4o-mini",
  "fallbacks": ["kimi-coding/k2p5"]
}
```

## 💡 最佳实践

1. **职责单一**: 每个 Agent 只做一类事
2. **模型选择**: 80% 任务用 GPT-4o-mini
3. **定期整理**: 每周清理 memory 文件
4. **监控状态**: 用 `/status` 检查上下文

## 🐛 常见问题

**Q: Agent 不响应群消息？**  
A: 检查 `bindings` 配置中的群组 ID 是否正确

**Q: 模型报错 401？**  
A: 检查 `auth-profiles.json` 中的 API Key

**Q: 上下文还是太长？**  
A: 调整 `contextPruning` 的 `softTrimRatio` 参数

**Q: 如何切换回单 Agent？**  
A: 备份后删除 `agents` 目录，恢复原始配置

## 📚 参考

- OpenClaw 官方文档: https://docs.openclaw.ai
- 本模板详细说明: https://github.com/your-repo/openclaw-multi-agent-template

## 📄 License

MIT License - 自由使用、修改、分享

---

**有问题？** 提交 Issue 或联系作者
