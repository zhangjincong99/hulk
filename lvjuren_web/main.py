import db

from db import *
import requests.auth

from messages import *
from news import *
from usersapi import *
from model import *
from profile import *
import time


@app.route("/getmessage", methods=["GET", "POST"])
def getmessage():
    name = request.form.get("name")
    phone = request.form.get("phone")
    content = request.form.get("message")
    current_time = datetime.now()
    created_tm = current_time.strftime("%Y-%m-%d %H:%M:%S")
    return inser_message(name, phone, content, created_tm)


@app.route("/userlogin", methods=["GET", "POST"])
def userlogin():
    username = request.form.get('user')
    pwd = request.form.get('pwd')
    return user_login(username, pwd)


@app.route("/exitlogin", methods=["GET", "POST"])
def exitlogin():
    return exit_login()


@app.route('/mgemessages', methods=['GET'])
def get_messages():
    start = int(request.args.get('start'))
    end = int(request.args.get('end'))
    return get_message(start, end)


@app.route("/mgemessages/<int:message_id>", methods=["DELETE"])
def delete_message(message_id):
    try:
        message_to_delete = message.query.get(message_id)
        if message_to_delete:
            db.session.delete(message_to_delete)
            db.session.commit()
            return {"message": "删除成功"}
        else:
            return {"error": "留言不存在"}
    except Exception as e:
        return {"error": "删除留言出错"}


@app.route("/islogin", methods=["GET", "POST"])
def islogin():
    return check_is_login()


@app.route("/manageusers/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    try:
        user = manageuser.query.get(user_id)
        if user:
            db.session.delete(user)
            db.session.commit()
            return jsonify({"message": "User deleted successfully"})
        else:
            return jsonify({"message": "User not found"})
    except Exception as e:
        return jsonify({"message": "Error deleting user"}), 500


@app.route("/manageusers", methods=["GET"])
def getmanageusers():
    return get_manageusers()


@app.route("/manageusers/<int:user_id>", methods=["PUT"])
def update_password(user_id):
    try:
        user = manageuser.query.get(user_id)
        if user:
            new_password = request.json.get("password")
            user.password = new_password['value']
            db.session.commit()
            return jsonify({"message": "Password updated successfully"})
        else:
            return jsonify({"message": "User not found"})
    except Exception as e:
        return jsonify({"message": "Error occurred while updating password"}), 500


@app.route("/addmanageusers", methods=["POST"])
def add_manage_user():
    username = request.json.get("username")
    password = request.json.get("password")
    return add_manageuser(username, password)


@app.route("/postarticle", methods=["GET", "POST"])
def postarticle():
    title = request.form.get("title")
    author = request.form.get("author")
    con = request.form.get("con")
    created_tm = request.form.get("time")
    return postarticle_api(title, author, con, created_tm)


@app.route("/uparticlepic", methods=["GET", "POST"])
def uparticlepic():
    # 获取图片对象
    file_obj = request.files.get("file")
    return up_article_pic_api(file_obj)


@app.route('/getnews', methods=['GET'])
def get_news():
    return get_new()


@app.route('/getmyarticles', methods=['GET'])
def get_my_articles():
    try:
        articles = news.query.all()
        article_list = []
        for article in articles:
            article_data = {
                'aid': article.nid,
                'title': article.title,
                'time': article.time,
                'author': article.author
            }
            article_list.append(article_data)

        return jsonify(res=article_list)
    except Exception as e:
        return jsonify(res='error')


@app.route('/delmyarticle', methods=['GET'])
def delete_my_article():
    aid = request.args.get('aid')
    try:
        article = news.query.get(aid)
        if article:
            db.session.delete(article)
            db.session.commit()
            return jsonify(res='ok')
        else:
            return jsonify(res='error')
    except Exception as e:
        return jsonify(res='error')


@app.route("/getmyarticle", methods=["GET", "POST"])
def getmyarticle():
    aid = request.args.get("aid")
    return get_my_article_api(aid)


@app.route("/uparticle", methods=["GET", "POST"])
def uparticle():
    aid = request.form.get("aid")
    title = request.form.get("title")
    author = request.form.get("author")
    time = request.form.get("time")
    con = request.form.get("con")
    return up_article_api(aid, title, author, time, con)


@app.route('/get_profiles', methods=['GET'])
def get_profiles():
    category = request.args.get('category')
    return get_profile(category)


@app.route('/saveprofile', methods=['POST'])
def saveprofile():
    category = request.args.get('category')  # 获取分类参数
    content = request.form.get('con')  # 获取文章内容
    return save_profile(category, content)


@app.route("/upprofile", methods=["GET", "POST"])
def upprofile():
    # 获取图片对象
    file_obj = request.files.get("file")
    return up_profile_pic_api(file_obj)


@app.route('/company_data', methods=['GET'])
def get_company_data():
    # 从数据库中获取公司数据，这里假设只有一条记录
    company_data = company.query.first()

    if not company_data:
        return jsonify({'error': 'Company data not found'}), 404

    # 将公司数据转换为字典格式并返回
    company_data_dict = {
        'com_profile': company_data.com_profile,
        'legal_profile': company_data.legal_profile,
        'com_culture': company_data.com_culture,
        'honour': company_data.honour
    }

    return jsonify(company_data_dict), 200


@app.route('/get_contact', methods=['GET'])
def get_contact():
    contact_data = contact.query.first()  # 假设只有一条联系我们的数据，可以根据需要修改查询逻辑
    if not contact_data:
        return jsonify({'error': 'Contact data not found'}), 404
    return jsonify({
        'phones': contact_data.phone,
        'fax': contact_data.fax,
        'email': contact_data.email,
        'address': contact_data.address
    })


@app.route("/update_contact", methods=["POST"])
def update_contact_data():
    try:
        data = request.json
        contact_data = contact.query.first()  # 假设只有一条联系我们的数据，可以根据需要修改查询逻辑

        # 更新联系信息
        contact_data.phone = data.get('phones')
        contact_data.fax = data.get('fax')
        contact_data.email = data.get('email')
        contact_data.address = data.get('address')

        # 提交更改到数据库
        db.session.commit()

        return jsonify({"message": "联系信息更新成功！"})
    except Exception as e:
        db.session.rollback()  # 出现错误时回滚会话，以保持数据库状态一致
        return jsonify({'error': '联系信息更新失败！'}), 404


if __name__ == '__main__':
    app.run(host="127.0.0.1", port=5000)
