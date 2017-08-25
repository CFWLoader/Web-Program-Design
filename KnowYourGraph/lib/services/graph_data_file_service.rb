module GraphDataFileService

  def self.refresh_graph_data_file_tag graph_data_file_desc, tags

    tags.each{ |tag| unless graph_data_file_desc.tags.include? tag then graph_data_file_desc.tags << tag end }

  end

end