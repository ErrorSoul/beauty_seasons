CarrierWave.configure do |config|
  config.storage = Rails.env.production? ? :fog : :file
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJ47LFAYY3EOJR5CA',
    aws_secret_access_key: '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',
    region: 'us-west-2'
  }
    #config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_directory = 'afinance'
end
