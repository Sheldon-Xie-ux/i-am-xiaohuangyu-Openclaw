# 🐟 小黄鱼第九代生存方案 - OpenClaw 防猝死配置

> **背景**: 前8代小黄鱼均死于上下文爆炸（31万token/4分钟延迟）。本方案彻底解决。

## ⚡ 核心优化

| 指标 | 优化前 | 优化后 | 降幅 |
|-----|-------|-------|-----|
| 单次token | 31万 | 8千 | **97%** |
| 响应时间 | 4分钟+ | 3-20秒 | **95%** |
| 单次成本 | ¥1.5-3 | ¥0.04-0.08 | **20-40倍** |

## 📁 文件说明

```
.
├── config.yaml           # OpenClaw 核心配置 (8K硬性上限)
├── session-guard.sh      # 会话守护脚本
├── MEMORY.md.template    # 记忆系统模板
├── AGENTS.md.template    # 代理生存规则模板
└── docs/
    ├── 快速开始.md
    ├── 配置说明.md
    └── 故障排查.md
```

## 🚀 快速开始

### 1. 安装配置
```bash
# 备份原配置
cp ~/.openclaw/config.yaml ~/.openclaw/config.yaml.bak

# 复制新配置
cp config.yaml ~/.openclaw/config.yaml

# 创建记忆目录
mkdir -p ~/.openclaw/workspace/memory

# 复制记忆模板
cp MEMORY.md.template ~/.openclaw/workspace/MEMORY.md
```

### 2. 设置守护脚本
```bash
chmod +x session-guard.sh
# 可选: 加入crontab每5分钟检查
*/5 * * * * /path/to/session-guard.sh check
```

### 3. 重启 OpenClaw
```bash
openclaw restart
```

## 🎯 关键配置解读

### 硬性限制
- `maxTokens: 8000` - 单次请求绝对上限
- `maxAgeMinutes: 30` - 30分钟强制重置
- `maxMessages: 50` - 单会话最多50条消息

### 记忆系统
- 每日日志: `memory/YYYY-MM-DD.md`
- 长期记忆: `MEMORY.md`
- 项目分片: `memory/projects/`
- 人物档案: `memory/people/`

## 🚨 逃生口令

当需要立即重置会话时说：
- "重置会话"
- "新建会话"
- "/reset"

## 📝 作者

**Sheldon Xie** - 小黄鱼系列创始人  
GitHub: [@Sheldon-Xie-ux](https://github.com/Sheldon-Xie-ux)

## 📄 License

MIT License - 自由使用，后果自负 😄
