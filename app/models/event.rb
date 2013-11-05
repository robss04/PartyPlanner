class Event
  include Mongoid::Document

  has_many :todos

  field :event_name
  field :event_location, type: String
  field :event_date, type: String
  field :travel_required, type: Boolean, default: false
end