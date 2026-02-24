# OpenClaw 上下文优化配置方案

> 多Agent场景下的Token优化实践

## 📁 目录结构

```
openclaw-workspace/
├── agents/                     # Agent配置
│   ├── main/                   # 主控Agent
│   │   ├── Core_Profile.md     # 核心身份定义
│   │   ├── HEARTBEAT.md        # 定时任务
│   │   └── skills/             # 专属技能
│   ├── trader/                 # 交易Agent
│   │   ├── Core_Profile.md
│   │   └── HEARTBEAT.md
│   ├── researcher/             # 研究Agent
│   │   ├── Core_Profile.md
│   │   └── HEARTBEAT.md
│   └── xiaohongshu/            # 小红书Agent
│       ├── Core_Profile.md
│       └── HEARTBEAT.md
├── memory/                     # 记忆管理
│   ├── 2026-02-24.md           # 今日记录
│   ├── session-bridge-latest.md # 会话交接
│   └── token-optimization-plan.md # 优化方案
├── docs/                       # 文档
│   ├── architecture.md         # 架构设计
│   └── context-management.md   # 上下文管理指南
└── templates/                  # 模板文件
    ├── agent-bootstrap.md      # Agent初始化模板
    └── memory-flush.md         # 记忆归档模板
```

## 🧠 核心原理

### 1. 分层记忆架构

```
┌─────────────────────────────────────┐
│  Core Profile (长期记忆)             │
│  - 我是谁                            │
│  - 我做什么                          │
│  - 可调取哪些文档                     │
└─────────────────────────────────────┘
           ↓
┌─────────────────────────────────────┐
│  HEARTBEAT (定时任务)                │
│  - 每小时检查                        │
│  - 每日报告                          │
│  - 异常处理                          │
└─────────────────────────────────────┘
           ↓
┌─────────────────────────────────────┐
│  Daily Memory (短期记忆)             │
│  - 今日对话                          │
│  - 临时决策                          │
│  - 24h后归档                         │
└─────────────────────────────────────┘
```

### 2. Token 优化策略

| 策略 | 效果 | 实现方式 |
|------|------|----------|
| 按需加载 | 减少30% | Agent只加载自己的Core Profile |
| 会话交接 | 减少20% | 切换模型时保存上下文摘要 |
| 主动归档 | 减少25% | 关键决策立即写入文件 |
| 模型分级 | 节省50% | 简单任务用轻量模型 |

## 🚀 快速开始

### 1. 克隆配置

```bash
git clone https://github.com/xieyao/openclaw-context-optimization.git
```

### 2. 复制到工作目录

```bash
cp -r openclaw-context-optimization/* ~/.openclaw/workspace/
```

### 3. 修改配置

编辑 `agents/*/Core_Profile.md`，填入你的：
- Agent名称
- 职责描述
- 可调取的文档路径

### 4. 启动Agent

```bash
openclaw start --agent main
```

## 📊 效果实测

部署4个Agent前后对比：

| 指标 | 优化前 | 优化后 | 节省 |
|------|--------|--------|------|
| 日均Token | ~200K | ~80K | 60% |
| 响应时间 | 3-5s | 1-2s | 提升 |
| 上下文丢失 | 频繁 | 极少 | 改善 |
| 月费用 | ~$150 | ~$50 | 67% |

## 📖 详细文档

- [架构设计](docs/architecture.md)
- [上下文管理指南](docs/context-management.md)
- [Agent配置模板](templates/agent-bootstrap.md)

## 🤝 贡献

欢迎提交PR，分享你的优化方案。

## 📄 License

MIT
