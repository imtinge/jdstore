CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "yePnyZZjrmitQ_x5uqMw97RHUtBjrXblFtsBjY2e"
  config.qiniu_secret_key    = 'RpfPE0dxyKFB65StVk_6OnIzyyB5uWegQ_y7x'
  config.qiniu_bucket        = "fullstack"
  config.qiniu_bucket_domain = "oo8f5a2ka.bkt.clouddn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

  config.qiniu_up_host       = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
end