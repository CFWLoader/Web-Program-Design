from hashlib import md5

from flask import render_template, flash, redirect, session, url_for, request, g
from app import app, db, login_manager
from app.forms import RegisterForm, LoginForm
from app.models import User, Post, ROLE_USER, ROLE_ADMIN
from flask_login import login_user, logout_user, current_user, login_required

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


@login_manager.user_loader
def load_user(userid):

    return User.query.get(userid)


@app.route('/account/signin', methods=['GET', 'POST'])
def signin():

    form = LoginForm()

    if request.method == 'POST':

        if form.validate_on_submit():

            nickname = form.data['nickname']

            psdmd5 = md5(form.data['password'])

            password = psdmd5.hexdigest()

            remember_me = form.data['remember_me']

            u = User.query.filter_by(nickname=nickname, password=password).first()

            if u is not None:

                login_user(user=u, remember=remember_me)

                flash('Signin successful.')

                return redirect(request.args.get('next') or url_for('index'))

            else:

                flash(u'Nickname or password error.')

                return render_template('signin.html', form=form)

@app.route('/account/signout')
@login_required
def signout():

    logout_user()

    flash('Signout successful.')

    return redirect(url_for('index'))

@app.errorhandler(404)
def internal_error(error):

    return render_template('404.html'), 404


# @app.route('/account/signin', methods=['GET', 'POST'])
# def signin():
#
#     form = LoginForm()
#
#     if request.method == 'POST':
#
#         if form.validate_on_submit():
#
#             nickname = form.data['nickname']
#
#             psdmd5 = md5(form.data['password'])
#
#             password = psdmd5.hexdigest()
#
#             u = User.query.filter_by(nickname=nickname, password=password).first()
#
#             if u is not None:
#
#                 session['signin'] = True
#
#                 flash('Signin successful.')
#
#                 return redirect(url_for('index'))
#
#             else:
#
#                 flash(u'Nickname or password error.')
#
#                 return render_template('signin.html', form=form)
#
#
# @app.route('/account/signout')
# def signout():
#
#     session.pop('signin', None)
#
#     flash('Signout successful.')
#
#     return redirect('index')


@app.errorhandler(500)
def internal_error(error):

    db.session.roll_back()

    return render_template('500.html'), 500

