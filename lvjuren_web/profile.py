from model import *
from sqlalchemy import and_, or_, func
from flask import request, session, jsonify
import time


def get_profile(category):
    try:
        if category == '1':
            intro = company.query.with_entities(company.com_profile).first()
        elif category == '2':
            intro = company.query.with_entities(company.legal_profile).first()
        elif category == '3':
            intro = company.query.with_entities(company.com_culture).first()
        elif category == '4':
            intro = company.query.with_entities(company.honour).first()
        else:
            return jsonify({'data': '', 'message': 'Invalid category'})

        if intro:
            return jsonify({'data': intro[0], 'message': 'Success'})
        else:
            return jsonify({'data': '', 'message': 'No data found'})
    except Exception as e:
        return jsonify({'data': '', 'message': 'No data found'})


def save_profile(category, content):
    try:
        # 根据分类更新对应的数据库列
        if category == '1':
            intro = company.query.first()  # 假设获取第一条公司记录
            intro.com_profile = content
        elif category == '2':
            intro = company.query.first()  # 假设获取第一条公司记录
            intro.legal_profile = content
        elif category == '3':
            intro = company.query.first()  # 假设获取第一条公司记录
            intro.com_culture = content
        elif category == '4':
            intro = company.query.first()  # 假设获取第一条公司记录
            intro.honour = content
        else:
            return jsonify({'res': 'error', 'message': 'Invalid category'})

        # 保存修改到数据库
        db.session.commit()
        return jsonify({'res': 'ok', 'message': '文章更新成功'})
    except Exception as e:
        db.session.rollback()
        return jsonify({'res': 'error', 'message': '数据库保存出错'})


def up_profile_pic_api(file_obj):
    try:
        # 获取文件后缀名
        suffix = '.' + file_obj.filename.split('.')[-1]  # 获取文件后缀名
        # 获取当前文件路径
        # basedir = os.path.abspath(os.path.dirname(__file__))
        picname = str(int(time.time())) + suffix
        photo = r'D:\Desktop\p\hulk\pro\public\imgs\honour\\' + picname  # 拼接相对路径
        img_path = os.path.abspath(photo)
        file_obj.save(img_path)
        return jsonify({"picname": picname})
    except Exception as e:
        return jsonify({"picname": "error"})
