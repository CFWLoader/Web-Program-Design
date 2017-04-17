import os
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
from config import basedir

app = Flask(__name__)                               # Creating a flask object.

app.config.from_object('config')                   # Loading the configurations.

db = SQLAlchemy(app)                                # Initialize the db object.

from app import views                              # import views.