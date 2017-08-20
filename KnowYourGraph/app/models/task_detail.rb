class TaskDetail

  include MongoMapper::Document

  key :initiator_id, String
  key :file_id, String
  key :task_state, String
  key :task_params, Hash

  timestamps!

end