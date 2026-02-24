# HEARTBEAT - 主控Agent

**频率**: 每4小时  
**模型**: kimi-coding/k2.5

---

## 检查清单

### 项目进度
- [ ] 检查各Agent任务状态
- [ ] 确认是否有卡住的任务
- [ ] 汇总今日进展

### 系统健康
- [ ] 检查token使用情况
- [ ] 确认各Agent在线状态
- [ ] 查看错误日志

### 记忆归档
- [ ] 检查昨日memory是否需要整理
- [ ] 更新MEMORY.md长期记忆

## 汇报模板

```
## 系统状态报告 - {{time}}

### 各Agent状态
- trader: {{status}}
- researcher: {{status}}
- xiaohongshu: {{status}}

### Token使用
- 今日: {{tokens}} 
- 预估月费: ${{cost}}

### 待处理事项
{{todos}}

### 建议
{{suggestions}}
```
