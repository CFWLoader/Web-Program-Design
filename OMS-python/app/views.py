from hashlib import md5

from flask import render_template, flash, redirect, session, url_for, request, g
from app import app, db
from app.forms import RegisterForm
from app.models import User, Post, ROLE_USER, ROLE_ADMIN

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/adduser/<nickname>/<email>')
def add_user(nickname, email):

    u = User(nickname=nickname, email=email)

    try:

        db.session.add(u)

        db.session.commit()

        return 'Add successful.'

    except Exception as e:

        return 'Wrong.'


@app.route('/getuser/<nickname>')
def get_user(nickname):

    user = User.query.filter_by(nickname=nickname).first()

    return render_template('user.html', user=user)


@app.route('account/signup', methods=['GET', 'POST'])
def signup():

    form = RegisterForm()

    if request.method == 'POST':

        if form.validate_on_submit():

            psdmd5 = md5(form.data['password'])

            password = psdmd5.hexdigest()

            u = User(nickname=form.data['nickname'], email=form.data['email'], password=password)

            try:

                db.session.add(u)

                db.session.commit()

                flash('signup successful.')

            except Exception as e:

                return 'something goes wrong.'

        return redirect(url_for('signin'))

    return render_template('signup.html', form=form)


@app.errorhandler(404)
def internal_error(error):

    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_error(error):

    db.session.roll_back()

    return render_template('500.html'), 500