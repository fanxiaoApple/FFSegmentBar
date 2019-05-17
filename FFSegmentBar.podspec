#
# Be sure to run `pod lib lint FFSegmentBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FFSegmentBar'
  s.version          = '0.0.1'
  s.summary          = 'segment bar'

  s.description      = <<-DESC
segment bar...
                       DESC

  s.homepage         = 'https://github.com/fanxiaoApple/FFSegmentBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaoApple' => 'XF_MBP@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaoApple/FFSegmentBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FFSegmentBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FFSegmentBar' => ['FFSegmentBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
