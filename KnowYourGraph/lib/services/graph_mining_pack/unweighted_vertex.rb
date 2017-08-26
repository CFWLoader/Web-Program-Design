class UnweightedVertex

  attr_reader :vertex_id

  attr_accessor :neighbors

  def initialize vertex_id, neighbors = []

    @vertex_id = vertex_id

    @neighbors = neighbors

  end

  def add_neighbor! new_neighbor

    @neighbors << new_neighbor

  end

  def include? vertex_id

    @neighbors.include? vertex_id

  end

  def delete_neighbor! vertex_id

    @neighbors.delete vertex_id

  end

end