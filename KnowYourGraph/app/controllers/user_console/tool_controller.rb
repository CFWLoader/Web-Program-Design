require 'services/native_file_service'
require 'services/graph_mining_algorithms'
require 'services/graph_data_file_service'

class UserConsole::ToolController < ApplicationController
  def metis_prepare
  end

  def metis
  end

  def analyzer_prepare

    @data_source_files = GraphDataFile.where(uploader_id: session[:user]['_id']['$oid'])

  end

  def analyzer

    file_id = params['req_file']

    file_type_tags = params['file_type'].split ' '

    file_type_tags << 'Examined'

    graph_file_desc = GraphDataFile.find file_id

    graph_file = File.open NativeFileService::get_physical_path(file_id), 'r'

    v, e = GraphMiningAlgorithms::simple_graph_counter graph_file

    graph_file.close

    graph_file_desc.vertices= v
    graph_file_desc.edges= e

    GraphDataFileService::refresh_graph_data_file_tag graph_file_desc, file_type_tags

    graph_file_desc.save

  end

  def rehasher_prepare
  end

  def rehasher
  end
end
