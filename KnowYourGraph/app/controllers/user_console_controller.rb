require 'services/native_file_service'

class UserConsoleController < ApplicationController

  def index

    if session[:user].nil?
      redirect_to users_login_url
    end

  end

  # def tasks
  #
  #   @tasks_list = TaskDetail.find_all_by_initiator_id session[:user]['id']
  #
  # end

  def upload_data_source

    uploaded = params[:file]

    graph_data_file = GraphDataFile.new

    graph_data_file.uploader_id= session[:user]['_id']['$oid']

    graph_data_file.file_name= uploaded.original_filename

    graph_data_file.file_size= uploaded.size

    graph_data_file.vertices= 0

    graph_data_file.edges= 0

    graph_data_file.save

    File.open(File.join(NativeFileService::get_physical_path graph_data_file.id), 'w') { |native_file|
      native_file.write(uploaded.read)
    }

  end

end
