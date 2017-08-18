require 'services/native_file_service'
require 'services/data_mining_algorithms'

class UserConsole::DemoController < ApplicationController
  def index
  end

  def page_rank_prepare

    # @data_source_files = GraphDataFile.find_by_uploader_id(session[:user]['id']);
    @data_source_files = GraphDataFile.find_all_by_uploader_id(session[:user]['id'])

  end

  def page_rank

    input_file = File.open(NativeFileService.get_physical_path(params['req_file']), 'r')

    output_file = File.open('/home/CFWLoader/upload_test/result/' + params['req_file'] + '.lock', 'w')

    pr_params = {}

    if params['convergent_iteration'].nil? or params['convergent_iteration'] == ''
      pr_params['con_iter'] = 5
    else
      pr_params['con_iter'] = params['convergent_iteration'].to_i
    end

    if params['top_k'].nil? or params['top_k'] == ''
      pr_params['top_k'] = -1
    else
      pr_params['top_k'] = params['top_k'].to_i
    end

    DataMiningAlgorithms::page_rank input_file, output_file, pr_params

    input_file.close

    output_file.close

    File.rename output_file.path, '/home/CFWLoader/upload_test/result/' + params['req_file'] + '.rslt'

  end

end
