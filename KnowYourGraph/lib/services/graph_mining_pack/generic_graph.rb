class GenericGraph

  def initialize

    @nodes = {}

  end

  def include? node_id

    @nodes.include? node_id

  end

  def add_node! node_id, node_cont

    unless @nodes.has_key? node_id

      @nodes[node_id] = node_cont

    end

  end

  def delete! node_id

    @nodes.delete node_id if @nodes.has_key? node_id

  end

  def [] node_id

    if @nodes.has_key? node_id

      @nodes[node_id]

    else

      nil

    end

  end

  def each_pair

    if block_given?

      @nodes.each_pair {|k, v| yield k, v}

    else

      @nodes.each_pair

    end

  end

  def each_key

    if block_given?

      @nodes.each_key {|k| yield k}

    else

      @nodes.each_key

    end

  end

  def each_value

    if block_given?

      @nodes.each_value {|k| yield k}

    else

      @nodes.each_value

    end

  end

  def size_of_nodes

    @nodes.size

  end

  def size_of_edges

    counter = 0

    @nodes.each_value {|v|

      counter += v.neighbors.size

    }

    counter

  end

end