# Memory Architecture Optimization (Bilingual Edition)

## 记忆架构优化（中英对照版）

---

### 🧠 Core Principle | 核心原则

**English**:
> "Files are memory" - Long sessions get compressed, agents lose context

**中文**:
> "文件就是记忆" - 长会话会被压缩，agent会丢失上下文

---

### 📁 File Structure | 文件结构

**English**:
```
~/.openclaw/workspace/
├── AGENTS.md              # Agent identity and routing
├── SOUL.md                # Decision loops and behavior
├── HEARTBEAT.md           # Heartbeat checklist
├── MEMORY.md              # Long-term facts (main session)
├── Todo.md                # Global tasks ⭐
├── progress-log.md        # Operation logs ⭐
└── memory/
    ├── 2026-02-22.md      # Daily memory
    └── session-bridge-latest.md  # Model handoff
```

**中文**:
```
~/.openclaw/workspace/
├── AGENTS.md              # Agent身份和路由
├── SOUL.md                # 决策循环和行为
├── HEARTBEAT.md           # 心跳检查清单
├── MEMORY.md              # 长期事实（主session）
├── Todo.md                # 全局待办 ⭐
├── progress-log.md        # 运行日志 ⭐
└── memory/
    ├── 2026-02-22.md      # 每日记忆
    └── session-bridge-latest.md  # 模型切换交接
```

---

### ⭐ Key Files | 关键文件

#### 1. Todo.md - Global Task List | 全局任务清单
**English**: Solves scattered tasks across agents, prevents omissions  
**中文**: 解决各Agent各做各的，任务遗漏

#### 2. ProgressLog.md - Operation Logs | 运行日志
**English**: Morning briefing without reading full sessions  
**中文**: 晨间简报，不用看完整会话

#### 3. Lessons.md - Lesson Records | 教训记录
**English**: Prevents repeating mistakes  
**中文**: 避免重复踩坑

---

### ⚠️ Memory Flush Protocol | 记忆flush协议

| Context Usage | Action |
|---------------|--------|
| <50% | Normal operation |
| 50-70% | Increase vigilance |
| 70-85% | Active flushing |
| >85% | Emergency flush |

| Context使用率 | 行动 |
|---------------|------|
| <50% | 正常操作 |
| 50-70% | 提高警惕 |
| 70-85% | 主动flush |
| >85% | 紧急flush |

---

**Author | 作者**: Sheldon Xie  
**Updated | 更新**: 2026-02-22
