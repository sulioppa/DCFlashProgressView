Pod::Spec.new do |s|
  s.name             = 'DCFlashProgressView'
  s.version          = '1.0.0'
  s.summary          = 'DC Flash Logo'
  
  s.description      = <<-DESC
    DC Flash Logo.
  DESC
  
  s.homepage         = 'https://github.com/sulioppa/DCFlashProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'author' => 'sulioppa@icloud.com' }
  s.source           = { :git => 'https://github.com/sulioppa/DCFlashProgressView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '3.0'
  s.source_files = 'DCFlashProgressView/**/*'
  
end
