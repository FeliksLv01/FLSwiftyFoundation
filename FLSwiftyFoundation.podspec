Pod::Spec.new do |s|
  s.name             = 'FLSwiftyFoundation'
  s.version          = '0.0.5'
  s.summary          = 'FLSwiftyFoundation.'
  s.homepage         = 'https://github.com/felikslv01/FLSwiftyFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'felikslv' => 'felikslv@163.com' }
  s.source           = { :git => 'https://github.com/felikslv01/FLSwiftyFoundation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  
  s.source_files = 'FLSwiftyFoundation/Classes/**/*'
  s.dependency 'RxSwift', '6.5.0'
end
