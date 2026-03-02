#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
微信公众号基础连接测试
WeChat Official Account - Basic Connection Test
"""

from wechatpy import WeChatClient

# 配置信息
APPID = "your-app-id-here"
APPSECRET = "your-app-secret-here"


def test_connection():
    """测试公众号连接"""
    try:
        client = WeChatClient(APPID, APPSECRET)
        
        # 获取access_token
        token = client.fetch_access_token()
        print(f"[OK] Connection successful!")
        print(f"[INFO] Access Token: {token[:20]}...")
        return True
        
    except Exception as e:
        print(f"[ERROR] Connection failed: {e}")
        print("\n[Tips] Please check:")
        print("  1. AppID and AppSecret are correct")
        print("  2. IP whitelist includes your server IP")
        return False


if __name__ == "__main__":
    print("=" * 60)
    print("WeChat Official Account - Connection Test")
    print("=" * 60)
    print()
    
    if test_connection():
        print("\n[OK] Ready for automation!")
    else:
        print("\n[ERROR] Please fix configuration issues")
