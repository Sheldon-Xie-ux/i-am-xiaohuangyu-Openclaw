#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
微信公众号自动化配置
WeChat Official Account Configuration
"""

# ============================
# 公众号配置（必填）
# ============================

# 从 https://mp.weixin.qq.com 获取
APPID = "your-app-id-here"
APPSECRET = "your-app-secret-here"

# IP白名单（你的服务器IP）
# 在公众号后台：设置与开发 -> 基本配置 -> IP白名单
SERVER_IP = "your-server-ip-here"


# ============================
# 文章默认配置
# ============================

DEFAULT_AUTHOR = "YourName"
DEFAULT_COVER = "assets/default_cover.jpg"


# ============================
# 内容模板
# ============================

TEMPLATES = {
    "tech": {
        "title": "技术分享 - {topic}",
        "style": "technical"
    },
    "diary": {
        "title": "日记 - Day {day}",
        "style": "personal"
    },
    "tutorial": {
        "title": "教程 - {topic}",
        "style": "educational"
    }
}
