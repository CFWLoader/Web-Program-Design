class TaskDetail

  include Mongoid::Document
  include Mongoid::Timestamps

  field :initiator_id, type: String
  field :file_id, type: String
  field :task_state, type: String
  field :task_params, type: Hash
  field :outputs, type: Hash

end