#
#  Be sure to run `pod spec lint CCCategory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "CCCategory"
s.version      = "0.1"
s.summary      = "共享一些常用的Category,目前包括(UIKit/Foundatio/QuartzCore/MapKit),后续会更新更多的Category方便大家使用."
s.homepage     = "https://github.com/CCFramework/CCCategory"

s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "MuZiLee" => "admin@sanshengit.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/CCFramework/CCCategory.git", :tag => "0.1" }
s.source_files  = "CCCategory", "Class/*.{h,m}"

s.framework  = "UIKit"

s.requires_arc = true
s.dependency "GTMBase64", "~> 1.0.0"

end
