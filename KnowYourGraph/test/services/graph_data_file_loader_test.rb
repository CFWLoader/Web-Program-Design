require '../../lib/services/graph_data_file_loader.rb'

class GraphDataFileLoaderTest

  def self.generate_no_weight_edges path, vertices_lim, link_prob

    out = open path, 'w'

    1.upto(vertices_lim){|node_num|

      unless rand < link_prob

        to = rand vertices_lim

        if to == node_num
          next
        end

        out.puts "#{node_num} #{to}"

      end

    }

    out.close

  end

  def self.test_load_directed_unweighted_edges

    file_path = './load_directed_unweighted_edges.txt'

    generate_no_weight_edges file_path, 100, 0.25

    graph = GraphDataFileLoader::load_directed_unweighted_edges file_path

    p graph.size_of_nodes

    p graph.size_of_edges

  end

end

if $0 == __FILE__

  GraphDataFileLoaderTest::test_load_directed_unweighted_edges

end