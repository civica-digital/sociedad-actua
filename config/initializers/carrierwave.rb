CarrierWave.configure do |config|
  if Rails.env.production?
    config.aws_credentials = {
      :access_key_id      => ENV['AWS_KEY'],
      :secret_access_key  => ENV['AWS_SECRET'],
      :region                 => ENV['AWS_REGION']
    }
    config.aws_bucket = ENV['S3_BUCKET']
    config.aws_acl = 'public-read'
  end



  config.permissions = 0600

  config.storage(Rails.env.development? || Rails.env.test? ? :file : :aws)
  config.enable_processing = false if Rails.env.test?
end
