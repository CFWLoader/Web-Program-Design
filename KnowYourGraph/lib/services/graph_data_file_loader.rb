require '/home/CFWLoader/Projects/Web-Demos/KnowYourGraph/lib/services/graph_mining_pack/generic_graph.rb'
require '/home/CFWLoader/Projects/Web-Demos/KnowYourGraph/lib/services/graph_mining_pack/generic_vertex.rb'


module GraphDataFileLoader

  def self.load_directed_unweighted_edges input, integer_id = false

    graph = GenericGraph.new

    input.each {|line|

      from_id, to_id = line.split ' '

      from_id.to_i if integer_id

      to_id.to_i if integer_id

      unless graph.include? from_id

        tmp = GenericVertex.new from_id

        graph.add_node! from_id, tmp

      end

      unless graph.include? to_id

        tmp = GenericVertex.new to_id

        graph.add_node! to_id, tmp

      end

      graph[from_id].add_neighbor! graph[to_id]

    }

    graph

  end

  def self.load_undirected_unweighted_edges input, integer_id = false

    graph = GenericGraph.new

    input.each {|line|

      from_id, to_id = line.split ' '

      from_id.to_i if integer_id

      to_id.to_i if integer_id

      unless graph.include? from_id

        tmp = GenericVertex.new from_id

        graph.add_node! from_id, tmp

      end

      unless graph.include? to_id

        tmp = GenericVertex.new(to_id)

        graph.add_node! to_id, tmp

      end

      graph[from_id].add_neighbor! graph[to_id]

      graph[to_id].add_neighbor! graph[from_id]

    }

    graph

  end

end