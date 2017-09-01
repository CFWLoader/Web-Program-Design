module GraphDataFileLoader

  def self.load_directed_unweighted_edges input, integer_id = false

    graph = GenericGraph.new

    input.each {|line|

      from_id, to_id = line.split ' '

      graph.add_node! from_id, GenericVertex.new (from_id) unless graph.include? from_id

      graph.add_node! to_id, GenericVertex.new(to_id) unless graph.include? to_id

      graph[from_id].add_neighbor! graph[to_id]

    }

    graph

  end

  def self.load_undirected_unweighted_edges input, integer_id = false

    graph = GenericGraph.new

    input.each {|line|

      from_id, to_id = line.split ' '

      graph.add_node! from_id, GenericVertex.new (from_id) unless graph.include? from_id

      graph.add_node! to_id, GenericVertex.new(to_id) unless graph.include? to_id

      graph[from_id].add_neighbor! graph[to_id]

      graph[to_id].add_neighbor! graph[from_id]

    }

    graph

  end

end