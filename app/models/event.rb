class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  has_many :todos
  has_many :users
  belongs_to :created_by, class_name: "User"
  
  field :event_name, type: String
  field :bride_name, type: String
  field :event_location, type: String
  field :event_date, type: Date
  field :event_type, type: String
  field :event_venue, type: String
  field :event_time, type: Time
  field :hotel, type: String
  field :flight_carrier, type: String
  field :flight_number, type: String
  field :date_start, type: Date
  field :date_end, type: Date

end
