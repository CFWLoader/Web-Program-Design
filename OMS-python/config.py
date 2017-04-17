import os

SQLALCHEMY_TRACK_MODIFICATIONS = True                                              # Shutdown the warning.

basedir = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_DATABASE_URI = 'sqlite:///%s' % (os.path.join(basedir, 'app.db'))

SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')

CSRF_ENABLED = True

SECRETE_KEY = 'you-will-never-guess'