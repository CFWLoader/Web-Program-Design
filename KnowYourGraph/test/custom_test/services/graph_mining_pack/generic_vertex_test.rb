require '../../../../lib/services/graph_mining_pack/generic_vertex'

def test_mixin_checking

  noweight_vertex_class = Class.new do

    def initialize vertex_id

      GenericVertex.initialize vertex_id

    end

    def add_neighbor!

      p 'add_neighbor!'

    end

    def has_neighbor?

    end

    def delete_neighbor!

    end

    include GenericVertex

  end

  # noweight_vertex_class.define_method(:add_neighbor!){|neighbor| p :hello!}
  #
  # noweight_vertex_class.include GenericVertex

  nvc_ins = noweight_vertex_class.new 11

end

if __FILE__ == $0

  test_mixin_checking

end