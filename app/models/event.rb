class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  has_many :todos
  has_many :users
  belongs_to :created_by, class_name: "User"
  
  field :event_name
  field :event_location, type: String
  field :event_date, type: Date
  field :travel_required, type: Boolean, default: false
  field :event_type, type: String
end