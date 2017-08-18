class UserConsoleController < ApplicationController

  def index

    if session[:user].nil?
      redirect_to users_login_url
    end

  end

  def upload_data_source

    uploaded = params[:file]

    File.open(File.join('/home/CFWLoader/upload_test', uploaded.original_filename), 'w') { |native_file|
      native_file.write(uploaded.read)
    }

  end

end
