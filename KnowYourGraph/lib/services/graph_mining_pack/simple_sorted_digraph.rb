=begin
This digraph only accecpts sorted vertex number graph. And this requires the number of vertices in this graph.
The file content should be assembled as the following:
1 2     => This means node 1 has only one neighbors: node 2.
2 3 4   => Node 2 has 2 neigbors
3 4     => Node 3 has neighbors 4
4       => No neighbors but has to present in the file.
=end
class SimpleSortedDigraph

  def initialize input_file

    @nodes = [[]]

    input_file.each {|line|

      line_array = line.split ' '

      line_array.shift

      neighbors = []

      line_array.each {|node|

        neighbors << node.to_i

      }

      @nodes << neighbors

    }

  end

  def size

    @nodes.size - 1

  end

  def each

    if block_given?
      @nodes[1..self.size].each { |neighbors|
        yield neighbors
      }
    else
      @nodes[1..self.size].each
    end

  end

  def each_with_index

    idx = 1

    if block_given?
      @nodes[1..self.size].each { |neighbors|

        yield neighbors, idx

        idx += 1

      }
    else
      @nodes.each_with_index
    end

  end

end