Aws.config.update({
  region: 'ap-northeast-1',
  credentials: Aws::Credentials.new('xxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxx'),
})

S3_BUCKET = Aws::S3::Resource.new.bucket('xxxxxxxxxxxxxxxx')