class UserConsole::DemoController < ApplicationController
  def index
  end

  def page_rank_prepare

    # @data_source_files = GraphDataFile.find_by_uploader_id(session[:user]['id']);
    @data_source_files = GraphDataFile.find_all_by_uploader_id(session[:user]['id'])

  end
end
