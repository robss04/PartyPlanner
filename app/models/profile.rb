class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  
  mount_uploader :image, AvatarUploader
  
  field :name
  field :city, type: String
  field :state, type: String
  field :phone_number, type: Integer
  field :travel_booked, type: Boolean, default: false
  field :image
  
end
