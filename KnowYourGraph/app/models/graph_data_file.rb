class GraphDataFile

  include MongoMapper::Document

  key :uploader_id, String
  key :file_name, String
  key :file_size, Integer
  key :vertices, Integer
  key :edges, Integer

end