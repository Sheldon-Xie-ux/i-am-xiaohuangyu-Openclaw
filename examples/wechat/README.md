# 微信公众号自动化示例

本目录包含使用 WeChatPy 库操作微信公众号的完整示例代码。

## 文件说明

| 文件 | 功能 |
|-----|------|
| `config.py` | 配置文件（需要填写你的AppID和AppSecret） |
| `basic_connection.py` | 基础连接测试 |
| `publish_article.py` | 发布图文文章 |

## 快速开始

### 1. 安装依赖

```bash
pip install wechatpy cryptography requests
```

### 2. 配置公众号信息

编辑 `config.py`，填入你的：
- AppID
- AppSecret
- 服务器IP

### 3. 运行示例

```bash
# 测试连接
python basic_connection.py

# 发布文章
python publish_article.py
```

## 注意事项

1. **IP白名单**：必须在公众号后台添加你的服务器IP
2. **API权限**：部分接口需要认证公众号才能使用
3. **编码问题**：中文内容需要使用 `ensure_ascii=False`

## 参考资料

- [WeChatPy文档](https://wechatpy.readthedocs.io/)
- [微信官方API文档](https://developers.weixin.qq.com/)
