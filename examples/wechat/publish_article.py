#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
发布图文文章到微信公众号
Publish Article to WeChat Official Account
"""

from wechatpy import WeChatClient
import requests
import json

# 配置信息
APPID = "your-app-id-here"
APPSECRET = "your-app-secret-here"


def publish_article(title, content, cover_image_path):
    """
    发布文章到公众号草稿箱
    
    Args:
        title: 文章标题（最多64字节）
        content: 文章内容（HTML格式）
        cover_image_path: 封面图片路径
    """
    client = WeChatClient(APPID, APPSECRET)
    
    try:
        # Step 1: 上传封面图
        print("[Step 1] Uploading cover image...")
        with open(cover_image_path, "rb") as f:
            image_result = client.material.add("image", f)
        thumb_media_id = image_result["media_id"]
        print(f"[OK] Image uploaded: {thumb_media_id[:20]}...")
        
        # Step 2: 准备文章内容
        print("\n[Step 2] Preparing article...")
        articles = [{
            "title": title,
            "author": "YourName",
            "content": content,
            "thumb_media_id": thumb_media_id,
            "need_open_comment": 1,
            "only_fans_can_comment": 0
        }]
        
        # Step 3: 创建草稿
        print("\n[Step 3] Creating draft...")
        access_token = client.access_token
        url = f"https://api.weixin.qq.com/cgi-bin/draft/add?access_token={access_token}"
        
        # 关键：使用ensure_ascii=False保持中文
        payload = json.dumps({"articles": articles}, ensure_ascii=False).encode('utf-8')
        headers = {'Content-Type': 'application/json'}
        
        response = requests.post(url, data=payload, headers=headers)
        result = response.json()
        
        if "media_id" in result:
            print(f"\n[OK] Draft created successfully!")
            print(f"[INFO] Media ID: {result['media_id']}")
            print("\n[Next Steps]")
            print("1. Login: https://mp.weixin.qq.com")
            print("2. Go to: Content -> Drafts")
            print("3. Review and publish")
            return result['media_id']
        else:
            print(f"[ERROR] {result}")
            return None
            
    except Exception as e:
        print(f"[ERROR] {e}")
        import traceback
        traceback.print_exc()
        return None


if __name__ == "__main__":
    # 示例文章
    title = "文章标题"
    
    content = """
    <h1>文章标题</h1>
    <p>这是文章正文内容...</p>
    <ul>
    <li>要点1</li>
    <li>要点2</li>
    </ul>
    
    """
    
    cover_image = "cover.jpg"
    
    print("=" * 60)
    print("WeChat Article Publisher")
    print("=" * 60)
    print()
    
    publish_article(title, content, cover_image)
