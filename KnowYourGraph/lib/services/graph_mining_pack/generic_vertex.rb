class GenericVertex

  attr_reader :vertex_id

  attr_accessor :neighbors, :weight

  def initialize vertex_id, weight = 1.0, neighbors = {}

    @vertex_id = vertex_id

    @weight = weight

    @neighbors = neighbors

  end

  def add_neighbor! vertex_id, weight = 1.0

    @neighbors[vertex_id] = weight

  end

  def has_neighbor? vertex_id

    @neighbors.has_key? vertex_id

  end

  def delete_neighbor!

    @neighbors.delete vertex_id

  end

  # def self.included x
  #
  #   ms = x.instance_methods(false)
  #
  #   [:add_neighbor!, :has_neighbor?, :delete_neighbor!].each {|method_sym|
  #
  #     raise "#{method_sym} should be implement in sub-class or sub-module." unless ms.include?(method_sym)
  #
  #   }
  #
  # end

end