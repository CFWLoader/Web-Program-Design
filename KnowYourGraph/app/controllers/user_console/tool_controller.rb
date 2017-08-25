class UserConsole::ToolController < ApplicationController
  def metis_prepare
  end

  def metis
  end

  def analyzer_prepare

    @data_source_files = GraphDataFile.where(uploader_id: session[:user]['_id']['$oid'])

  end

  def analyzer
  end

  def rehasher_prepare
  end

  def rehasher
  end
end
