AWS::S3::Base.establish_connection!(
   :access_key_id => "AKIAJQBUPSST5FJP2WBQ",
   :secret_access_key => "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"
)

bucket = "mangudi"
bucket = "mangudiprod" if Rails.env == "production"
GlobalBucket = "mangudi"

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJQBUPSST5FJP2WBQ',                        # required
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = bucket                     # required
end