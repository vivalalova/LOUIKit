
Pod::Spec.new do |s|

  s.name         = "LOUIKit"
  s.version      = "0.0.1"
  s.summary      = "iOS UIKit extension"

  s.description  = <<-DESC
                   A longer description of LOUIKit in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/vivalalova/LOUIKit"

  s.license      = 'MIT'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author      = { "vivalalova" => "vivalalova0@gmail.com" }
  s.platform    = :ios, "8.0"


  #s.source       = { :git => "https://github.com/vivalalova/LOUIKit.git", :commit => "38dd068bf0c1f13a9bdf35e5a39ffb101ee00004" }
  s.source       = { :git => "https://github.com/vivalalova/LOUIKit.git", :tag => '0.0.1' }


  s.source_files  = "LOUIKit/LOUIKit/*.{h,m}"
  # s.exclude_files = "LOUIKit/"
    s.frameworks   = "UIKit"
  s.requires_arc = true


end
