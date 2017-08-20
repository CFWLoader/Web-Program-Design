require 'services/native_file_service'

class UserConsole::GraphDataFilesController < ApplicationController

  before_action :set_graph_data_file, only: [:show, :destroy]

  def show
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