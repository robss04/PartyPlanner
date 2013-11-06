class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessor :password, :password_confirmation

  
  mount_uploader :image, AvatarUploader

  has_many :todos

  
  field :id, type: String
  
  field :name, type: String
  field :email, type: String
  
  field :salt, type: String
  field :fish, type: String
  
  field :code, type: String
  field :expires_at, type: Time
  
  before_save :encrypt_password
  
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  field :name
  field :city, type: String
  field :state, type: String
  field :phone_number, type: String
  field :travel_booked, type: Boolean, default: false
  field :image
  
  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end
  
  private
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end