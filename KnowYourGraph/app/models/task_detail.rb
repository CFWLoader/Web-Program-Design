class TaskDetail

  include Mongoid::Document
  include Mongoid::Timestamps

  field :brief, type: String
  field :initiator_id, type: String
  field :file_id, type: String
  field :task_state, type: String
  field :task_params, type: Hash, default: {}
  field :outputs, type: Hash, default: {}

end