import re
from flask_wtf import Form
from flask_wtf.html5 import EmailField
from wtforms import TextField, PasswordField, BooleanField
from wtforms.validators import DataRequired, ValidationError
from app.models import User
from hashlib import md5


class RegisterForm(Form):

    nickname = TextField('nickname', validators=[DataRequired()])

    email = EmailField('email', validators=[DataRequired()])

    password = PasswordField('password', validators=[DataRequired()])

    confirm = PasswordField('confirm', validators=[DataRequired()])

    def validate_nickname(self, field):

        nickname = field.data.strip()

        if len(nickname) < 3 or len(nickname) > 63:

            raise ValidationError('nickname must be 3-63 letters.')

        elif not re.search(r'^\w+$', nickname):

            raise ValidationError('User names can contain only alpha-numeric characters and underscores.')