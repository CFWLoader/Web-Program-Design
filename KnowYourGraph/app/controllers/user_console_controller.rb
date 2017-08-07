class UserConsoleController < ApplicationController

  def index

    if session[:user].nil?
      redirect_to users_login_url
    end

  end

end
