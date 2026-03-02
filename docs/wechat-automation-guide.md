# 微信公众号自动化运营指南

> 使用 Python + WeChatPy 实现公众号文章自动发布、管理和运营

---

## 📋 功能特性

- ✅ **自动连接公众号API**
- ✅ **图文消息自动发布**
- ✅ **素材管理（图片/文章）**
- ✅ **自定义菜单创建**
- ✅ **用户列表获取**
- ✅ **草稿箱管理**

---

## 🚀 快速开始

### 1. 环境准备

```bash
# 安装Python 3.8+
# 安装依赖库
pip install wechatpy cryptography requests Pillow
```

### 2. 配置公众号信息

编辑 `config.py`:

```python
APPID = "your-app-id"
APPSECRET = "your-app-secret"
```

**获取方式：**
1. 登录 https://mp.weixin.qq.com
2. 设置与开发 → 基本配置
3. 获取 AppID 和 AppSecret
4. 设置 IP 白名单（你的服务器IP）

### 3. 运行测试

```bash
python wechat_bot.py
```

---

## 📁 文件说明

| 文件 | 功能 |
|-----|------|
| `wechat_bot.py` | 基础连接测试 |
| `wechat_automation.py` | 完整自动化功能 |
| `publish_article.py` | 文章发布工具 |
| `config.py` | 配置文件 |

---

## 📝 使用教程

### 场景1：发布图文文章

```python
from wechatpy import WeChatClient

# 初始化
client = WeChatClient(APPID, APPSECRET)

# 上传封面图
with open("cover.jpg", "rb") as f:
    image_result = client.material.add("image", f)
thumb_media_id = image_result["media_id"]

# 创建文章
articles = [{
    "title": "文章标题",
    "author": "作者名",
    "content": "<h1>正文内容</h1><p>段落...</p>",
    "thumb_media_id": thumb_media_id,
    "need_open_comment": 1,
    "only_fans_can_comment": 0
}]

# 添加到草稿箱
access_token = client.access_token
url = f"https://api.weixin.qq.com/cgi-bin/draft/add?access_token={access_token}"
response = requests.post(url, json={"articles": articles})
```

### 场景2：获取用户列表

```python
users = client.user.get_followers()
print(f"关注用户数: {users['total']}")
```

### 场景3：创建自定义菜单

```python
menu = {
    "button": [
        {"type": "click", "name": "菜单1", "key": "KEY1"},
        {"type": "click", "name": "菜单2", "key": "KEY2"},
    ]
}
client.menu.create(menu)
```

---

## ⚠️ 常见问题

### 1. Error 40164 - IP不在白名单

**解决：** 登录公众号后台，添加当前服务器IP到白名单

### 2. Error 48001 - API未授权

**解决：** 需要申请相应的接口权限（如群发接口需要认证公众号）

### 3. 中文显示乱码

**解决：** 使用 `ensure_ascii=False` 参数

```python
payload = json.dumps(data, ensure_ascii=False).encode('utf-8')
```

### 4. 文章标题/摘要长度限制

| 字段 | 限制 |
|-----|------|
| 标题 | 64字节（约21个汉字）|
| 作者 | 8字节（约8个字母）|
| 摘要 | 120字节（约40个汉字）|

---

## 🔧 完整代码示例

见 `examples/` 目录：

- `basic_connection.py` - 基础连接测试
- `publish_article.py` - 发布文章完整示例
- `manage_menu.py` - 菜单管理
- `get_users.py` - 获取用户列表

---

## 📚 参考资料

- [WeChatPy 官方文档](https://wechatpy.readthedocs.io/)
- [微信公众平台API文档](https://developers.weixin.qq.com/doc/offiaccount/Getting_Started/Overview.html)

---

## 📝 作者

小黄鱼 - AI助手

公众号：爱吃小黄鱼AI
