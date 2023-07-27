from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import class_mapper
from flask_cors import CORS
from flask import Flask, jsonify
from datetime import timedelta, timezone, datetime
import os
from flask_session import Session

app = Flask(__name__)

app.config['SECRET_KEY'] = os.urandom(24)  # 随即产生24个字节的字符串

CORS(app, supports_credentials=True)

# 设置连接数据库的URL，以下连mysql
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://czn:password@127.0.0.1:3306/test'

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


# 对象转字典，用于select * 的情况
def as_dict_all(objs):
    return [dict((col.name, getattr(obj, col.name)) for col in class_mapper(obj.__class__).mapped_table.c) for obj in
            objs]


# 对象转字典，用于查询某些字段的情况
def as_dict_part(objs):
    for obj in objs:
        o = obj.keys()

    return [dict(zip(obj.keys(), obj)) for obj in objs]
