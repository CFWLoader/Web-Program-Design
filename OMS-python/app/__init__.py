import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from config import basedir

app = Flask(__name__)                               # Creating a flask object.

app.config.from_object('config')                   # Loading the configurations.

db = SQLAlchemy(app)                                # Initialize the db object.

login_manager = LoginManager()                      # Initialize the manager object.

login_manager.init_app(app)

login_manager.login_view = 'signin'

login_manager.login_message = u'Bonvolu ensaluti por uzi tio paĝo.'

from app import views                              # import views.