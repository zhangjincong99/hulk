from db import *


class message(db.Model):
    __tablename__ = 'message'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20))
    phone = db.Column(db.String(20))
    content = db.Column(db.Text)
    created_tm = db.Column(db.DateTime)


class manageuser(db.Model):
    __tablename__ = 'manageuser'

    uid = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(25))
    password = db.Column(db.String(25))


class news(db.Model):
    __tablename__ = 'news'

    nid = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50))
    author = db.Column(db.String(50))
    content = db.Column(db.Text)
    time = db.Column(db.Date)
    image_url = db.Column(db.String(255))


class company(db.Model):
    __tablename__ = 'company'

    cid = db.Column(db.Integer, primary_key=True)
    com_profile = db.Column(db.Text)
    legal_profile = db.Column(db.Text)
    com_culture = db.Column(db.Text)
    honour = db.Column(db.Text)


class contact(db.Model):
    __tablename__ = 'contact'

    id = db.Column(db.Integer, primary_key=True)
    phone = db.Column(db.String(20))
    fax = db.Column(db.String(30))
    email = db.Column(db.String(50))
    address = db.Column(db.String(100))
