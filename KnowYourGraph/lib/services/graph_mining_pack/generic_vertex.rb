module GenericVertex

  attr_reader :vertex_id

  # attr_accessor :neighbors, :weight

  def initialize vertex_id

    @vertex_id = vertex_id

    # @weight = weight
    #
    # @neighbors = neighbors

  end

  def add_neighbor!

  end

  def has_neighbor?

  end

  def delete_neighbor!

  end

  def self.included x

    ms = x.instance_methods(false)

    [:add_neighbor!, :has_neighbor?, :delete_neighbor!].each {|method_sym|

      raise "#{method_sym} should be implement in sub-class or sub-module." unless ms.include?(method_sym)

    }

  end

end