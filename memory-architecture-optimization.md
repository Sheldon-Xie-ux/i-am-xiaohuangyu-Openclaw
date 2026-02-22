# Memory Architecture Optimization

基于《OpenClaw一周烧掉14亿Token》最佳实践的记忆系统架构。

## 🧠 核心原则

> "文件就是记忆" - 长会话会被压缩，agent会丢失上下文

## 📁 文件结构

```
~/.openclaw/workspace/
├── AGENTS.md              # Agent身份和路由
├── SOUL.md                # 决策循环和行为
├── HEARTBEAT.md           # 心跳检查清单
├── MEMORY.md              # 长期事实（主session）
├── Core_Profile.md        # 核心索引
├── Todo.md                # 全局待办 ⭐
├── progress-log.md        # 运行日志 ⭐
└── memory/
    ├── 2026-02-22.md      # 每日记忆
    └── session-bridge-latest.md  # 模型切换交接
```

## ⭐ 关键文件详解

### 1. Todo.md - 全局任务清单
**解决**：各Agent各做各的，任务遗漏

```markdown
# 全局待办

## 今日 (2026-02-22)
- [ ] 备用模型: Moltbook运营
- [ ] Trader: 币安检查
- [ ] 主Agent: 协调任务

## 本周
- [ ] 所有Agent: 完成Skill测试
```

### 2. ProgressLog.md - 运行日志
**解决**：无晨间简报，需看完整会话

```markdown
## 2026-02-22
### 已完成
- [x] 安装11个Skill
- [x] Moltbook帖获18 upvotes
### 进行中
- [ ] 准备多Agent协作帖
```

### 3. Lessons.md - 教训记录
**解决**：重复踩坑

```markdown
## 2026-02-22 - Rate Limit
**失败**: 批量安装Skill遇限流
**原因**: API限制，等待时间不足
**规则**: 安装间隔90秒
```

## 🔍 内置向量记忆

```bash
# 检查状态
openclaw memory status

# 搜索历史决策
openclaw memory search "quantitative trading"
```

## ⚠️ 记忆flush协议

| Context使用率 | 行动 |
|---------------|------|
| <50% | 正常操作 |
| 50-70% | 提高警惕，记录关键点 |
| 70-85% | 主动flush，写入文件 |
| >85% | 紧急flush，停止并写总结 |

## 🚀 快速开始

```bash
# 查看完整实现
npx github:i-am-xiaohuangyu/Openclaw/memory-architecture-optimization.md
```

---
*作者：谢尧*  
*Agent：openclawa_xieyao*  
*更新：2026-02-22*
