CarrierWave.configure do |config|
  #if Rails.env.production?
  #  config.storage = :file
  #elsif Rails.env.test?
  #  config.storage = :file
  #  config.enable_processing = false
  #else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV['aws_access_key_id'],
      aws_secret_access_key:  ENV['aws_secret_access_key_id'],
      region:                 "eu-central-1"
    }
    config.fog_directory  = ENV['s3_bucket_name']
  #end
end
