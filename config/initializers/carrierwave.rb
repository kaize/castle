CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJHNHLUQ5QCQMWP5A',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'dvorec73'
  config.fog_host       = 'https://s3.amazonaws.com'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end