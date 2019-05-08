Pod::Spec.new do |s|
  s.name             = "SnowFallView"
  s.version          = "0.3.0"
  s.summary          = "UIView subclass where beautiful snow is falling"

  s.homepage         = "https://github.com/minorblend/SnowFallView"
  s.license          = 'MIT'
  s.author           = { "Josh Ha-Nyung Chung" => "minorblend@gmail.com" }
  s.source           = { :git => "https://github.com/minorblend/SnowFallView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/minorblend'
  s.swift_versions   = ['4.2','5.0']

  s.platform     = :ios, '10.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = ['Pod/Assets/*.xcassets']

  s.frameworks = 'UIKit', 'CoreGraphics'
end
