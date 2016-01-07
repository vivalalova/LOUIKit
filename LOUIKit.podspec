
Pod::Spec.new do |s|
  s.name         = "LOUIKit"
  s.version      = '0.0.4'
  s.summary      = "iOS UIKit extension" 
  s.homepage     = 'https://github.com/vivalalova/LOUIKit'
  s.license      = 'MIT License'
  s.author       = { "vivalalova" => "vivalalova0@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/vivalalova/LOUIKit.git", :tag => '0.0.4' }
  s.source_files  = "LOUIKit/LOUIKit/*.{h,m}"
  s.framework   = 'UIKit'
  s.requires_arc = true
  s.dependency 'Masonry', '~> 0.6.4'
end
