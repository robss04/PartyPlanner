class Todo
  include Mongoid::Document
  
  belongs_to :user
  belongs_to :event

  field :task, type: String
  field :task_duedate('%m/%d/%Y'), type: Time
  # field :task_owner, type: String
end


