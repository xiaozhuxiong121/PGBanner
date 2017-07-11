Pod::Spec.new do |s|
  s.name         = "PGBanner"
  s.version      = "1.0.2"
  s.summary      = "自定义控件无限轮播。"
  s.homepage     = "https://github.com/xiaozhuxiong121/PGBanner"
  s.license      = "MIT"
  s.author       = { "piggybear" => "piggybear_net@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/xiaozhuxiong121/PGBanner.git", :tag => s.version }
  s.source_files = "PGBanner", "PGBanner/**/*.{h,m}"
  s.frameworks   = "UIKit"
  s.requires_arc = true
end
 
