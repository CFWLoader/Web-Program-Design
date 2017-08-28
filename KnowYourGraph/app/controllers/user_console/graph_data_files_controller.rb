require 'services/native_file_service'

class UserConsole::GraphDataFilesController < ApplicationController

  before_action :set_graph_data_file, only: [:show, :edit, :destroy, :update]

  def index

    @data_source_files = GraphDataFile.where(uploader_id: session[:user]['_id']['$oid'])

  end

  def show
  end

  def edit
  end

  def update

    filename = params['graph_data_file']['file_name']
    vertices = params['graph_data_file']['vertices'].to_i
    edges = params['graph_data_file']['edges'].to_i
    tags = params['graph_data_file']['tags'].split ' '

    @graph_data_file.file_name = filename
    @graph_data_file.vertices = vertices
    @graph_data_file.edges = edges

    @graph_data_file.tags = []

    tags.each {|tag| @graph_data_file.tags << tag}

    @graph_data_file.update

    respond_to {|format|

      format.html {redirect_to "/user_console/graph_data_files/#{@graph_data_file.id}/edit"}

    }

  end

  def destroy

    file_path = NativeFileService::get_physical_path @graph_data_file._id

    File.delete file_path

    @graph_data_file.destroy

    respond_to do |format|
      # format.html {redirect_to users_url, notice: 'File was successfully destroyed.'}
      format.json {render json: {message: 'succeeded'}}
    end

  end

  private

  def set_graph_data_file

    @graph_data_file = GraphDataFile.find(params[:id])

  end

end
