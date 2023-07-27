from model import *
from sqlalchemy import and_, or_, func
from flask import request, session, jsonify
import time
import re


def save_news(title, content, create_time, image_url):
    try:
        new_news = news()
        new_news.title = title
        new_news.content = content
        new_news.time = create_time
        new_news.image_url = image_url
        db.session.add(new_news)
        db.session.commit()

        return jsonify({"res": "success"})
    except Exception as e:
        return jsonify({"res": "error", "message": str(e)})


def up_article_pic_api(file_obj):
    try:
        # 获取文件后缀名
        suffix = '.' + file_obj.filename.split('.')[-1]  # 获取文件后缀名
        # 获取当前文件路径
        # basedir = os.path.abspath(os.path.dirname(__file__))
        picname = str(int(time.time())) + suffix
        photo = r'D:\Desktop\p\hulk\pro\public\imgs\news\\' + picname  # 拼接相对路径
        img_path = os.path.abspath(photo)
        file_obj.save(img_path)
        return jsonify({"picname": picname})
    except Exception as e:
        return jsonify({"picname": "error"})


def postarticle_api(title, author, con, created_tm):
    try:
        new = news()
        new.title = title
        new.author = author
        new.content = con
        new.time = created_tm
        # 匹配图片地址，re.I忽略大小写
        src_arr = re.findall(r"<img\s*src=\"(.*?)\"\s*?>", con, re.I)
        if len(src_arr) > 0:
            new.image_url = src_arr[0].split("/")[-1]
        else:
            new.image_url = ''
        db.session.add(new)
        db.session.commit()
        return jsonify({"res": "ok"})
    except Exception as e:
        return jsonify({"res": "error"})


def get_new():
    try:
        news_items = news.query.order_by(news.time.desc()).all()
        news_list = []
        for item in news_items:
            news_item = {
                'id': item.nid,
                'title': item.title,
                'author': str(item.author),
                'content': item.content,
                'time': str(item.time),
                'image_url': item.image_url
            }
            news_list.append(news_item)
        return jsonify(news_list)
    except Exception as e:
        return jsonify({"res": "获取失败"})


def get_my_article_api(aid):
    try:
        article = news.query.filter(news.nid == aid).first()
        if article:
            return jsonify({"res": as_dict_all([article])})
        else:
            return jsonify({"res": "no"})
    except Exception as e:
        return jsonify({"res": "no"})


def up_article_api(aid, title, author, time, con):
    try:
        new = news.query.filter(news.nid == aid).first()
        if new:
            new.title = title
            new.author = author
            new.time = time
            new.content = con
            db.session.commit()
            return jsonify({"res": "ok"})
    except Exception as e:
        return jsonify({"res": "error"})
