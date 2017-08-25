class GraphDataFile

  include Mongoid::Document
  include Mongoid::Timestamps

  field :uploader_id, type: String
  field :file_name, type: String
  field :file_size, type: Integer
  field :vertices, type: Integer
  field :edges, type: Integer
  field :tags, type: Array, default: []

end