class GenericVertex

  attr_reader :vertex_id

  attr_accessor :neighbors, :weight

  def initialize vertex_id, weight = 1.0, neighbors = {}

    @vertex_id = vertex_id

    @weight = weight

    @neighbors = neighbors

  end

  def add_neighbor! new_neighbor, weight = 1.0

    @neighbors[new_neighbor] = weight

  end

  def include? vertex_id

    @neighbors.has_key? vertex_id

  end

  def delete_neighbor! vertex_id

    @neighbors.delete vertex_id

  end

end