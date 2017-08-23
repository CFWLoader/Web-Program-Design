# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version: 2.3.3p222

### System dependencies: 
* Run `bundle install` command should fix the dependencies.

### Configuration
* `Upload` store directory is configured in `config/environments/{development.rb, production.rb}` option `config.upload_base` respectively.
* The project's database is using `mongodb-3.4.2` and the ORM is `mongoid`. The default database connection uses no-user. If your database has username and password, please configure it.

### Database creation
* The project is under alpha mode, visit `${host}/users/new` to create users then visit `${host}/users/login` to login the system. Enjoy it!

### Database initialization

### How to run the test suite

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions
* Create `${Rails.application.config.upload_base}` and `${Rails.application.config.upload_base}/result` by `mkdir` command.
* Ensure the database connection.
* `gem install passenger`
* (Optional) `passenger-install-nginx-module` and select option 1 to install nginx. Or you can install `nginx` manually.
* Configure `${NGINX_HOME}/conf/nginx.conf`. Set `passenger_enabled on;` and `rails_env production;`. Configure `${NGINX_WEB_ROOT}` to `${PROJECT_DIRECTORY}/public;`.
* Enter `${PROJECT_DIRECTORY}` and execute command `rake assets:precompile`.
* After the deployment, any web browser could visit the web app.

* ...
