CarrierWave.configure do |config|
  config.storage = :file
  config.root = Rails.root.join('public')
end