require 'services/native_file_service'

module GraphMiningAlgorithms

  # def self.parameterMapper httpReqForm
  #
  #   paras = {}
  #
  #   httpReqForm.each_pair {|k, v|
  #
  #     if k == "utf8" or k == "authenticity_token"
  #       next
  #     elsif k == "req_file"
  #       paras["file_path"] = NativeFileService::get_physical_path v
  #     else
  #       paras[k]=v
  #     end
  #   }
  #
  #   paras
  #
  # end

  def self.page_rank input, output, options = {}

    iteration_limit = options['con_iter']

    top_k = options['top_k']

    damping_factor = 0.85

    iteration_count = 1

    while iteration_count < iteration_limit

      iteration_count += 1
    end
    
  end

end