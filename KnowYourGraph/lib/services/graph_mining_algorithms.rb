require 'services/native_file_service'
require 'services/graph_mining_pack/simple_sorted_digraph'

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

  def self.simple_graph_counter input

    edge_count = 0
    vertices_count = 0

    input.each {|line|

      vertices_count += 1

      edge_count += line.split(' ').size - 1

    }

    return vertices_count, edge_count

  end

  def self.page_rank_light_demo input, output, options = {}

    iteration_limit = options['convergent_iteration']

    top_k = options['top_k']

    damping_factor = options['damping_factor'].nil? ? 0.85 : options['damping_factor']

    iteration_count = 0

    simple_sorted_digraph = SimpleSortedDigraph.new input

    top_k = simple_sorted_digraph.size if top_k == -1

    current_pr_vals = Array.new simple_sorted_digraph.size + 1, 0

    next_pr_vals = Array.new simple_sorted_digraph.size + 1, 1

    next_pr_vals[0] = 0

    while iteration_count < iteration_limit

      next_pr_vals.each_with_index {|val, idx|

        current_pr_vals[idx] = val

        next_pr_vals[idx] = 1.0 - damping_factor

      }

      simple_sorted_digraph.each_with_index {|neighbors, idx|

        neighbors.each{|neighbor|
          next_pr_vals[neighbor] += current_pr_vals[idx] * damping_factor / neighbors.size
        }

      }

      iteration_count += 1

    end

    1.upto(top_k) {

      max_pr_val = next_pr_vals[1]

      max_pr_idx = 1

      next_pr_vals[1..simple_sorted_digraph.size].each_with_index {|pr_val, idx|

        if pr_val > max_pr_val

          max_pr_idx = idx + 1

          max_pr_val = pr_val

        end

      }

      output.puts "#{max_pr_idx} #{max_pr_val}"

      next_pr_vals[max_pr_idx] = 0

    }

  end

  def self.page_rank input, output, options = {}

    iteration_limit = options['con_iter']

    top_k = options['top_k']

    damping_factor = 0.85

    iteration_count = 1

    simple_sorted_digraph = SimpleSortedDigraph.new input

    p simple_sorted_digraph.size

    while iteration_count < iteration_limit

      iteration_count += 1
    end

  end

end