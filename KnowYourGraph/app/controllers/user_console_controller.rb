class UserConsoleController < ApplicationController

  def index

    if session[:user].nil?
      redirect_to users_login_url
    end

  end

  def upload_data_source

    uploaded = params[:file]

    graph_data_file = GraphDataFile.new

    graph_data_file.uploader_id= session[:user]['id']

    graph_data_file.file_name= uploaded.original_filename

    graph_data_file.file_size= uploaded.size

    graph_data_file.vertices= 0

    graph_data_file.edges= 0

    graph_data_file.save

    File.open(File.join('/home/CFWLoader/upload_test', graph_data_file.id), 'w') { |native_file|
      native_file.write(uploaded.read)
    }

  end

end
