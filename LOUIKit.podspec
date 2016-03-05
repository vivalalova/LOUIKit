
Pod::Spec.new do |s|
  s.name         = "LOUIKit"
  s.version      = '0.0.3'
  s.summary      = "iOS UIKit extension" 
  s.homepage     = 'https://github.com/vivalalova/LOUIKit'
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "vivalalova" => "vivalalova0@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/vivalalova/LOUIKit.git", :tag => '0.0.1' }
  s.source_files  = "LOUIKit/LOUIKit/*"
  s.framework   = 'UIKit'
  s.requires_arc = true
end
