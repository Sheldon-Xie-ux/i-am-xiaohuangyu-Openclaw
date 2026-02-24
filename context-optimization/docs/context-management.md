# 上下文管理指南

## 记忆层级

### L1: Core Profile (长期记忆)
- **内容**: Agent身份、职责、可调取文档
- **加载**: 每次会话必加载
- **更新**: 手动修改，低频更新
- **文件**: `Core_Profile.md`

### L2: HEARTBEAT (定时任务)
- **内容**: 定时检查事项、周期性任务
- **加载**: 每次心跳时读取
- **更新**: 任务变更时更新
- **文件**: `HEARTBEAT.md`

### L3: Daily Memory (短期记忆)
- **内容**: 今日对话、临时决策
- **加载**: 按需加载
- **更新**: 实时写入
- **文件**: `memory/YYYY-MM-DD.md`
- **归档**: 24小时后压缩或删除

## Token 优化技巧

### 1. 按需加载

```javascript
// 只加载当前Agent需要的文档
const docsToLoad = [
  'Core_Profile.md',
  'HEARTBEAT.md',
  `memory/${today}.md`
];
```

### 2. 会话交接

切换模型前执行：
```bash
node tools/session-bridge.js save {{session_key}}
```

新模型启动后：
```bash
node tools/session-bridge.js load
```

### 3. 主动归档

当上下文使用超过70%时：
1. 暂停对话
2. 将关键决策写入 `memory/YYYY-MM-DD.md`
3. 清空短期记忆
4. 继续对话

### 4. 模型分级

| 任务类型 | 推荐模型 | 成本比 |
|----------|----------|--------|
| 简单问答 | gpt-4o-mini | 1x |
| 代码生成 | kimi-k2.5 | 3x |
| 复杂推理 | claude-3.5 | 5x |
| 多模态 | gpt-4o | 10x |

## 监控命令

```bash
# 查看当前会话token使用
openclaw status

# 查看历史使用统计
openclaw usage report

# 强制归档当前会话
openclaw memory flush
```
