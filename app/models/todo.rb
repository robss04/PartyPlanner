class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :event

  field :task, type: String
  field :task_duedate, type: Time
  # field :task_owner, type: String
end


	