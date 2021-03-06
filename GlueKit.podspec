Pod::Spec.new do |spec|
  spec.name         = 'GlueKit'
  spec.version      = '0.1.0-alpha.1'
  spec.ios.deployment_target = "9.3"
  spec.osx.deployment_target = "10.11"
  spec.tvos.deployment_target = "10.0"
  spec.watchos.deployment_target = "3.0"
  spec.summary      = 'Type-safe observable values and collections in Swift'
  spec.author       = 'Károly Lőrentey'
  spec.homepage     = 'https://github.com/lorentey/GlueKit'
  spec.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  spec.source       = { :git => 'https://github.com/lorentey/GlueKit.git', :tag => 'v0.1.0-alpha.1' }
  spec.source_files = 'Sources/*.swift'
  spec.social_media_url = 'https://twitter.com/lorentey'
  #spec.documentation_url = 'http://lorentey.github.io/GlueKit/'
  spec.dependency 'BTree', '~> 4.0'
  spec.dependency 'SipHash', '~> 1.0'
end
