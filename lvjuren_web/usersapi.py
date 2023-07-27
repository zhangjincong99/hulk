from model import *
from sqlalchemy import and_, or_, func
from flask import request, session, jsonify
import hashlib
import time


# 用户登录
def user_login(username, pwd):
    global islogin
    try:
        user = manageuser.query.with_entities(manageuser.uid).filter(and_(manageuser.username == username,
                                                                          manageuser.password == pwd)).first()
        if user:
            session['cx_user'] = username
            session['cx_token'] = f"{str(request.user_agent)}_{request.remote_addr}"
            return jsonify({"res": "ok"})
        else:
            return jsonify({"res": "用户名或密码错误"})
    except Exception as e:
        return jsonify({"res": "error"})


# 判断用户是否登录
def check_is_login():
    try:
        jk_user = session.get("cx_user")
        jk_token = session.get("cx_token")

        if jk_user is None or jk_token is None:
            return jsonify({"res": "no"})
        else:
            if jk_token != f"{str(request.user_agent)}_{request.remote_addr}":
                return jsonify({"res": "no"})
            else:
                user = manageuser.query.filter(manageuser.username == jk_user).with_entities(manageuser.uid).first()
                return jsonify({"res": "yes", "user": as_dict_part([user])})
    except Exception as e:
        return jsonify({"res": "no"})


def get_manageusers():
    try:
        users = manageuser.query.all()
        user_list = []
        for user in users:
            user_data = {
                "id": user.uid,
                "username": user.username,
                "password": user.password
            }
            user_list.append(user_data)
        return jsonify(user_list)
    except Exception as e:
        return jsonify(error=str(e))


def add_manageuser(username, password):
    try:
        # # 创建一个新的 manageuser 实例
        new_user = manageuser()
        new_user.username = username['value']
        new_user.password = password['value']

        # 将新用户添加到数据库
        db.session.add(new_user)
        db.session.commit()

        return jsonify({"message": "管理员添加成功"})
    except Exception as e:
        return jsonify({"message": "管理员添加失败"})


def exit_login():
    try:
        session.pop("cx_user")
        session.pop("cx_token")
        return jsonify({"res": "ok"})
    except Exception as e:
        return jsonify({"res": "error"})