from app import app
from app.models import User, Post, ROLE_USER, ROLE_ADMIN

@app.route('/')
def index():
    return 'hello world, hello flask!'