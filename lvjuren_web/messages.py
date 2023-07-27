from model import *
from sqlalchemy import and_, or_, func
from flask import request, session, jsonify
import hashlib
import time


def inser_message(name, phone, content, created_tm):
    try:
        msg = message()
        msg.name = name
        msg.phone = phone
        msg.content = content
        msg.created_tm = created_tm
        db.session.add(msg)
        db.session.commit()
        return jsonify({"res": "success"})
    except Exception as e:
        db.session.rollback()  # 回滚会话，以确保不会保存错误的数据。
        return jsonify({"res": "error"})


def get_message(start, end):
    try:
        messages = message.query.order_by(message.id.asc()).slice(start, end + 1)  # 添加 "+ 1"，确保包含 end 在内
        total = message.query.count()

        result = []
        for msg in messages:
            data = {
                'id': msg.id,
                'name': msg.name,
                'phone': msg.phone,
                'content': msg.content,
                'created_tm': msg.created_tm.strftime('%Y-%m-%d %H:%M:%S')
            }
            result.append(data)

        return jsonify({
            'data': result,
            'total': total
        })
    except Exception as e:
        return jsonify({'error': str(e)})
