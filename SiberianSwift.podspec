Pod::Spec.new do |s|
  s.name             = 'SiberianSwift'
  s.version          = '1.0.4'
  s.summary          = 'SiberianSwift is a bunch of extensions for commonly used classes.'
  s.description      = 'SiberianSwift is a bunch of extensions for commonly used classes. UIView, UIDevice, String, UIApplication, etc'

  s.homepage         = 'https://github.com/SergeyPetrachkov/SiberianSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sergey petrachkov' => 'petrachkovsergey@gmail.com' }
  s.source           = { :git => 'https://github.com/SergeyPetrachkov/SiberianSwift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SiberianSwift/Classes/**/*'
end
